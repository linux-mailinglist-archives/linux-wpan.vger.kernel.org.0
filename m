Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656EFB6D1E
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbfIRT67 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:59 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46948 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732225AbfIRT67 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:59 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 9B80AC1520;
        Wed, 18 Sep 2019 21:58:57 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 6/6] send: ensure we free the buffer after sending the message
Date:   Wed, 18 Sep 2019 21:58:19 +0200
Message-Id: <20190918195819.7492-7-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918195819.7492-1-stefan@datenfreihafen.org>
References: <20190918195819.7492-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

We have been leaking all buffers for every send so far.

Fixes Coverity IDs 250810, 250807, 250806, 250805
---
 send.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/send.c b/send.c
index d026f6a..50f73da 100644
--- a/send.c
+++ b/send.c
@@ -29,9 +29,10 @@
 
 static int really_send(int sock, const struct iface *iface,
 		       const struct in6_addr *dest,
-		       const struct safe_buffer *sb)
+		       struct safe_buffer *sb)
 {
 	struct sockaddr_in6 addr;
+	int rc;
 	memset((void *)&addr, 0, sizeof(addr));
 	addr.sin6_family = AF_INET6;
 	addr.sin6_port = htons(IPPROTO_ICMPV6);
@@ -67,7 +68,10 @@ static int really_send(int sock, const struct iface *iface,
 	mhdr.msg_control = (void *)cmsg;
 	mhdr.msg_controllen = sizeof(chdr);
 
-	return sendmsg(sock, &mhdr, 0);
+	rc = sendmsg(sock, &mhdr, 0);
+	safe_buffer_free(sb);
+
+	return rc;
 }
 void send_dio(int sock, struct dag *dag)
 {
-- 
2.21.0

