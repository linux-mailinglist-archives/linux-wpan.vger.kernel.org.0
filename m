Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8BA49F7E6
	for <lists+linux-wpan@lfdr.de>; Fri, 28 Jan 2022 12:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348055AbiA1LJE (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 28 Jan 2022 06:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348052AbiA1LIi (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 28 Jan 2022 06:08:38 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37084C061748;
        Fri, 28 Jan 2022 03:08:37 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 83951100007;
        Fri, 28 Jan 2022 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1643368115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WJGlY0uHnelxX/zoR23HVft+QF4dDTN9gFXmIgGpyeA=;
        b=B3Uv9GeDHf/A+ErJ8AAHcODTZz6ZsqMZE80GhI6TGJpVzKpyg2c7ofWOZU3aetjDc0E8YI
        K67HJREvUgIy8t4d6R+hL0HQlk2WpwXqasPoa3b9i1luBQj5xIljzNjor3Fdy58DMaYrR2
        bPkzYQgPU3XESi91ubwJzU6mSDXHuxdvOmJSl2omoa9XBVivE60KYPelZYHiNzlP6HcvpV
        T4D3jRnXzHAfIpI7Pto4DWkbqSqArgorpLdJ/wvajQVcbIupJtdY7E/Ds5RduTiod9wQ6+
        22Zaa3YjQ32jVkr1YBrBU2mciqH+f4plTkUmxxnhfT7bEXVprqiFfi2+SJjYMw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Varka Bhadram <varkabhadram@gmail.com>,
        Xue Liu <liuxuenetmail@gmail.com>, Alan Ott <alan@signal11.us>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH wpan-next v2 5/5] net: ieee802154: Drop duration settings when the core does it already
Date:   Fri, 28 Jan 2022 12:08:25 +0100
Message-Id: <20220128110825.1120678-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128110825.1120678-1-miquel.raynal@bootlin.com>
References: <20220128110825.1120678-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

The core now knows how to set the symbol duration in a few cases, when
drivers correctly advertise the protocols used on each channel. For
these drivers, there is no more need to bother with symbol duration,
lifs and sifs periods so just drop the duplicated code.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/net/ieee802154/at86rf230.c | 33 ------------------------------
 drivers/net/ieee802154/atusb.c     | 33 ------------------------------
 drivers/net/ieee802154/ca8210.c    |  1 -
 drivers/net/ieee802154/mcr20a.c    |  5 -----
 4 files changed, 72 deletions(-)

diff --git a/drivers/net/ieee802154/at86rf230.c b/drivers/net/ieee802154/at86rf230.c
index b08f08475426..9f3b4a8d151a 100644
--- a/drivers/net/ieee802154/at86rf230.c
+++ b/drivers/net/ieee802154/at86rf230.c
@@ -1064,36 +1064,6 @@ at86rf212_set_channel(struct at86rf230_local *lp, u8 page, u8 channel)
 	if (rc < 0)
 		return rc;
 
-	/* This sets the symbol_duration according frequency on the 212.
-	 * TODO move this handling while set channel and page in cfg802154.
-	 * We can do that, this timings are according 802.15.4 standard.
-	 * If we do that in cfg802154, this is a more generic calculation.
-	 *
-	 * This should also protected from ifs_timer. Means cancel timer and
-	 * init with a new value. For now, this is okay.
-	 */
-	if (channel == 0) {
-		if (page == 0) {
-			/* SUB:0 and BPSK:0 -> BPSK-20 */
-			lp->hw->phy->symbol_duration = 50 * NSEC_PER_USEC;
-		} else {
-			/* SUB:1 and BPSK:0 -> BPSK-40 */
-			lp->hw->phy->symbol_duration = 25 * NSEC_PER_USEC;
-		}
-	} else {
-		if (page == 0)
-			/* SUB:0 and BPSK:1 -> OQPSK-100/200/400 */
-			lp->hw->phy->symbol_duration = 40 * NSEC_PER_USEC;
-		else
-			/* SUB:1 and BPSK:1 -> OQPSK-250/500/1000 */
-			lp->hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
-	}
-
-	lp->hw->phy->lifs_period =
-		(IEEE802154_LIFS_PERIOD * lp->hw->phy->symbol_duration) / 1000;
-	lp->hw->phy->sifs_period =
-		(IEEE802154_SIFS_PERIOD * lp->hw->phy->symbol_duration) / 1000;
-
 	return at86rf230_write_subreg(lp, SR_CHANNEL, channel);
 }
 
