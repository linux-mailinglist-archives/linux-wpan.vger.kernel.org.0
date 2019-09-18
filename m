Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1500B6D1D
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732231AbfIRT67 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:59 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46946 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbfIRT67 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:59 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 08596C151F;
        Wed, 18 Sep 2019 21:58:56 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 5/6] socket: make sure we close our socket if setsockopt() fails
Date:   Wed, 18 Sep 2019 21:58:18 +0200
Message-Id: <20190918195819.7492-6-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918195819.7492-1-stefan@datenfreihafen.org>
References: <20190918195819.7492-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

If any of our setsockopt() calls fails we returned a -1 but
kept the socket available.

Fixes Coverity ID 250804
---
 socket.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/socket.c b/socket.c
index 866b544..e6bbb52 100644
--- a/socket.c
+++ b/socket.c
@@ -92,30 +92,35 @@ int open_icmpv6_socket(const struct list_head *ifaces)
 	err = setsockopt(sock, IPPROTO_IPV6, IPV6_RECVPKTINFO, (int[]){1}, sizeof(int));
 	if (err < 0) {
 		flog(LOG_ERR, "setsockopt(IPV6_RECVPKTINFO): %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 
 	err = setsockopt(sock, IPPROTO_RAW, IPV6_CHECKSUM, (int[]){2}, sizeof(int));
 	if (err < 0) {
 		flog(LOG_ERR, "setsockopt(IPV6_CHECKSUM): %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 
 	err = setsockopt(sock, IPPROTO_IPV6, IPV6_UNICAST_HOPS, (int[]){255}, sizeof(int));
 	if (err < 0) {
 		flog(LOG_ERR, "setsockopt(IPV6_UNICAST_HOPS): %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 
 	err = setsockopt(sock, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, (int[]){1}, sizeof(int));
 	if (err < 0) {
 		flog(LOG_ERR, "setsockopt(IPV6_MULTICAST_HOPS): %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 
 	err = setsockopt(sock, IPPROTO_IPV6, IPV6_MULTICAST_LOOP, (int[]){0}, sizeof(int));
 	if (err < 0) {
 		flog(LOG_ERR, "setsockopt(IPV6_MULTICAST_LOOP): %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 
@@ -123,6 +128,7 @@ int open_icmpv6_socket(const struct list_head *ifaces)
 	err = setsockopt(sock, IPPROTO_IPV6, IPV6_RECVHOPLIMIT, (int[]){1}, sizeof(int));
 	if (err < 0) {
 		flog(LOG_ERR, "setsockopt(IPV6_RECVHOPLIMIT): %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 #endif
@@ -130,6 +136,7 @@ int open_icmpv6_socket(const struct list_head *ifaces)
 	err = subscribe_rpl_multicast(sock, ifaces);
 	if (err < 0) {
 		flog(LOG_ERR, "Failed to subscribe rpl multicast: %s", strerror(errno));
+		close(sock);
 		return -1;
 	}
 
-- 
2.21.0

