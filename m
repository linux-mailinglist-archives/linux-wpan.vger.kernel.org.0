Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7344335CB5F
	for <lists+linux-wpan@lfdr.de>; Mon, 12 Apr 2021 18:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243797AbhDLQYW (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 12 Apr 2021 12:24:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243637AbhDLQYH (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Mon, 12 Apr 2021 12:24:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC9B661364;
        Mon, 12 Apr 2021 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618244628;
        bh=C5cisYo0+cKjilV5bFZSqCOdDhRtn0udHul/3J7cQlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TW+mrzygPu1LvM9EQKITqoiMHkp0x4Fl15HBsGZhO7Mt/9Uww4OAM5+px83vItI79
         OAggl7eowNGRWqy+aOiTSi5/x6YeeJyAvPwSiTEVUrLhMakRroWN2Tr8lhUMIPKn3R
         ssH/ThYPOqzp68HSCydGsCio4jdDJ14RJa600UZWE+vypVRNyXGhThFXBuYs8BF8sK
         e3FfhJVVRaewhZDidCWBtbV2T8640IxHsVX+f4cRDxU5uYNRSzRwxo13P1vDnHwTkw
         i5XicTHiDU8SROGLOoFuAd5EQS0pOzTn2ADVzsZSztuJPOzC2xWzjxiCOv4r3AguBY
         MRqyRFarFaV8A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+9ec037722d2603a9f52e@syzkaller.appspotmail.com,
        Alexander Aring <aahringo@redhat.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Sasha Levin <sashal@kernel.org>, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 42/51] net: mac802154: Fix general protection fault
Date:   Mon, 12 Apr 2021 12:22:47 -0400
Message-Id: <20210412162256.313524-42-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162256.313524-1-sashal@kernel.org>
References: <20210412162256.313524-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

From: Pavel Skripkin <paskripkin@gmail.com>

[ Upstream commit 1165affd484889d4986cf3b724318935a0b120d8 ]

syzbot found general protection fault in crypto_destroy_tfm()[1].
It was caused by wrong clean up loop in llsec_key_alloc().
If one of the tfm array members is in IS_ERR() range it will
cause general protection fault in clean up function [1].

Call Trace:
 crypto_free_aead include/crypto/aead.h:191 [inline] [1]
 llsec_key_alloc net/mac802154/llsec.c:156 [inline]
 mac802154_llsec_key_add+0x9e0/0xcc0 net/mac802154/llsec.c:249
 ieee802154_add_llsec_key+0x56/0x80 net/mac802154/cfg.c:338
 rdev_add_llsec_key net/ieee802154/rdev-ops.h:260 [inline]
 nl802154_add_llsec_key+0x3d3/0x560 net/ieee802154/nl802154.c:1584
 genl_family_rcv_msg_doit+0x228/0x320 net/netlink/genetlink.c:739
 genl_family_rcv_msg net/netlink/genetlink.c:783 [inline]
 genl_rcv_msg+0x328/0x580 net/netlink/genetlink.c:800
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2502
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:811
 netlink_unicast_kernel net/netlink/af_netlink.c:1312 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1338
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1927
 sock_sendmsg_nosec net/socket.c:654 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:674
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2350
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2404
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2433
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Reported-by: syzbot+9ec037722d2603a9f52e@syzkaller.appspotmail.com
Acked-by: Alexander Aring <aahringo@redhat.com>
Link: https://lore.kernel.org/r/20210304152125.1052825-1-paskripkin@gmail.com
Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/mac802154/llsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac802154/llsec.c b/net/mac802154/llsec.c
index 585d33144c33..55550ead2ced 100644
--- a/net/mac802154/llsec.c
+++ b/net/mac802154/llsec.c
@@ -152,7 +152,7 @@ llsec_key_alloc(const struct ieee802154_llsec_key *template)
 	crypto_free_sync_skcipher(key->tfm0);
 err_tfm:
 	for (i = 0; i < ARRAY_SIZE(key->tfm); i++)
-		if (key->tfm[i])
+		if (!IS_ERR_OR_NULL(key->tfm[i]))
 			crypto_free_aead(key->tfm[i]);
 
 	kfree_sensitive(key);
-- 
2.30.2

