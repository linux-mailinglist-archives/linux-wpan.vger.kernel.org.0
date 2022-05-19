Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4425E52D6E7
	for <lists+linux-wpan@lfdr.de>; Thu, 19 May 2022 17:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240346AbiESPFz (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 19 May 2022 11:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238100AbiESPFk (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 19 May 2022 11:05:40 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FF83B027;
        Thu, 19 May 2022 08:05:30 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3C0181BF207;
        Thu, 19 May 2022 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652972728;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0nZHtDn2eNekI/EBlxrKDuIGysSCKcjtwg1Ttl+VZA8=;
        b=LnwqJXWqP1yWpYM+wL9dw5sSw9kyMl6uq402pLagyB3/yl4NEJJcTK3JWCP+XNaFKLOhp0
        aFK2Hpx6W4jT5SeFOS3jjrKt79u4GbQrYk3PRQK07mv56gboV8dZr/DtiIGRExgA7oIs3t
        KulH1mTzHrQ5ahPdvajOZhCzB9xoct/YKvB6PYW+4xhx5niYk7M5QxdK6Up6U7FuMo0/pw
        X0AnsyusH8wF3/knNyGNdMh3ErfkFAC46Ay+ZGPyGHd8QnA0xtqMfUc5kp0GQ7KMGdr45z
        3XZ6Z3bIptuhaEgSXlAZqMkyqm6Y8V0K5f7Ru31FwiQhwbPVxk0dym5nbbERcg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH wpan-next v4 05/11] net: mac802154: Bring the ability to hold the transmit queue
Date:   Thu, 19 May 2022 17:05:10 +0200
Message-Id: <20220519150516.443078-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519150516.443078-1-miquel.raynal@bootlin.com>
References: <20220519150516.443078-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Create a hold_txs atomic variable and increment/decrement it when
relevant, ie. when we want to hold the queue or release it: currently
all the "stopped" situations are suitable, but very soon we will more
extensively use this feature for MLME purposes.

Upon release, the atomic counter is decremented and checked. If it is
back to 0, then the netif queue gets woken up. This makes the whole
process fully transparent, provided that all the users of
ieee802154_wake/stop_queue() now call ieee802154_hold/release_queue()
instead.

In no situation individual drivers should call any of these helpers
manually in order to avoid messing with the counters. There are other
functions more suited for this purpose which have been introduced, such
as the _xmit_complete() and _xmit_error() helpers which will handle all
that for them.

One advantage is that, as no more drivers call the stop/wake helpers
directly, we can safely stop exporting them and only declare the
hold/release ones in a header only accessible to the core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/net/cfg802154.h      |  6 +++--
 include/net/mac802154.h      | 27 -------------------
 net/ieee802154/core.c        |  2 ++
 net/mac802154/cfg.c          |  4 +--
 net/mac802154/ieee802154_i.h | 19 +++++++++++++
 net/mac802154/tx.c           |  6 ++---
 net/mac802154/util.c         | 52 +++++++++++++++++++++++++++++++-----
 7 files changed, 75 insertions(+), 41 deletions(-)

diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
index 473ebcb9b155..7a191418f258 100644
--- a/include/net/cfg802154.h
+++ b/include/net/cfg802154.h
@@ -11,7 +11,7 @@
 
 #include <linux/ieee802154.h>
 #include <linux/netdevice.h>
-#include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/bug.h>
 
 #include <net/nl802154.h>
@@ -214,8 +214,10 @@ struct wpan_phy {
 	/* the network namespace this phy lives in currently */
 	possible_net_t _net;
 
-	/* Transmission monitoring */
+	/* Transmission monitoring and control */
+	spinlock_t queue_lock;
 	atomic_t ongoing_txs;
+	atomic_t hold_txs;
 
 	char priv[] __aligned(NETDEV_ALIGN);
 };
diff --git a/include/net/mac802154.h b/include/net/mac802154.h
index bdac0ddbdcdb..357d25ef627a 100644
--- a/include/net/mac802154.h
+++ b/include/net/mac802154.h
@@ -460,33 +460,6 @@ void ieee802154_unregister_hw(struct ieee802154_hw *hw);
  */
 void ieee802154_rx_irqsafe(struct ieee802154_hw *hw, struct sk_buff *skb,
 			   u8 lqi);
-/**
- * ieee802154_wake_queue - wake ieee802154 queue
- * @hw: pointer as obtained from ieee802154_alloc_hw().
- *
- * Tranceivers usually have either one transmit framebuffer or one framebuffer
- * for both transmitting and receiving. Hence, the core currently only handles
- * one frame at a time for each phy, which means we had to stop the queue to
- * avoid new skb to come during the transmission. The queue then needs to be
- * woken up after the operation.
- *
- * Drivers should use this function instead of netif_wake_queue.
- */
-void ieee802154_wake_queue(struct ieee802154_hw *hw);
-
-/**
- * ieee802154_stop_queue - stop ieee802154 queue
- * @hw: pointer as obtained from ieee802154_alloc_hw().
- *
- * Tranceivers usually have either one transmit framebuffer or one framebuffer
- * for both transmitting and receiving. Hence, the core currently only handles
- * one frame at a time for each phy, which means we need to tell upper layers to
- * stop giving us new skbs while we are busy with the transmitted one. The queue
- * must then be stopped before transmitting.
- *
- * Drivers should use this function instead of netif_stop_queue.
- */
-void ieee802154_stop_queue(struct ieee802154_hw *hw);
 
 /**
  * ieee802154_xmit_complete - frame transmission complete
diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
index de259b5170ab..47a4de6df88b 100644
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -130,6 +130,8 @@ wpan_phy_new(const struct cfg802154_ops *ops, size_t priv_size)
 
 	init_waitqueue_head(&rdev->dev_wait);
 
+	spin_lock_init(&rdev->wpan_phy.queue_lock);
+
 	return &rdev->wpan_phy;
 }
 EXPORT_SYMBOL(wpan_phy_new);
diff --git a/net/mac802154/cfg.c b/net/mac802154/cfg.c
index 1e4a9f74ed43..b51100fd9e3f 100644
--- a/net/mac802154/cfg.c
+++ b/net/mac802154/cfg.c
@@ -46,7 +46,7 @@ static int ieee802154_suspend(struct wpan_phy *wpan_phy)
 	if (!local->open_count)
 		goto suspend;
 
-	ieee802154_stop_queue(&local->hw);
+	ieee802154_hold_queue(local);
 	synchronize_net();
 
 	/* stop hardware - this must stop RX */
@@ -72,7 +72,7 @@ static int ieee802154_resume(struct wpan_phy *wpan_phy)
 		return ret;
 
 wake_up:
-	ieee802154_wake_queue(&local->hw);
+	ieee802154_release_queue(local);
 	local->suspended = false;
 	return 0;
 }
