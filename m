Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691F3B6D1C
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387870AbfIRT66 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:58 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46943 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389132AbfIRT66 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:58 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 7473BC151A;
        Wed, 18 Sep 2019 21:58:56 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 4/6] config : fix leaks on error paths
Date:   Wed, 18 Sep 2019 21:58:17 +0200
Message-Id: <20190918195819.7492-5-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918195819.7492-1-stefan@datenfreihafen.org>
References: <20190918195819.7492-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

We should make sure to free resources also on an error path.
Address sanitizer was really helpfull in findings and fixing
these leaks.
---
 config.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/config.c b/config.c
index 66567c8..58526d7 100644
--- a/config.c
+++ b/config.c
@@ -167,6 +167,7 @@ static struct iface *iface_create()
 static void iface_free(struct iface *iface)
 {
 	free(iface->ifaddrs);
+	free(iface->llinfo.addr);
 	free(iface);
 }
 
@@ -299,12 +300,17 @@ int config_load(const char *filename, struct list_head *ifaces)
 	lua_pushnil(L);
 	while (lua_next(L, -2) != 0) {
 		iface = iface_create();
-		if (!iface)
+		if (!iface) {
+			lua_close(L);
 			return -1;
+		}
 
 		lua_getfield(L, -1, "ifname");
-		if (!lua_isstring(L, -1))
+		if (!lua_isstring(L, -1)) {
+			iface_free(iface);
+			lua_close(L);
 			return -1;
+		}
 
 		strncpy(iface->ifname, lua_tostring(L, -1), IFNAMSIZ);
 		lua_pop(L, 1);
@@ -320,28 +326,38 @@ int config_load(const char *filename, struct list_head *ifaces)
 #endif
 		if (rc == -1) {
 			flog(LOG_ERR, "Failed to set forwarding");
+			iface_free(iface);
+			lua_close(L);
 			return -1;
 		}
 
 		iface->ifindex = if_nametoindex(iface->ifname);
 		if (iface->ifindex == 0) {
 			flog(LOG_ERR, "%s not found: %s", iface->ifname, strerror(errno));
+			iface_free(iface);
+			lua_close(L);
 			return -1;
 		}
 
 		nl_get_llinfo(iface->ifindex, &iface->llinfo);
 
 		rc = get_iface_addrs(iface->ifname, &iface->ifaddr, &iface->ifaddrs);
-		if (rc == -1)
+		if (rc == -1) {
+			iface_free(iface);
+			lua_close(L);
 			return rc;
+		}
 
 		/* TODO because compression might be different here... */
 		iface->ifaddr_src = &iface->ifaddr;
 		iface->ifaddrs_count = rc;
 
 		lua_getfield(L, -1, "dodag_root");
-		if (!lua_isboolean(L, -1))
+		if (!lua_isboolean(L, -1)) {
+			iface_free(iface);
+			lua_close(L);
 			return -1;
+		}
 
 		iface->dodag_root = lua_toboolean(L, -1);
 		lua_pop(L, 1);
-- 
2.21.0

