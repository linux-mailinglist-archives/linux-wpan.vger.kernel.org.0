Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442C0494CBF
	for <lists+linux-wpan@lfdr.de>; Thu, 20 Jan 2022 12:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiATLVX (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 20 Jan 2022 06:21:23 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50601 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiATLVV (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 20 Jan 2022 06:21:21 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EA2F7C0008;
        Thu, 20 Jan 2022 11:21:18 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Xue Liu <liuxuenetmail@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Harry Morris <harrymorris12@gmail.com>,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [wpan-next v2 1/9] net: ieee802154: hwsim: Ensure proper channel selection at probe time
Date:   Thu, 20 Jan 2022 12:21:07 +0100
Message-Id: <20220120112115.448077-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220120112115.448077-1-miquel.raynal@bootlin.com>
References: <20220120112115.448077-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Drivers are expected to set the PHY current_channel and current_page
according to their default state. The hwsim driver is advertising being
configured on channel 13 by default but that is not reflected in its own
internal pib structure. In order to ensure that this driver consider the
current channel as being 13 internally, we can call hwsim_hw_channel()
instead of creating an empty pib structure.

We assume here that kvfree_rcu(NULL) is a valid call.

Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/net/ieee802154/mac802154_hwsim.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
index 8caa61ec718f..795f8eb5387b 100644
--- a/drivers/net/ieee802154/mac802154_hwsim.c
+++ b/drivers/net/ieee802154/mac802154_hwsim.c
@@ -732,7 +732,6 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
 {
 	struct ieee802154_hw *hw;
 	struct hwsim_phy *phy;
-	struct hwsim_pib *pib;
 	int idx;
 	int err;
 
@@ -780,13 +779,8 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
 
 	/* hwsim phy channel 13 as default */
 	hw->phy->current_channel = 13;
-	pib = kzalloc(sizeof(*pib), GFP_KERNEL);
-	if (!pib) {
-		err = -ENOMEM;
-		goto err_pib;
-	}
+	hwsim_hw_channel(hw, hw->phy->current_page, hw->phy->current_channel);
 
-	rcu_assign_pointer(phy->pib, pib);
 	phy->idx = idx;
 	INIT_LIST_HEAD(&phy->edges);
 
@@ -815,8 +809,6 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
 err_subscribe:
 	ieee802154_unregister_hw(phy->hw);
 err_reg:
-	kfree(pib);
-err_pib:
 	ieee802154_free_hw(phy->hw);
 	return err;
 }
-- 
2.27.0