@@ -1572,7 +1542,6 @@ at86rf230_detect_device(struct at86rf230_local *lp)
 		lp->hw->phy->supported.page[0].chunk[0].protocol = IEEE802154_OQPSK_PHY;
 		lp->hw->phy->supported.page[0].chunk[0].band = IEEE802154_2400_MHZ_BAND;
 		lp->hw->phy->current_channel = 11;
-		lp->hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
 		lp->hw->phy->supported.tx_powers = at86rf231_powers;
 		lp->hw->phy->supported.tx_powers_size = ARRAY_SIZE(at86rf231_powers);
 		lp->hw->phy->supported.cca_ed_levels = at86rf231_ed_levels;
@@ -1604,7 +1573,6 @@ at86rf230_detect_device(struct at86rf230_local *lp)
 		lp->hw->phy->supported.page[2].chunk[1].band = IEEE802154_915_MHZ_BAND;
 
 		lp->hw->phy->current_channel = 5;
-		lp->hw->phy->symbol_duration = 25 * NSEC_PER_USEC;
 		lp->hw->phy->supported.lbt = NL802154_SUPPORTED_BOOL_BOTH;
 		lp->hw->phy->supported.tx_powers = at86rf212_powers;
 		lp->hw->phy->supported.tx_powers_size = ARRAY_SIZE(at86rf212_powers);
@@ -1619,7 +1587,6 @@ at86rf230_detect_device(struct at86rf230_local *lp)
 		lp->hw->phy->supported.page[0].chunk[0].protocol = IEEE802154_OQPSK_PHY;
 		lp->hw->phy->supported.page[0].chunk[0].band = IEEE802154_2400_MHZ_BAND;
 		lp->hw->phy->current_channel = 13;
-		lp->hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
 		lp->hw->phy->supported.tx_powers = at86rf233_powers;
 		lp->hw->phy->supported.tx_powers_size = ARRAY_SIZE(at86rf233_powers);
 		lp->hw->phy->supported.cca_ed_levels = at86rf233_ed_levels;
diff --git a/drivers/net/ieee802154/atusb.c b/drivers/net/ieee802154/atusb.c
index 80382919520e..1a56073c1c52 100644
--- a/drivers/net/ieee802154/atusb.c
+++ b/drivers/net/ieee802154/atusb.c
@@ -667,36 +667,6 @@ static int hulusb_set_channel(struct ieee802154_hw *hw, u8 page, u8 channel)
 	if (rc < 0)
 		return rc;
 
-	/* This sets the symbol_duration according frequency on the 212.
-	 * TODO move this handling while set channel and page in cfg802154.
-	 * We can do that, this timings are according 802.15.4 standard.
-	 * If we do that in cfg802154, this is a more generic calculation.
-	 *
-	 * This should also protected from ifs_timer. Means cancel timer and
-	 * init with a new value. For now, this is okay.
-	 */
-	if (channel == 0) {
-		if (page == 0) {
-			/* SUB:0 and BPSK:0 -> BPSK-20 */
-			lp->hw->phy->symbol_duration = 50 * NSEC_PER_USEC;
-		} else {
-			/* SUB:1 and BPSK:0 -> BPSK-40 */
-			lp->hw->phy->symbol_duration = 25 * NSEC_PER_USEC;
-		}
-	} else {
-		if (page == 0)
-			/* SUB:0 and BPSK:1 -> OQPSK-100/200/400 */
-			lp->hw->phy->symbol_duration = 40 * NSEC_PER_USEC;
-		else
-			/* SUB:1 and BPSK:1 -> OQPSK-250/500/1000 */
-			lp->hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
-	}
-
-	lp->hw->phy->lifs_period =
-		(IEEE802154_LIFS_PERIOD * lp->hw->phy->symbol_duration) / 1000;
-	lp->hw->phy->sifs_period =
-		(IEEE802154_SIFS_PERIOD * lp->hw->phy->symbol_duration) / 1000;
-
 	return atusb_write_subreg(lp, SR_CHANNEL, channel);
 }
 
