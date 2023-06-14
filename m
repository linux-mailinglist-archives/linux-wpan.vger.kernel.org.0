Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92C171A32D
	for <lists+linux-wpan@lfdr.de>; Thu,  1 Jun 2023 17:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbjFAPuU (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 1 Jun 2023 11:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235166AbjFAPtX (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 1 Jun 2023 11:49:23 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DED10DC;
        Thu,  1 Jun 2023 08:48:48 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685634527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7gtO8YzcVvtdc2HoI0634FJxvpThUhRmuHAgUwSgguM=;
        b=WScSjCz3pit9oz9ThBsTSd9g1t3ozxUnTrLIz8WnJbBy2IIeNGCDfn5OisY/D7XWtBIJCK
        KL6nO+8//+0SqsC2A4/1EBCFuMx1kZOH+VZSxPRsDBQpXWoDfNW/tYdLoYPnWjGDsVbSrj
        E9oPL5GFhpr4v/G11CBn9zdZh6ENCYhiX9/ci2yjZRHYb8HCAN4QmMrE8MI5vx7CGd7Vt+
        VSI12J2btEAdOn3clQKTWS+GqYk4II/U3uSfrGoP9gRCJPswGvWYSLCVxaVfkmJ53BzXv/
        DXLHTt96zMfBEUwXBnT8qKUk+Cd0xPulr/ekP8fJXrdM+GEABIvQwzRK6EpeNw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACD12C0018;
        Thu,  1 Jun 2023 15:48:45 +0000 (UTC)
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
Subject: [PATCH wpan-next 11/11] ieee802154: Give the user the association list
Date:   Thu,  1 Jun 2023 17:48:17 +0200
Message-Id: <20230601154817.754519-12-miquel.raynal@bootlin.com>
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

Upon request, we must be able to provide to the user the list of
associations currently in place. Let's add a new netlink command and
attribute for this purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/net/nl802154.h    |  18 ++++++-
 net/ieee802154/nl802154.c | 107 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/include/net/nl802154.h b/include/net/nl802154.h
index 8b26faae49e8..4c752f799957 100644
--- a/include/net/nl802154.h
+++ b/include/net/nl802154.h
@@ -81,6 +81,7 @@ enum nl802154_commands {
 	NL802154_CMD_ASSOCIATE,
 	NL802154_CMD_DISASSOCIATE,
 	NL802154_CMD_SET_MAX_ASSOCIATIONS,
+	NL802154_CMD_LIST_ASSOCIATIONS,
 
 	/* add new commands above here */
 
@@ -151,6 +152,7 @@ enum nl802154_attrs {
 	NL802154_ATTR_SCAN_DONE_REASON,
 	NL802154_ATTR_BEACON_INTERVAL,
 	NL802154_ATTR_MAX_ASSOCIATIONS,
+	NL802154_ATTR_PEER,
 
 	/* add attributes here, update the policy in nl802154.c */
 
@@ -389,8 +391,6 @@ enum nl802154_supported_bool_states {
 	NL802154_SUPPORTED_BOOL_MAX = __NL802154_SUPPORTED_BOOL_AFTER_LAST - 1
 };
 
-#ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
-
 enum nl802154_dev_addr_modes {
 	NL802154_DEV_ADDR_NONE,
 	__NL802154_DEV_ADDR_INVALID,
@@ -410,12 +410,26 @@ enum nl802154_dev_addr_attrs {
 	NL802154_DEV_ADDR_ATTR_SHORT,
 	NL802154_DEV_ADDR_ATTR_EXTENDED,
 	NL802154_DEV_ADDR_ATTR_PAD,
+	NL802154_DEV_ADDR_ATTR_PEER_TYPE,
 
 	/* keep last */
 	__NL802154_DEV_ADDR_ATTR_AFTER_LAST,
 	NL802154_DEV_ADDR_ATTR_MAX = __NL802154_DEV_ADDR_ATTR_AFTER_LAST - 1
 };
 
+enum nl802154_peer_type {
+	NL802154_PEER_TYPE_UNSPEC,
+
+	NL802154_PEER_TYPE_PARENT,
+	NL802154_PEER_TYPE_CHILD,
+
+	/* keep last */
+	__NL802154_PEER_TYPE_AFTER_LAST,
+	NL802154_PEER_TYPE_MAX = __NL802154_PEER_TYPE_AFTER_LAST - 1
+};
+
+#ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
+
 enum nl802154_key_id_modes {
 	NL802154_KEY_ID_MODE_IMPLICIT,
 	NL802154_KEY_ID_MODE_INDEX,
diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index e16e57fc34d0..e26d7cec02ce 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -235,6 +235,7 @@ static const struct nla_policy nl802154_policy[NL802154_ATTR_MAX+1] = {
 	[NL802154_ATTR_BEACON_INTERVAL] =
 		NLA_POLICY_MAX(NLA_U8, IEEE802154_ACTIVE_SCAN_DURATION),
 	[NL802154_ATTR_MAX_ASSOCIATIONS] = { .type = NLA_U32 },
+	[NL802154_ATTR_PEER] = { .type = NLA_NESTED },
 
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	[NL802154_ATTR_SEC_ENABLED] = { .type = NLA_U8, },
@@ -1717,6 +1718,107 @@ static int nl802154_set_max_associations(struct sk_buff *skb, struct genl_info *
 	return 0;
 }
 
+static int nl802154_send_peer_info(struct sk_buff *msg,
+				   struct netlink_callback *cb,
+				   u32 seq, int flags,
+				   struct cfg802154_registered_device *rdev,
+				   struct wpan_dev *wpan_dev,
+				   struct ieee802154_pan_device *peer,
+				   enum nl802154_peer_type type)
+{
+	struct nlattr *nla;
+	void *hdr;
+
+	ASSERT_RTNL();
+
+	hdr = nl802154hdr_put(msg, NETLINK_CB(cb->skb).portid, seq, flags,
+			      NL802154_CMD_LIST_ASSOCIATIONS);
+	if (!hdr)
+		return -ENOBUFS;
+
+	genl_dump_check_consistent(cb, hdr);
+
+	if (nla_put_u32(msg, NL802154_ATTR_GENERATION,
+			wpan_dev->association_generation))
+		goto nla_put_failure;
+
+	nla = nla_nest_start_noflag(msg, NL802154_ATTR_PEER);
+	if (!nla)
+		goto nla_put_failure;
+
+	if (nla_put_u8(msg, NL802154_DEV_ADDR_ATTR_PEER_TYPE, type))
+		goto nla_put_failure;
+
+	if (nla_put_u8(msg, NL802154_DEV_ADDR_ATTR_MODE, peer->mode))
+		goto nla_put_failure;
+
+	if (nla_put(msg, NL802154_DEV_ADDR_ATTR_SHORT,
+		    IEEE802154_SHORT_ADDR_LEN, &peer->short_addr))
+		goto nla_put_failure;
+
+	if (nla_put(msg, NL802154_DEV_ADDR_ATTR_EXTENDED,
+		    IEEE802154_EXTENDED_ADDR_LEN, &peer->extended_addr))
+		goto nla_put_failure;
+
+	nla_nest_end(msg, nla);
+
+	genlmsg_end(msg, hdr);
+
+	return 0;
+
+ nla_put_failure:
+	genlmsg_cancel(msg, hdr);
+	return -EMSGSIZE;
+}
+
+static int nl802154_list_associations(struct sk_buff *skb,
+				      struct netlink_callback *cb)
+{
+	struct cfg802154_registered_device *rdev;
+	struct ieee802154_pan_device *child;
+	struct wpan_dev *wpan_dev;
+	int err;
+
+	err = nl802154_prepare_wpan_dev_dump(skb, cb, &rdev, &wpan_dev);
+	if (err)
+		return err;
+
+	mutex_lock(&wpan_dev->association_lock);
+
+	if (cb->args[2])
+		goto out;
+
+	cb->seq = wpan_dev->association_generation;
+
+	if (wpan_dev->parent) {
+		err = nl802154_send_peer_info(skb, cb, cb->nlh->nlmsg_seq,
+					      NLM_F_MULTI, rdev, wpan_dev,
+					      wpan_dev->parent,
+					      NL802154_PEER_TYPE_PARENT);
+		if (err < 0)
+			goto out_err;
+	}
+
+	list_for_each_entry(child, &wpan_dev->children, node) {
+		err = nl802154_send_peer_info(skb, cb, cb->nlh->nlmsg_seq,
+					      NLM_F_MULTI, rdev, wpan_dev,
+					      child,
+					      NL802154_PEER_TYPE_CHILD);
+		if (err < 0)
+			goto out_err;
+	}
+
+	cb->args[2] = 1;
+out:
+	err = skb->len;
+out_err:
+	mutex_unlock(&wpan_dev->association_lock);
+
+	nl802154_finish_wpan_dev_dump(rdev);
+
+	return err;
+}
+
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 static const struct nla_policy nl802154_dev_addr_policy[NL802154_DEV_ADDR_ATTR_MAX + 1] = {
 	[NL802154_DEV_ADDR_ATTR_PAN_ID] = { .type = NLA_U16 },
@@ -2861,6 +2963,11 @@ static const struct genl_ops nl802154_ops[] = {
 		.internal_flags = NL802154_FLAG_NEED_NETDEV |
 				  NL802154_FLAG_NEED_RTNL,
 	},
+	{
+		.cmd = NL802154_CMD_LIST_ASSOCIATIONS,
+		.dumpit = nl802154_list_associations,
+		/* can be retrieved by unprivileged users */
+	},
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	{
 		.cmd = NL802154_CMD_SET_SEC_PARAMS,
-- 
2.34.1

