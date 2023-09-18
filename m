Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB02A7A4CA8
	for <lists+linux-wpan@lfdr.de>; Mon, 18 Sep 2023 17:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjIRPiL (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 18 Sep 2023 11:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIRPiK (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 18 Sep 2023 11:38:10 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655931984;
        Mon, 18 Sep 2023 08:36:33 -0700 (PDT)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 5CE53D18D6;
        Mon, 18 Sep 2023 15:08:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96BE11C0007;
        Mon, 18 Sep 2023 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1695049718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tRz+MdElCo+N18SFYlxETVqXUB5lTcFe+1HUZHy1vdE=;
        b=akZ/ibKoPsdod+rKIqvQpyDCZ44vmPcT0ze+ssDNMixp/VpHI4yOuDEggn0QHQYzkjsdlZ
        iT/wsoIaVFu8PAneXJqIs77QW2zILP+iRmEn3uBHrZma5Wl+wmtzopO2d5r2dKNUHoKNrV
        AW8SH8rH+2wLD/Tzh49wYuBBL04BnRYhhkPZe03OB+l7Z7e28wvq1331DXz5Om2MM/hgHv
        kvZtBflscC+srCqDlQmhKOTuEoQn5hAhURdwA5OP4FJxiEuxQqrh5gVzeHo4PwTDejDT9p
        rumWBmtKzXTUkK3a7GYRq8IA6Hr1751hnhahNnIpDRAIBQKVIEw3orEGJUg+jQ==
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
        Guilhem Imberton <guilhem.imberton@qorvo.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH wpan-next v3 05/11] ieee802154: Add support for user disassociation requests
Date:   Mon, 18 Sep 2023 17:08:03 +0200
Message-Id: <20230918150809.275058-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918150809.275058-1-miquel.raynal@bootlin.com>
References: <20230918150809.275058-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

A device may decide at some point to disassociate from a PAN, let's
introduce a netlink command for this purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/net/cfg802154.h         |  3 +++
 include/net/ieee802154_netdev.h | 11 +++++++++
 include/net/nl802154.h          |  1 +
 net/ieee802154/nl802154.c       | 41 +++++++++++++++++++++++++++++++++
 net/ieee802154/rdev-ops.h       | 15 ++++++++++++
 net/ieee802154/trace.h          | 19 +++++++++++++++
 6 files changed, 90 insertions(+)

diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
index 1c22cef77425..ce649ebc3b19 100644
--- a/include/net/cfg802154.h
+++ b/include/net/cfg802154.h
@@ -81,6 +81,9 @@ struct cfg802154_ops {
 	int	(*associate)(struct wpan_phy *wpan_phy,
 			     struct wpan_dev *wpan_dev,
 			     struct ieee802154_addr *coord);
+	int	(*disassociate)(struct wpan_phy *wpan_phy,
+				struct wpan_dev *wpan_dev,
+				struct ieee802154_addr *target);
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	void	(*get_llsec_table)(struct wpan_phy *wpan_phy,
 				   struct wpan_dev *wpan_dev,
diff --git a/include/net/ieee802154_netdev.h b/include/net/ieee802154_netdev.h
index e26ffd079556..16194356cfe7 100644
--- a/include/net/ieee802154_netdev.h
+++ b/include/net/ieee802154_netdev.h
@@ -177,6 +177,11 @@ enum ieee802154_association_status {
 	IEEE802154_FAST_ASSOCIATION_SUCCESSFUL = 0x80,
 };
 
+enum ieee802154_disassociation_reason {
+	IEEE802154_COORD_WISHES_DEVICE_TO_LEAVE = 0x1,
+	IEEE802154_DEVICE_WISHES_TO_LEAVE = 0x2,
+};
+
 struct ieee802154_hdr {
 	struct ieee802154_hdr_fc fc;
 	u8 seq;
@@ -206,6 +211,12 @@ struct ieee802154_association_req_frame {
 	struct ieee802154_assoc_req_pl assoc_req_pl;
 };
 
+struct ieee802154_disassociation_notif_frame {
+	struct ieee802154_hdr mhr;
+	struct ieee802154_mac_cmd_pl mac_pl;
+	u8 disassoc_pl;
+};
+
 /* pushes hdr onto the skb. fields of hdr->fc that can be calculated from
  * the contents of hdr will be, and the actual value of those bits in
  * hdr->fc will be ignored. this includes the INTRA_PAN bit and the frame
diff --git a/include/net/nl802154.h b/include/net/nl802154.h
index 830e1c51d3df..8a47c14c72f0 100644
--- a/include/net/nl802154.h
+++ b/include/net/nl802154.h
@@ -79,6 +79,7 @@ enum nl802154_commands {
 	NL802154_CMD_SEND_BEACONS,
 	NL802154_CMD_STOP_BEACONS,
 	NL802154_CMD_ASSOCIATE,
+	NL802154_CMD_DISASSOCIATE,
 
 	/* add new commands above here */
 
diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index 2c28e0e9fdda..5820fe425ddd 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -1663,6 +1663,39 @@ static int nl802154_associate(struct sk_buff *skb, struct genl_info *info)
 	return err;
 }
 
+static int nl802154_disassociate(struct sk_buff *skb, struct genl_info *info)
+{
+	struct cfg802154_registered_device *rdev = info->user_ptr[0];
+	struct net_device *dev = info->user_ptr[1];
+	struct wpan_dev *wpan_dev = dev->ieee802154_ptr;
+	struct wpan_phy *wpan_phy = &rdev->wpan_phy;
+	struct ieee802154_addr target;
+
+	if (wpan_phy->flags & WPAN_PHY_FLAG_DATAGRAMS_ONLY) {
+		NL_SET_ERR_MSG(info->extack, "PHY only supports datagrams");
+		return -EOPNOTSUPP;
+	}
+
+	target.pan_id = wpan_dev->pan_id;
+
+	if (info->attrs[NL802154_ATTR_EXTENDED_ADDR]) {
+		target.mode = IEEE802154_ADDR_LONG;
+		target.extended_addr = nla_get_le64(info->attrs[NL802154_ATTR_EXTENDED_ADDR]);
+	} else if (info->attrs[NL802154_ATTR_SHORT_ADDR]) {
+		target.mode = IEEE802154_ADDR_SHORT;
+		target.short_addr = nla_get_le16(info->attrs[NL802154_ATTR_SHORT_ADDR]);
+	} else {
+		NL_SET_ERR_MSG(info->extack, "Device address is missing");
+		return -EINVAL;
+	}
+
+	mutex_lock(&wpan_dev->association_lock);
+	rdev_disassociate(rdev, wpan_dev, &target);
+	mutex_unlock(&wpan_dev->association_lock);
+
+	return 0;
+}
+
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 static const struct nla_policy nl802154_dev_addr_policy[NL802154_DEV_ADDR_ATTR_MAX + 1] = {
 	[NL802154_DEV_ADDR_ATTR_PAN_ID] = { .type = NLA_U16 },
@@ -2792,6 +2825,14 @@ static const struct genl_ops nl802154_ops[] = {
 				  NL802154_FLAG_CHECK_NETDEV_UP |
 				  NL802154_FLAG_NEED_RTNL,
 	},
+	{
+		.cmd = NL802154_CMD_DISASSOCIATE,
+		.doit = nl802154_disassociate,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = NL802154_FLAG_NEED_NETDEV |
+				  NL802154_FLAG_CHECK_NETDEV_UP |
+				  NL802154_FLAG_NEED_RTNL,
+	},
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	{
 		.cmd = NL802154_CMD_SET_SEC_PARAMS,
diff --git a/net/ieee802154/rdev-ops.h b/net/ieee802154/rdev-ops.h
index 4843d52f1ee0..64071ef6f57b 100644
--- a/net/ieee802154/rdev-ops.h
+++ b/net/ieee802154/rdev-ops.h
@@ -280,6 +280,21 @@ static inline int rdev_associate(struct cfg802154_registered_device *rdev,
 	return ret;
 }
 
+static inline int rdev_disassociate(struct cfg802154_registered_device *rdev,
+				    struct wpan_dev *wpan_dev,
+				    struct ieee802154_addr *target)
+{
+	int ret;
+
+	if (!rdev->ops->disassociate)
+		return -EOPNOTSUPP;
+
+	trace_802154_rdev_disassociate(&rdev->wpan_phy, wpan_dev, target);
+	ret = rdev->ops->disassociate(&rdev->wpan_phy, wpan_dev, target);
+	trace_802154_rdev_return_int(&rdev->wpan_phy, ret);
+	return ret;
+}
+
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 /* TODO this is already a nl802154, so move into ieee802154 */
 static inline void
diff --git a/net/ieee802154/trace.h b/net/ieee802154/trace.h
index 2e1d4f456316..62aa6465253a 100644
--- a/net/ieee802154/trace.h
+++ b/net/ieee802154/trace.h
@@ -375,6 +375,25 @@ TRACE_EVENT(802154_rdev_associate,
 		  WPAN_PHY_PR_ARG, WPAN_DEV_PR_ARG, __entry->addr)
 );
 
+TRACE_EVENT(802154_rdev_disassociate,
+	TP_PROTO(struct wpan_phy *wpan_phy,
+		 struct wpan_dev *wpan_dev,
+		 struct ieee802154_addr *target),
+	TP_ARGS(wpan_phy, wpan_dev, target),
+	TP_STRUCT__entry(
+		WPAN_PHY_ENTRY
+		WPAN_DEV_ENTRY
+		__field(__le64, addr)
+	),
+	TP_fast_assign(
+		WPAN_PHY_ASSIGN;
+		WPAN_DEV_ASSIGN;
+		__entry->addr = target->extended_addr;
+	),
+	TP_printk(WPAN_PHY_PR_FMT ", " WPAN_DEV_PR_FMT ", disassociating with: 0x%llx",
+		  WPAN_PHY_PR_ARG, WPAN_DEV_PR_ARG, __entry->addr)
+);
+
 TRACE_EVENT(802154_rdev_return_int,
 	TP_PROTO(struct wpan_phy *wpan_phy, int ret),
 	TP_ARGS(wpan_phy, ret),
-- 
2.34.1