@@ -919,7 +889,6 @@ static int atusb_get_and_conf_chip(struct atusb *atusb)
 		atusb->hw->phy->supported.page[0].chunk[0].protocol = IEEE802154_OQPSK_PHY;
 		atusb->hw->phy->supported.page[0].chunk[0].band = IEEE802154_2400_MHZ_BAND;
 		atusb->hw->phy->current_channel = 11;	/* reset default */
-		atusb->hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
 		atusb->hw->phy->supported.tx_powers = atusb_powers;
 		atusb->hw->phy->supported.tx_powers_size = ARRAY_SIZE(atusb_powers);
 		hw->phy->supported.cca_ed_levels = atusb_ed_levels;
@@ -932,7 +901,6 @@ static int atusb_get_and_conf_chip(struct atusb *atusb)
 		atusb->hw->phy->supported.page[0].chunk[0].protocol = IEEE802154_OQPSK_PHY;
 		atusb->hw->phy->supported.page[0].chunk[0].band = IEEE802154_2400_MHZ_BAND;
 		atusb->hw->phy->current_channel = 11;	/* reset default */
-		atusb->hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
 		atusb->hw->phy->supported.tx_powers = atusb_powers;
 		atusb->hw->phy->supported.tx_powers_size = ARRAY_SIZE(atusb_powers);
 		hw->phy->supported.cca_ed_levels = atusb_ed_levels;
@@ -963,7 +931,6 @@ static int atusb_get_and_conf_chip(struct atusb *atusb)
 		atusb->hw->phy->supported.page[2].chunk[1].band = IEEE802154_915_MHZ_BAND;
 
 		atusb->hw->phy->current_channel = 5;
-		atusb->hw->phy->symbol_duration = 25 * NSEC_PER_USEC;
 		atusb->hw->phy->supported.lbt = NL802154_SUPPORTED_BOOL_BOTH;
 		atusb->hw->phy->supported.tx_powers = at86rf212_powers;
 		atusb->hw->phy->supported.tx_powers_size = ARRAY_SIZE(at86rf212_powers);
diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 8eb48a8014db..baa4392d20c2 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -2978,7 +2978,6 @@ static void ca8210_hw_setup(struct ieee802154_hw *ca8210_hw)
 	ca8210_hw->phy->cca.mode = NL802154_CCA_ENERGY_CARRIER;
 	ca8210_hw->phy->cca.opt = NL802154_CCA_OPT_ENERGY_CARRIER_AND;
 	ca8210_hw->phy->cca_ed_level = -9800;
-	ca8210_hw->phy->symbol_duration = 16 * NSEC_PER_USEC;
 	ca8210_hw->phy->lifs_period = 40;
 	ca8210_hw->phy->sifs_period = 12;
 	ca8210_hw->flags =
diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
index 34063b7e663e..8d12c2968302 100644
--- a/drivers/net/ieee802154/mcr20a.c
+++ b/drivers/net/ieee802154/mcr20a.c
@@ -975,10 +975,6 @@ static void mcr20a_hw_setup(struct mcr20a_local *lp)
 
 	dev_dbg(printdev(lp), "%s\n", __func__);
 
-	phy->symbol_duration = 16 * NSEC_PER_USEC;
-	phy->lifs_period = (40 * phy->symbol_duration) / NSEC_PER_USEC;
-	phy->sifs_period = (12 * phy->symbol_duration) / NSEC_PER_USEC;
-
 	hw->flags = IEEE802154_HW_TX_OMIT_CKSUM |
 			IEEE802154_HW_AFILT |
 			IEEE802154_HW_PROMISCUOUS;
@@ -1010,7 +1006,6 @@ static void mcr20a_hw_setup(struct mcr20a_local *lp)
 	phy->current_page = 0;
 	/* MCR20A default reset value */
 	phy->current_channel = 20;
-	phy->symbol_duration = 16 * NSEC_PER_USEC;
 	phy->supported.tx_powers = mcr20a_powers;
 	phy->supported.tx_powers_size = ARRAY_SIZE(mcr20a_powers);
 	phy->cca_ed_level = phy->supported.cca_ed_levels[75];
-- 
2.27.0