diff --git a/net/mac802154/ieee802154_i.h b/net/mac802154/ieee802154_i.h
index a8b7b9049f14..0c7ff9e0b632 100644
--- a/net/mac802154/ieee802154_i.h
+++ b/net/mac802154/ieee802154_i.h
@@ -130,6 +130,25 @@ netdev_tx_t
 ieee802154_subif_start_xmit(struct sk_buff *skb, struct net_device *dev);
 enum hrtimer_restart ieee802154_xmit_ifs_timer(struct hrtimer *timer);
 
+/**
+ * ieee802154_hold_queue - hold ieee802154 queue
+ * @local: main mac object
+ *
+ * Hold a queue by incrementing an atomic counter and requesting the netif
+ * queues to be stopped. The queues cannot be woken up while the counter has not
+ * been reset with as any ieee802154_release_queue() calls as needed.
+ */
+void ieee802154_hold_queue(struct ieee802154_local *local);
+
+/**
+ * ieee802154_release_queue - release ieee802154 queue
+ * @local: main mac object
+ *
+ * Release a queue which is held by decrementing an atomic counter and wake it
+ * up only if the counter reaches 0.
+ */
+void ieee802154_release_queue(struct ieee802154_local *local);
+
 /* MIB callbacks */
 void mac802154_dev_set_page_channel(struct net_device *dev, u8 page, u8 chan);
 
diff --git a/net/mac802154/tx.c b/net/mac802154/tx.c
index 33f64ecd96c7..6a53c83cf039 100644
--- a/net/mac802154/tx.c
+++ b/net/mac802154/tx.c
@@ -43,7 +43,7 @@ void ieee802154_xmit_sync_worker(struct work_struct *work)
 
 err_tx:
 	/* Restart the netif queue on each sub_if_data object. */
-	ieee802154_wake_queue(&local->hw);
+	ieee802154_release_queue(local);
 	atomic_dec(&local->phy->ongoing_txs);
 	kfree_skb(skb);
 	netdev_dbg(dev, "transmission failed\n");
@@ -75,7 +75,7 @@ ieee802154_tx(struct ieee802154_local *local, struct sk_buff *skb)
 	}
 
 	/* Stop the netif queue on each sub_if_data object. */
