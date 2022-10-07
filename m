Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A915F759E
	for <lists+linux-wpan@lfdr.de>; Fri,  7 Oct 2022 10:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiJGIyF (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 7 Oct 2022 04:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiJGIxq (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 7 Oct 2022 04:53:46 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F27111755E;
        Fri,  7 Oct 2022 01:53:40 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CBEB11BF20D;
        Fri,  7 Oct 2022 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1665132818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eMfsmZ4JLreXYcYVpxJN9ZOZqTgP49RxDVxSHvzYNgU=;
        b=JhC9NEzFAQbx/7UH6roy/nq/hglTFM+WwUaoNCWoj0ZAAi0lUFV0VYcq1RVxt4/E3GQ35t
        c7pr1QWg9ntEHDQfpjicrkwq/3rHDUfo5K3byB/9cdbEOFNEI++UbStMLUBveYTBuNtfQ8
        FLrO3k2+jXJ5ipkiDRgI/CXxGF5we0EEIziB3CU+G7SjnJBJ8Q4OI04+63CTZwRR8GuT47
        3NDO1cWfv77EIoVqot1M8xOEmY4d/SiZ3wX7UiXG8Ppkiu62snXccESfjR53a3Bb91OrgP
        5CvMsOaHA+pA9XXF6D6G3+JlLi0cstTiSFq/o1sKfxcVl9N58REIjhM1tvOMGA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH wpan/next v4 8/8] mac802154: Ensure proper scan-level filtering
Date:   Fri,  7 Oct 2022 10:53:10 +0200
Message-Id: <20221007085310.503366-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007085310.503366-1-miquel.raynal@bootlin.com>
References: <20221007085310.503366-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

We now have a fine grained filtering information so let's ensure proper
filtering in scan mode, which means that only beacons are processed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 net/mac802154/rx.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/mac802154/rx.c b/net/mac802154/rx.c
index 14bc646b9ab7..4d799b477a7f 100644
--- a/net/mac802154/rx.c
+++ b/net/mac802154/rx.c
@@ -34,6 +34,7 @@ ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 		       struct sk_buff *skb, const struct ieee802154_hdr *hdr)
 {
 	struct wpan_dev *wpan_dev = &sdata->wpan_dev;
+	struct wpan_phy *wpan_phy = sdata->local->hw.phy;
 	__le16 span, sshort;
 	int rc;
 
@@ -42,6 +43,17 @@ ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 	span = wpan_dev->pan_id;
 	sshort = wpan_dev->short_addr;
 
+	/* Level 3 filtering: Only beacons are accepted during scans */
+	if (sdata->required_filtering == IEEE802154_FILTERING_3_SCAN &&
+	    sdata->required_filtering > wpan_phy->filtering) {
+		if (mac_cb(skb)->type != IEEE802154_FC_TYPE_BEACON) {
+			dev_dbg(&sdata->dev->dev,
+				"drop !beacon frame (0x%x) during scan\n",
+				mac_cb(skb)->type);
+			goto fail;
+		}
+	}
+
 	switch (mac_cb(skb)->dest.mode) {
 	case IEEE802154_ADDR_NONE:
 		if (hdr->source.mode != IEEE802154_ADDR_NONE)
@@ -277,10 +289,6 @@ void ieee802154_rx(struct ieee802154_local *local, struct sk_buff *skb)
 
 	ieee802154_monitors_rx(local, skb);
 
-	/* TODO: Handle upcomming receive path where the PHY is at the
-	 * IEEE802154_FILTERING_NONE level during a scan.
-	 */
-
 	/* Level 1 filtering: Check the FCS by software when relevant */
 	if (local->hw.phy->filtering == IEEE802154_FILTERING_NONE) {
 		crc = crc_ccitt(0, skb->data, skb->len);
-- 
2.34.1

