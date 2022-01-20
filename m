Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0E494500
	for <lists+linux-wpan@lfdr.de>; Thu, 20 Jan 2022 01:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357945AbiATAoH (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 19 Jan 2022 19:44:07 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54545 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357868AbiATAn6 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 19 Jan 2022 19:43:58 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 81EE720009;
        Thu, 20 Jan 2022 00:43:56 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [wpan-next 4/4] net: ieee802154: Add a kernel doc header to the ieee802154_addr structure
Date:   Thu, 20 Jan 2022 01:43:50 +0100
Message-Id: <20220120004350.308866-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220120004350.308866-1-miquel.raynal@bootlin.com>
References: <20220120004350.308866-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

From: David Girault <david.girault@qorvo.com>

While not being absolutely needed, it at least explain the mode vs. enum
fields.

Signed-off-by: David Girault <david.girault@qorvo.com>
[miquel.raynal@bootlin.com: Isolate this change from a bigger commit and
                            reword the comment]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/net/cfg802154.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
index 4193c242d96e..0b8b1812cea1 100644
--- a/include/net/cfg802154.h
+++ b/include/net/cfg802154.h
@@ -29,6 +29,16 @@ struct ieee802154_llsec_key_id;
 struct ieee802154_llsec_key;
 #endif /* CONFIG_IEEE802154_NL802154_EXPERIMENTAL */
 
+/**
+ * struct ieee802154_addr - IEEE802.15.4 device address
+ * @mode: Address mode from frame header. Can be one of:
+ *        - @IEEE802154_ADDR_NONE
+ *        - @IEEE802154_ADDR_SHORT
+ *        - @IEEE802154_ADDR_LONG
+ * @pan_id: The PAN ID this address belongs to
+ * @short_addr: address if @mode is @IEEE802154_ADDR_SHORT
+ * @extended_addr: address if @mode is @IEEE802154_ADDR_LONG
+ */
 struct ieee802154_addr {
 	u8 mode;
 	__le16 pan_id;
-- 
2.27.0