-	ieee802154_stop_queue(&local->hw);
+	ieee802154_hold_queue(local);
 	atomic_inc(&local->phy->ongoing_txs);
 
 	/* Drivers should preferably implement the async callback. In some rare
@@ -99,7 +99,7 @@ ieee802154_tx(struct ieee802154_local *local, struct sk_buff *skb)
 	return NETDEV_TX_OK;
 
 err_wake_netif_queue:
-	ieee802154_wake_queue(&local->hw);
+	ieee802154_release_queue(local);
 	atomic_dec(&local->phy->ongoing_txs);
 err_free_skb:
 	kfree_skb(skb);
diff --git a/net/mac802154/util.c b/net/mac802154/util.c
index 76dc663e2af4..0ed8b5bcbe8a 100644
--- a/net/mac802154/util.c
+++ b/net/mac802154/util.c
@@ -13,7 +13,17 @@
 /* privid for wpan_phys to determine whether they belong to us or not */
 const void *const mac802154_wpan_phy_privid = &mac802154_wpan_phy_privid;
 
-void ieee802154_wake_queue(struct ieee802154_hw *hw)
+/**
+ * ieee802154_wake_queue - wake ieee802154 queue
+ * @local: main mac object
+ *
+ * Tranceivers usually have either one transmit framebuffer or one framebuffer
+ * for both transmitting and receiving. Hence, the core currently only handles
+ * one frame at a time for each phy, which means we had to stop the queue to
+ * avoid new skb to come during the transmission. The queue then needs to be
+ * woken up after the operation.
+ */
+static void ieee802154_wake_queue(struct ieee802154_hw *hw)
 {
 	struct ieee802154_local *local = hw_to_local(hw);
 	struct ieee802154_sub_if_data *sdata;
@@ -27,9 +37,18 @@ void ieee802154_wake_queue(struct ieee802154_hw *hw)
 	}
 	rcu_read_unlock();
 }
-EXPORT_SYMBOL(ieee802154_wake_queue);
 
-void ieee802154_stop_queue(struct ieee802154_hw *hw)
+/**
+ * ieee802154_stop_queue - stop ieee802154 queue
+ * @local: main mac object
+ *
+ * Tranceivers usually have either one transmit framebuffer or one framebuffer
+ * for both transmitting and receiving. Hence, the core currently only handles
+ * one frame at a time for each phy, which means we need to tell upper layers to
+ * stop giving us new skbs while we are busy with the transmitted one. The queue
+ * must then be stopped before transmitting.
+ */
+static void ieee802154_stop_queue(struct ieee802154_hw *hw)
 {
 	struct ieee802154_local *local = hw_to_local(hw);
 	struct ieee802154_sub_if_data *sdata;
@@ -43,14 +62,33 @@ void ieee802154_stop_queue(struct ieee802154_hw *hw)
 	}
 	rcu_read_unlock();
 }
-EXPORT_SYMBOL(ieee802154_stop_queue);
+
+void ieee802154_hold_queue(struct ieee802154_local *local)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&local->phy->queue_lock, flags);
+	if (!atomic_fetch_inc(&local->phy->hold_txs))
+		ieee802154_stop_queue(&local->hw);
+	spin_unlock_irqrestore(&local->phy->queue_lock, flags);
+}
+
+void ieee802154_release_queue(struct ieee802154_local *local)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&local->phy->queue_lock, flags);
+	if (!atomic_dec_and_test(&local->phy->hold_txs))
+		ieee802154_wake_queue(&local->hw);
+	spin_unlock_irqrestore(&local->phy->queue_lock, flags);
+}
 
 enum hrtimer_restart ieee802154_xmit_ifs_timer(struct hrtimer *timer)
 {
 	struct ieee802154_local *local =
 		container_of(timer, struct ieee802154_local, ifs_timer);
 
-	ieee802154_wake_queue(&local->hw);
+	ieee802154_release_queue(local);
 
 	return HRTIMER_NORESTART;
 }
@@ -84,7 +122,7 @@ void ieee802154_xmit_complete(struct ieee802154_hw *hw, struct sk_buff *skb,
 				      hw->phy->sifs_period * NSEC_PER_USEC,
 				      HRTIMER_MODE_REL);
 	} else {
-		ieee802154_wake_queue(hw);
+		ieee802154_release_queue(local);
 	}
 
 	dev_consume_skb_any(skb);
@@ -98,7 +136,7 @@ void ieee802154_xmit_error(struct ieee802154_hw *hw, struct sk_buff *skb,
 	struct ieee802154_local *local = hw_to_local(hw);
 
 	local->tx_result = reason;
-	ieee802154_wake_queue(hw);
+	ieee802154_release_queue(local);
 	dev_kfree_skb_any(skb);
 	atomic_dec(&hw->phy->ongoing_txs);
 }
-- 
2.34.1

