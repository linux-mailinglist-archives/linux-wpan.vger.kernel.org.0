Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCF1B97F4
	for <lists+linux-wpan@lfdr.de>; Fri, 20 Sep 2019 21:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729682AbfITTpm (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 20 Sep 2019 15:45:42 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:49395 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727439AbfITTpm (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 20 Sep 2019 15:45:42 -0400
Received: from localhost.localdomain ([93.22.134.255])
        by mwinf5d70 with ME
        id 3vlc210065Wn77903vlcTj; Fri, 20 Sep 2019 21:45:40 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 20 Sep 2019 21:45:40 +0200
X-ME-IP: 93.22.134.255
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     liuxuenetmail@gmail.com, alex.aring@gmail.com,
        stefan@datenfreihafen.org, davem@davemloft.net
Cc:     linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ieee802154: mcr20a: simplify a bit 'mcr20a_handle_rx_read_buf_complete()'
Date:   Fri, 20 Sep 2019 21:45:33 +0200
Message-Id: <20190920194533.5886-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Use a 'skb_put_data()' variant instead of rewritting it.
The __skb_put_data variant is safe here. It is obvious that the skb can
not overflow. It has just been allocated a few lines above with the same
'len'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ieee802154/mcr20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
index 17f2300e63ee..8dc04e2590b1 100644
--- a/drivers/net/ieee802154/mcr20a.c
+++ b/drivers/net/ieee802154/mcr20a.c
@@ -800,7 +800,7 @@ mcr20a_handle_rx_read_buf_complete(void *context)
 	if (!skb)
 		return;
 
-	memcpy(skb_put(skb, len), lp->rx_buf, len);
+	__skb_put_data(skb, lp->rx_buf, len);
 	ieee802154_rx_irqsafe(lp->hw, skb, lp->rx_lqi[0]);
 
 	print_hex_dump_debug("mcr20a rx: ", DUMP_PREFIX_OFFSET, 16, 1,
-- 
2.20.1

