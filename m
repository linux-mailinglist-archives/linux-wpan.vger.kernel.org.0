Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D839071A327
	for <lists+linux-wpan@lfdr.de>; Thu,  1 Jun 2023 17:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbjFAPte (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 1 Jun 2023 11:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbjFAPtT (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 1 Jun 2023 11:49:19 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E46E71;
        Thu,  1 Jun 2023 08:48:42 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685634521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vYU1HE33cSEgumpIrN6VQaL3YHPbTGcUQi0AtWEkEBo=;
        b=npPEdC73hrpipsKpc/9mDKeVZxkGvTW8CU5KI1Th+fztjbyj1gt28gDoMf+82az+y220ce
        GenuGY6V1O3cuNK/It1VNq8v51vAFwl6J2NQFWsqQ9THsyLTjmflS57ZD9wMVe1qPfDn5b
        tEUPgBpLQLebcVX/T7nW0RdnuB+Gap1/JTtZCT5Mu/J0h/meOUeQADzlXV5e2YhjQ/fIeF
        awcqubKFYSuUA8g5qyXMxXGtmqDCWZ1RwPwMuoDFsmTr0PhTJx/qRBA5i3XCc17mSPBTXM
        gyTIlzg083g2vhhW+XxSpvR5djPROSv+1UGD9IRB2lHVgn/iWHVC1TTb0eMR/w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF565C000C;
        Thu,  1 Jun 2023 15:48:38 +0000 (UTC)
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
Subject: [PATCH wpan-next 08/11] ieee802154: Add support for limiting the number of associated devices
Date:   Thu,  1 Jun 2023 17:48:14 +0200
Message-Id: <20230601154817.754519-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601154817.754519-1-miquel.raynal@bootlin.com>
References: <20230601154817.754519-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Coordinators may refuse associations. We need a user input for
that. Let's add a new netlink command which can provide a maximum number
of devices we accept to associate with as a first step. Later, we could
also forward the request to userspace and check whether the association
should be accepted or not.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/net/cfg802154.h   |  8 ++++++++
 include/net/nl802154.h    |  2 ++
 net/ieee802154/core.c     |  1 +
 net/ieee802154/nl802154.c | 28 ++++++++++++++++++++++++++++
 net/ieee802154/pan.c      |  8 ++++++++
 5 files changed, 47 insertions(+)

diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
index 4404072365e7..d7583598b290 100644
--- a/include/net/cfg802154.h
+++ b/include/net/cfg802154.h
@@ -506,6 +506,7 @@ struct wpan_dev {
 	struct ieee802154_pan_device *parent;
 	struct list_head children;
 	unsigned int association_generation;
+	unsigned int max_associations;
 };
 
 #define to_phy(_dev)	container_of(_dev, struct wpan_phy, dev)
@@ -582,6 +583,13 @@ struct ieee802154_pan_device *
 cfg802154_device_is_child(struct wpan_dev *wpan_dev,
 			  struct ieee802154_addr *target);
 
+/**
+ * cfg802154_set_max_associations - Limit the number of future associations
+ * @wpan_dev: the wpan device
+ * @max: the maximum number of devices we accept to associate
+ */
+void cfg802154_set_max_associations(struct wpan_dev *wpan_dev, unsigned int max);
+
 /**
  * cfg802154_get_free_short_addr - Get a free address among the known devices
  * @wpan_dev: the wpan device
diff --git a/include/net/nl802154.h b/include/net/nl802154.h
index 8a47c14c72f0..8b26faae49e8 100644
--- a/include/net/nl802154.h
+++ b/include/net/nl802154.h
@@ -80,6 +80,7 @@ enum nl802154_commands {
 	NL802154_CMD_STOP_BEACONS,
 	NL802154_CMD_ASSOCIATE,
 	NL802154_CMD_DISASSOCIATE,
+	NL802154_CMD_SET_MAX_ASSOCIATIONS,
 
 	/* add new commands above here */
 
@@ -149,6 +150,7 @@ enum nl802154_attrs {
 	NL802154_ATTR_SCAN_DURATION,
 	NL802154_ATTR_SCAN_DONE_REASON,
 	NL802154_ATTR_BEACON_INTERVAL,
+	NL802154_ATTR_MAX_ASSOCIATIONS,
 
 	/* add attributes here, update the policy in nl802154.c */
 
diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
index 39674db64336..65bb656db9b4 100644
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -297,6 +297,7 @@ static int cfg802154_netdev_notifier_call(struct notifier_block *nb,
 		rdev->devlist_generation++;
 		mutex_init(&wpan_dev->association_lock);
 		INIT_LIST_HEAD(&wpan_dev->children);
+		wpan_dev->max_associations = SZ_16K;
 
 		wpan_dev->netdev = dev;
 		break;
diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index 5820fe425ddd..e16e57fc34d0 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -234,6 +234,7 @@ static const struct nla_policy nl802154_policy[NL802154_ATTR_MAX+1] = {
 				 NL802154_SCAN_DONE_REASON_ABORTED),
 	[NL802154_ATTR_BEACON_INTERVAL] =
 		NLA_POLICY_MAX(NLA_U8, IEEE802154_ACTIVE_SCAN_DURATION),
+	[NL802154_ATTR_MAX_ASSOCIATIONS] = { .type = NLA_U32 },
 
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	[NL802154_ATTR_SEC_ENABLED] = { .type = NLA_U8, },
@@ -1696,6 +1697,26 @@ static int nl802154_disassociate(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
+static int nl802154_set_max_associations(struct sk_buff *skb, struct genl_info *info)
+{
+	struct net_device *dev = info->user_ptr[1];
+	struct wpan_dev *wpan_dev = dev->ieee802154_ptr;
+	unsigned int max_assoc;
+
+	if (!info->attrs[NL802154_ATTR_MAX_ASSOCIATIONS]) {
+		NL_SET_ERR_MSG(info->extack, "No maximum number of association given");
+		return -EINVAL;
+	}
+
+	max_assoc = nla_get_u32(info->attrs[NL802154_ATTR_MAX_ASSOCIATIONS]);
+
+	mutex_lock(&wpan_dev->association_lock);
+	cfg802154_set_max_associations(wpan_dev, max_assoc);
+	mutex_unlock(&wpan_dev->association_lock);
+
+	return 0;
+}
+
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 static const struct nla_policy nl802154_dev_addr_policy[NL802154_DEV_ADDR_ATTR_MAX + 1] = {
 	[NL802154_DEV_ADDR_ATTR_PAN_ID] = { .type = NLA_U16 },
@@ -2833,6 +2854,13 @@ static const struct genl_ops nl802154_ops[] = {
 				  NL802154_FLAG_CHECK_NETDEV_UP |
 				  NL802154_FLAG_NEED_RTNL,
 	},
+	{
+		.cmd = NL802154_CMD_SET_MAX_ASSOCIATIONS,
+		.doit = nl802154_set_max_associations,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = NL802154_FLAG_NEED_NETDEV |
+				  NL802154_FLAG_NEED_RTNL,
+	},
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	{
 		.cmd = NL802154_CMD_SET_SEC_PARAMS,
diff --git a/net/ieee802154/pan.c b/net/ieee802154/pan.c
index 7756906c201d..138a55847d78 100644
--- a/net/ieee802154/pan.c
+++ b/net/ieee802154/pan.c
@@ -93,3 +93,11 @@ __le16 cfg802154_get_free_short_addr(struct wpan_dev *wpan_dev)
 	return addr;
 }
 EXPORT_SYMBOL_GPL(cfg802154_get_free_short_addr);
+
+void cfg802154_set_max_associations(struct wpan_dev *wpan_dev, unsigned int max)
+{
+	lockdep_assert_held(&wpan_dev->association_lock);
+
+	wpan_dev->max_associations = max;
+}
+EXPORT_SYMBOL_GPL(cfg802154_set_max_associations);
-- 
2.34.1

