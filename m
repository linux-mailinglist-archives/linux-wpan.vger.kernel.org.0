Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55E635CC95
	for <lists+linux-wpan@lfdr.de>; Mon, 12 Apr 2021 18:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244110AbhDLQa0 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 12 Apr 2021 12:30:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244458AbhDLQ2M (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Mon, 12 Apr 2021 12:28:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B6F761395;
        Mon, 12 Apr 2021 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618244720;
        bh=cpZE2tZXcu/4oVkhr39OZMRk74o9l8Lp8DKvAfAS6ec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yjj6tHfOrqNxF9b3HgE192iWzv//AzqxsddLASgU7H/KHMglVIZ1Vw+MOnaQAG0bL
         apu7xYAjxnhM5pqT/3hEGqIYwBc8axcdpYEkpl6LC1qGl6dT414A6nVqtM+Sk2cbfD
         rPenWENRrNDgOPwCDMz/lZmJLN5LtCORwF9x7KpFUV5Bb/l4RSHtdvuLzyCgku1QmN
         m1dYD80YByHdhX0F8xTWnKIitHbH54X6n92Gcx/o2ssNCyimwK+lkwPQ56Y8sStDbv
         8hYCOqhffUBCZ1rVBXyQAd/Y2BUU3ldplxusK1u6B+Y1VlxxooOQK5T4qiA3Be1MDd
         UoVB7TdZQixXQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+28a246747e0a465127f3@syzkaller.appspotmail.com,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/39] drivers: net: fix memory leak in atusb_probe
Date:   Mon, 12 Apr 2021 12:24:36 -0400
Message-Id: <20210412162502.314854-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162502.314854-1-sashal@kernel.org>
References: <20210412162502.314854-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

From: Pavel Skripkin <paskripkin@gmail.com>

[ Upstream commit 6b9fbe16955152626557ec6f439f3407b7769941 ]

syzbot reported memory leak in atusb_probe()[1].
The problem was in atusb_alloc_urbs().
Since urb is anchored, we need to release the reference
to correctly free the urb

backtrace:
    [<ffffffff82ba0466>] kmalloc include/linux/slab.h:559 [inline]
    [<ffffffff82ba0466>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<ffffffff82ad3888>] atusb_alloc_urbs drivers/net/ieee802154/atusb.c:362 [inline][2]
    [<ffffffff82ad3888>] atusb_probe+0x158/0x820 drivers/net/ieee802154/atusb.c:1038 [1]

Reported-by: syzbot+28a246747e0a465127f3@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ieee802154/atusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ieee802154/atusb.c b/drivers/net/ieee802154/atusb.c
index 0dd0ba915ab9..23ee0b14cbfa 100644
--- a/drivers/net/ieee802154/atusb.c
+++ b/drivers/net/ieee802154/atusb.c
@@ -365,6 +365,7 @@ static int atusb_alloc_urbs(struct atusb *atusb, int n)
 			return -ENOMEM;
 		}
 		usb_anchor_urb(urb, &atusb->idle_urbs);
+		usb_free_urb(urb);
 		n--;
 	}
 	return 0;
-- 
2.30.2

