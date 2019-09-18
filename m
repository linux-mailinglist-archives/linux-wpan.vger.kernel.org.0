Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC65B6D1A
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732196AbfIRT6o (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:44 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46937 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731752AbfIRT6o (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:44 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id CBB1DC151B;
        Wed, 18 Sep 2019 21:58:42 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 2/6] send: make sure we check on scope id usage
Date:   Wed, 18 Sep 2019 21:58:15 +0200
Message-Id: <20190918195819.7492-3-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918195819.7492-1-stefan@datenfreihafen.org>
References: <20190918195819.7492-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

It fails on my machine and likely fails on others, better
check for it.
---
 send.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/send.c b/send.c
index 97c566d..d026f6a 100644
--- a/send.c
+++ b/send.c
@@ -53,11 +53,9 @@ static int really_send(int sock, const struct iface *iface,
 	pkt_info->ipi6_ifindex = iface->ifindex;
 	memcpy(&pkt_info->ipi6_addr, iface->ifaddr_src, sizeof(struct in6_addr));
 
-#if 1
-//#ifdef HAVE_SIN6_SCOPE_ID
+#ifdef HAVE_SIN6_SCOPE_ID
 	if (IN6_IS_ADDR_LINKLOCAL(&addr.sin6_addr) || IN6_IS_ADDR_MC_LINKLOCAL(&addr.sin6_addr))
 		addr.sin6_scope_id = iface->ifindex;
-//#endif
 #endif
 
 	struct msghdr mhdr;
-- 
2.21.0

