Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A16E65635C5
	for <lists+linux-wpan@lfdr.de>; Fri,  1 Jul 2022 16:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiGAOgQ (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 1 Jul 2022 10:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiGAOfm (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 1 Jul 2022 10:35:42 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5854570E51;
        Fri,  1 Jul 2022 07:31:17 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 747AFFF805;
        Fri,  1 Jul 2022 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656685876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TbMmowi6WNrr0dtfGsF6+M3QASvsoYi+RRE5gwHNHCU=;
        b=Q2sT6anyqQNs9gLJ3cLbAo3kKrq1bX77USCaUWnhL/kLa1EpI/8SkN5GVX/Tl4wNJ+T9O3
        7Upt0qHit0J71WpaMpQNt+zC4MTpi5nPK1mxrr0C+2VscEJ+h77oTX7hsXKgY8WeMO5ahm
        Dj0BE9lFirA3VNWNQ21iYCIxkKUe9Bq3O7eRKbNipo2pEdUP12JPTuL4E9zA4gVAVTkr9J
        /Xh6WsnuliPRE2MOdg7U8vWnXdB9AHx02+6x+BOWRinIehcQkdPeF5uqm2URXzdxyvpcw3
        Pt4DwE/YwVEIU2KaeouShYjyqqbafjwG03XcsFfWVjAru4OI+oUhltG2lyuK5g==
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
Subject: [PATCH wpan-next 10/20] net: mac802154: Handle passive scanning
Date:   Fri,  1 Jul 2022 16:30:42 +0200
Message-Id: <20220701143052.1267509-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701143052.1267509-1-miquel.raynal@bootlin.com>
References: <20220701143052.1267509-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Implement the core hooks in order to provide the softMAC layer support
for passive scans. Scans are requested by the user and can be aborted.

Changing the channels is prohibited during the scan.

As transceivers enter promiscuous mode during scans, they might stop
checking frame validity so we ensure this gets done at mac level.

The implementation uses a workqueue triggered at a certain interval
depending on the symbol duration for the current channel and the
duration order provided.

Received beacons during a passive scan are processed also in a work
queue and forwarded to the upper layer.

Active scanning is not supported yet.

Co-developed-by: David Girault <david.girault@qorvo.com>
Signed-off-by: David Girault <david.girault@qorvo.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/ieee802154.h   |   4 +
 include/net/cfg802154.h      |  12 ++
 net/mac802154/Makefile       |   2 +-
 net/mac802154/cfg.c          |  39 ++++++
 net/mac802154/ieee802154_i.h |  29 ++++
 net/mac802154/iface.c        |   6 +
 net/mac802154/main.c         |   4 +
 net/mac802154/rx.c           |  49 ++++++-
 net/mac802154/scan.c         | 264 +++++++++++++++++++++++++++++++++++
 9 files changed, 405 insertions(+), 4 deletions(-)
 create mode 100644 net/mac802154/scan.c

diff --git a/include/linux/ieee802154.h b/include/linux/ieee802154.h
index 929d4e672575..94bfee22bd0a 100644
--- a/include/linux/ieee802154.h
+++ b/include/linux/ieee802154.h
@@ -47,6 +47,10 @@
 /* Duration in superframe order */
 #define IEEE802154_MAX_SCAN_DURATION	14
 #define IEEE802154_ACTIVE_SCAN_DURATION	15
+/* Superframe duration in slots */
+#define IEEE802154_SUPERFRAME_PERIOD	16
+/* Various periods expressed in symbols */
+#define IEEE802154_SLOT_PERIOD		60
 #define IEEE802154_LIFS_PERIOD		40
 #define IEEE802154_SIFS_PERIOD		12
 #define IEEE802154_MAX_SIFS_FRAME_SIZE	18
diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
index f05ce3c45b5d..206283fd4b72 100644
--- a/include/net/cfg802154.h
+++ b/include/net/cfg802154.h
@@ -300,6 +300,18 @@ struct cfg802154_scan_request {
 	struct wpan_phy *wpan_phy;
 };
 
+/**
+ * struct cfg802154_mac_pkt - MAC packet descriptor (beacon/command)
+ * @node: MAC packets to process list member
+ * @skb: the received sk_buff
+ * @sdata: the interface on which @skb was received
+ */
+struct cfg802154_mac_pkt {
+	struct list_head node;
+	struct sk_buff *skb;
+	struct ieee802154_sub_if_data *sdata;
+};
+
 struct ieee802154_llsec_key_id {
 	u8 mode;
 	u8 id;
diff --git a/net/mac802154/Makefile b/net/mac802154/Makefile
index 4059295fdbf8..43d1347b37ee 100644
--- a/net/mac802154/Makefile
+++ b/net/mac802154/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MAC802154)	+= mac802154.o
 mac802154-objs		:= main.o rx.o tx.o mac_cmd.o mib.o \
-			   iface.o llsec.o util.o cfg.o trace.o
+			   iface.o llsec.o util.o cfg.o scan.o trace.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/net/mac802154/cfg.c b/net/mac802154/cfg.c
index 4116a894c86e..1f532d93d870 100644
--- a/net/mac802154/cfg.c
+++ b/net/mac802154/cfg.c
@@ -114,6 +114,10 @@ ieee802154_set_channel(struct wpan_phy *wpan_phy, u8 page, u8 channel)
 	    wpan_phy->current_channel == channel)
 		return 0;
 
+	/* Refuse to change channels during a scanning operation */
+	if (mac802154_is_scanning(local))
+		return -EBUSY;
+
 	ret = drv_set_channel(local, page, channel);
 	if (!ret) {
 		wpan_phy->current_page = page;
@@ -261,6 +265,39 @@ ieee802154_set_ackreq_default(struct wpan_phy *wpan_phy,
 	return 0;
 }
 
+static int mac802154_trigger_scan(struct wpan_phy *wpan_phy,
+				  struct cfg802154_scan_request *request)
+{
+	struct ieee802154_local *local = wpan_phy_priv(wpan_phy);
+	struct ieee802154_sub_if_data *sdata;
+	int ret;
+
+	sdata = IEEE802154_WPAN_DEV_TO_SUB_IF(request->wpan_dev);
+
+	ASSERT_RTNL();
+
+	mutex_lock(&local->scan_lock);
+	ret = mac802154_trigger_scan_locked(sdata, request);
+	mutex_unlock(&local->scan_lock);
+
+	return ret;
+}
+
+static int mac802154_abort_scan(struct wpan_phy *wpan_phy,
+				struct wpan_dev *wpan_dev)
+{
+	struct ieee802154_local *local = wpan_phy_priv(wpan_phy);
+	int ret;
+
+	ASSERT_RTNL();
+
+	mutex_lock(&local->scan_lock);
+	ret = mac802154_abort_scan_locked(local);
+	mutex_unlock(&local->scan_lock);
+
+	return ret;
+}
+
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 static void
 ieee802154_get_llsec_table(struct wpan_phy *wpan_phy,
@@ -468,6 +505,8 @@ const struct cfg802154_ops mac802154_config_ops = {
 	.set_max_frame_retries = ieee802154_set_max_frame_retries,
 	.set_lbt_mode = ieee802154_set_lbt_mode,
 	.set_ackreq_default = ieee802154_set_ackreq_default,
+	.trigger_scan = mac802154_trigger_scan,
+	.abort_scan = mac802154_abort_scan,
 #ifdef CONFIG_IEEE802154_NL802154_EXPERIMENTAL
 	.get_llsec_table = ieee802154_get_llsec_table,
 	.lock_llsec_table = ieee802154_lock_llsec_table,
diff --git a/net/mac802154/ieee802154_i.h b/net/mac802154/ieee802154_i.h
index b8775bcc9003..46394e2e0486 100644
--- a/net/mac802154/ieee802154_i.h
+++ b/net/mac802154/ieee802154_i.h
@@ -21,6 +21,10 @@
 
 #include "llsec.h"
 
+enum ieee802154_ongoing {
+	IEEE802154_IS_SCANNING = BIT(0),
+};
+
 /* mac802154 device private data */
 struct ieee802154_local {
 	struct ieee802154_hw hw;
@@ -50,8 +54,19 @@ struct ieee802154_local {
 
 	struct hrtimer ifs_timer;
 
+	/* Scanning */
+	struct mutex scan_lock;
+	int scan_channel_idx;
+	struct cfg802154_scan_request __rcu *scan_req;
+	struct delayed_work scan_work;
+
+	/* Asynchronous tasks */
+	struct list_head rx_beacon_list;
+	struct work_struct rx_beacon_work;
+
 	bool started;
 	bool suspended;
+	unsigned long ongoing;
 
 	struct tasklet_struct tasklet;
 	struct sk_buff_head skb_queue;
@@ -210,6 +225,20 @@ void mac802154_unlock_table(struct net_device *dev);
 
 int mac802154_wpan_update_llsec(struct net_device *dev);
 
+/* PAN management handling */
+void mac802154_scan_worker(struct work_struct *work);
+int mac802154_trigger_scan_locked(struct ieee802154_sub_if_data *sdata,
+				  struct cfg802154_scan_request *request);
+int mac802154_abort_scan_locked(struct ieee802154_local *local);
+int mac802154_process_beacon(struct ieee802154_local *local,
+			     struct sk_buff *skb);
+void mac802154_rx_beacon_worker(struct work_struct *work);
+
+static inline bool mac802154_is_scanning(struct ieee802154_local *local)
+{
+	return test_bit(IEEE802154_IS_SCANNING, &local->ongoing);
+}
+
 /* interface handling */
 int ieee802154_iface_init(void);
 void ieee802154_iface_exit(void);
diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index 7715e17d9ba1..431cc544dbf2 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -315,6 +315,12 @@ static int mac802154_slave_close(struct net_device *dev)
 
 	ASSERT_RTNL();
 
+	if (mac802154_is_scanning(local)) {
+		mutex_lock(&local->scan_lock);
+		mac802154_abort_scan_locked(local);
+		mutex_unlock(&local->scan_lock);
+	}
+
 	mutex_lock(&local->device_lock);
 
 	netif_stop_queue(dev);
diff --git a/net/mac802154/main.c b/net/mac802154/main.c
index e5fb7ed73663..604fbc5b07df 100644
--- a/net/mac802154/main.c
+++ b/net/mac802154/main.c
@@ -89,14 +89,18 @@ ieee802154_alloc_hw(size_t priv_data_len, const struct ieee802154_ops *ops)
 	local->ops = ops;
 
 	INIT_LIST_HEAD(&local->interfaces);
+	INIT_LIST_HEAD(&local->rx_beacon_list);
 	mutex_init(&local->iflist_mtx);
 	mutex_init(&local->device_lock);
+	mutex_init(&local->scan_lock);
 
 	tasklet_setup(&local->tasklet, ieee802154_tasklet_handler);
 
 	skb_queue_head_init(&local->skb_queue);
 
 	INIT_WORK(&local->sync_tx_work, ieee802154_xmit_sync_worker);
+	INIT_DELAYED_WORK(&local->scan_work, mac802154_scan_worker);
+	INIT_WORK(&local->rx_beacon_work, mac802154_rx_beacon_worker);
 
 	/* init supported flags with 802.15.4 default ranges */
 	phy->supported.max_minbe = 8;
diff --git a/net/mac802154/rx.c b/net/mac802154/rx.c
index 39459d8d787a..0b1cf8c85ee9 100644
--- a/net/mac802154/rx.c
+++ b/net/mac802154/rx.c
@@ -29,11 +29,36 @@ static int ieee802154_deliver_skb(struct sk_buff *skb)
 	return netif_receive_skb(skb);
 }
 
+void mac802154_rx_beacon_worker(struct work_struct *work)
+{
+	struct ieee802154_local *local =
+		container_of(work, struct ieee802154_local, rx_beacon_work);
+	struct cfg802154_mac_pkt *mac_pkt;
+
+	mutex_lock(&local->scan_lock);
+
+	if (list_empty(&local->rx_beacon_list))
+		goto unlock;
+
+	mac_pkt = list_first_entry(&local->rx_beacon_list,
+				   struct cfg802154_mac_pkt, node);
+
+	mac802154_process_beacon(local, mac_pkt->skb);
+
+	list_del(&mac_pkt->node);
+	kfree_skb(mac_pkt->skb);
+	kfree(mac_pkt);
+
+unlock:
+	mutex_unlock(&local->scan_lock);
+}
+
 static int
 ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 		       struct sk_buff *skb, const struct ieee802154_hdr *hdr)
 {
 	struct wpan_dev *wpan_dev = &sdata->wpan_dev;
+	struct cfg802154_mac_pkt *mac_pkt;
 	__le16 span, sshort;
 	int rc;
 
@@ -94,6 +119,18 @@ ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 
 	switch (mac_cb(skb)->type) {
 	case IEEE802154_FC_TYPE_BEACON:
+		if (!mac802154_is_scanning(sdata->local))
+			goto fail;
+
+		mac_pkt = kzalloc(sizeof(*mac_pkt), GFP_ATOMIC);
+		if (!mac_pkt)
+			goto fail;
+
+		mac_pkt->skb = skb_get(skb);
+		mac_pkt->sdata = sdata;
+		list_add_tail(&mac_pkt->node, &sdata->local->rx_beacon_list);
+		queue_work(sdata->local->workqueue, &sdata->local->rx_beacon_work);
+		goto success;
 	case IEEE802154_FC_TYPE_ACK:
 	case IEEE802154_FC_TYPE_MAC_CMD:
 		goto fail;
@@ -109,6 +146,10 @@ ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 fail:
 	kfree_skb(skb);
 	return NET_RX_DROP;
+
+success:
+	kfree_skb(skb);
+	return NET_RX_SUCCESS;
 }
 
 static void
@@ -268,10 +309,12 @@ void ieee802154_rx(struct ieee802154_local *local, struct sk_buff *skb)
 
 	ieee802154_monitors_rx(local, skb);
 
-	/* Check if transceiver doesn't validate the checksum.
-	 * If not we validate the checksum here.
+	/* Check if the transceiver doesn't validate the checksum, or if the
+	 * check might have been disabled like during a scan. In these cases,
+	 * we validate the checksum here.
 	 */
-	if (local->hw.flags & IEEE802154_HW_RX_DROP_BAD_CKSUM) {
+	if (local->hw.flags & IEEE802154_HW_RX_DROP_BAD_CKSUM ||
+	    mac802154_is_scanning(local)) {
 		crc = crc_ccitt(0, skb->data, skb->len);
 		if (crc) {
 			rcu_read_unlock();
diff --git a/net/mac802154/scan.c b/net/mac802154/scan.c
new file mode 100644
index 000000000000..c74f6c3baa95
--- /dev/null
+++ b/net/mac802154/scan.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * IEEE 802.15.4 scanning management
+ *
+ * Copyright (C) Qorvo, 2021
+ * Authors:
+ *   - David Girault <david.girault@qorvo.com>
+ *   - Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+#include <linux/module.h>
+#include <linux/rtnetlink.h>
+#include <net/mac802154.h>
+
+#include "ieee802154_i.h"
+#include "driver-ops.h"
+#include "../ieee802154/nl802154.h"
+
+static bool mac802154_check_promiscuous(struct ieee802154_local *local)
+{
+	struct ieee802154_sub_if_data *sdata;
+	bool promiscuous_on = false;
+
+	/* Check if one subif is already in promiscuous mode. Since the list is
+	 * protected by its own mutex, take it here to ensure no modification
+	 * occurs during the check.
+	 */
+	rcu_read_lock();
+	list_for_each_entry(sdata, &local->interfaces, list) {
+		if (ieee802154_sdata_running(sdata) &&
+		    sdata->wpan_dev.promiscuous_mode) {
+			/* At least one is in promiscuous mode */
+			promiscuous_on = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return promiscuous_on;
+}
+
+static int mac802154_set_promiscuous_mode(struct ieee802154_local *local,
+					  bool state)
+{
+	bool promiscuous_on = mac802154_check_promiscuous(local);
+	int ret;
+
+	if ((state && promiscuous_on) || (!state && !promiscuous_on))
+		return 0;
+
+	ret = drv_set_promiscuous_mode(local, state);
+	if (ret)
+		pr_err("Failed to %s promiscuous mode for SW scanning",
+		       state ? "set" : "reset");
+
+	return ret;
+}
+
+static int mac802154_send_scan_done(struct ieee802154_local *local)
+{
+	struct cfg802154_scan_request *scan_req;
+	struct wpan_phy *wpan_phy;
+	struct wpan_dev *wpan_dev;
+
+	scan_req = rcu_dereference_protected(local->scan_req,
+					     lockdep_is_held(&local->scan_lock));
+	wpan_phy = scan_req->wpan_phy;
+	wpan_dev = scan_req->wpan_dev;
+
+	cfg802154_flush_known_coordinators(wpan_dev);
+
+	return nl802154_send_scan_done(wpan_phy, wpan_dev, scan_req);
+}
+
+static int mac802154_end_of_scan(struct ieee802154_local *local)
+{
+	drv_set_channel(local, local->phy->current_page,
+			local->phy->current_channel);
+	ieee802154_configure_durations(local->phy, local->phy->current_page,
+				       local->phy->current_channel);
+	clear_bit(IEEE802154_IS_SCANNING, &local->ongoing);
+	mac802154_set_promiscuous_mode(local, false);
+	ieee802154_mlme_op_post(local);
+	module_put(local->hw.parent->driver->owner);
+
+	return mac802154_send_scan_done(local);
+}
+
+int mac802154_abort_scan_locked(struct ieee802154_local *local)
+{
+	lockdep_assert_held(&local->scan_lock);
+
+	if (!mac802154_is_scanning(local))
+		return -ESRCH;
+
+	cancel_delayed_work(&local->scan_work);
+
+	return mac802154_end_of_scan(local);
+}
+
+static unsigned int mac802154_scan_get_channel_time(u8 duration_order,
+						    u8 symbol_duration)
+{
+	u64 base_super_frame_duration = (u64)symbol_duration *
+		IEEE802154_SUPERFRAME_PERIOD * IEEE802154_SLOT_PERIOD;
+
+	return usecs_to_jiffies(base_super_frame_duration *
+				(BIT(duration_order) + 1));
+}
+
+void mac802154_flush_queued_beacons(struct ieee802154_local *local)
+{
+	struct cfg802154_mac_pkt *beacon, *tmp;
+
+	lockdep_assert_held(&local->scan_lock);
+
+	list_for_each_entry_safe(beacon, tmp, &local->rx_beacon_list, node) {
+		list_del(&beacon->node);
+		kfree_skb(beacon->skb);
+		kfree(beacon);
+	}
+}
+
+void mac802154_scan_worker(struct work_struct *work)
+{
+	struct ieee802154_local *local =
+		container_of(work, struct ieee802154_local, scan_work.work);
+	struct cfg802154_scan_request *scan_req;
+	struct ieee802154_sub_if_data *sdata;
+	unsigned int scan_duration;
+	unsigned long chan;
+	int ret;
+
+	mutex_lock(&local->scan_lock);
+
+	if (!mac802154_is_scanning(local))
+		goto unlock_mutex;
+
+	scan_req = rcu_dereference_protected(local->scan_req,
+					     lockdep_is_held(&local->scan_lock));
+	sdata = IEEE802154_WPAN_DEV_TO_SUB_IF(scan_req->wpan_dev);
+
+	if (local->suspended || !ieee802154_sdata_running(sdata))
+		goto queue_work;
+
+	do {
+		chan = find_next_bit((const unsigned long *)&scan_req->channels,
+				     IEEE802154_MAX_CHANNEL + 1,
+				     local->scan_channel_idx + 1);
+
+		/* If there are no more channels left, complete the scan */
+		if (chan > IEEE802154_MAX_CHANNEL) {
+			mac802154_end_of_scan(local);
+			goto unlock_mutex;
+		}
+
+		/* Bypass the stack on purpose. As the channel change cannot be
+		 * made atomic with regard to the incoming beacon flow, we flush
+		 * the beacons list after changing the channel and before
+		 * releasing the scan lock, to avoid processing beacons which
+		 * have been received during this time frame.
+		 */
+		ret = drv_set_channel(local, scan_req->page, chan);
+		local->scan_channel_idx = chan;
+		ieee802154_configure_durations(local->phy, scan_req->page, chan);
+		mac802154_flush_queued_beacons(local);
+	} while (ret);
+
+queue_work:
+	scan_duration = mac802154_scan_get_channel_time(scan_req->duration,
+							local->phy->symbol_duration);
+	pr_debug("Scan channel %lu of page %u for %ums\n",
+		 chan, scan_req->page, jiffies_to_msecs(scan_duration));
+	queue_delayed_work(local->workqueue, &local->scan_work, scan_duration);
+
+unlock_mutex:
+	mutex_unlock(&local->scan_lock);
+}
+
+int mac802154_trigger_scan_locked(struct ieee802154_sub_if_data *sdata,
+				  struct cfg802154_scan_request *request)
+{
+	struct ieee802154_local *local = sdata->local;
+	int ret;
+
+	lockdep_assert_held(&local->scan_lock);
+
+	if (mac802154_is_scanning(local))
+		return -EBUSY;
+
+	/* TODO: support other scanning type */
+	if (request->type != NL802154_SCAN_PASSIVE)
+		return -EOPNOTSUPP;
+
+	/* Store scanning parameters */
+	rcu_assign_pointer(local->scan_req, request);
+
+	/* Software scanning requires to set promiscuous mode, so we need to
+	 * pause the Tx queue during the entire operation.
+	 */
+	ieee802154_mlme_op_pre(local);
+
+	ret = mac802154_set_promiscuous_mode(local, true);
+	if (ret)
+		goto cancel_mlme;
+
+	local->scan_channel_idx = -1;
+	set_bit(IEEE802154_IS_SCANNING, &local->ongoing);
+
+	/* Starting a background job, ensure the module cannot be removed */
+	if (!try_module_get(local->hw.parent->driver->owner)) {
+		ret = -ENODEV;
+		goto cancel_promiscuous_mode;
+	}
+
+	queue_delayed_work(local->workqueue, &local->scan_work, 0);
+
+	return 0;
+
+cancel_promiscuous_mode:
+	clear_bit(IEEE802154_IS_SCANNING, &local->ongoing);
+	mac802154_set_promiscuous_mode(local, false);
+cancel_mlme:
+	ieee802154_mlme_op_post(local);
+	return ret;
+}
+
+int mac802154_process_beacon(struct ieee802154_local *local,
+			     struct sk_buff *skb)
+{
+	struct ieee802154_beacon_hdr *bh = (void *)skb->data;
+	struct ieee802154_addr *src = &mac_cb(skb)->source;
+	struct cfg802154_scan_request *scan_req;
+	struct ieee802154_coord_desc *desc;
+
+	/* Check the validity of the frame length */
+	if (skb->len < sizeof(*bh))
+		return -EINVAL;
+
+	if (unlikely(src->mode == IEEE802154_ADDR_NONE))
+		return -EINVAL;
+
+	scan_req = rcu_dereference_protected(local->scan_req,
+					     &local->scan_lock);
+	if (unlikely(!scan_req))
+		return -EINVAL;
+
+	pr_debug("Beacon received on channel %d of page %d\n",
+		 local->scan_channel_idx, scan_req->page);
+
+	/* Parse beacon, create PAN information and forward to upper layers */
+	desc = cfg802154_alloc_coordinator(src);
+	if (!desc)
+		return -ENOMEM;
+
+	desc->page = scan_req->page;
+	desc->channel = local->scan_channel_idx;
+	desc->link_quality = mac_cb(skb)->lqi;
+	desc->superframe_spec = get_unaligned_le16(skb->data);
+	desc->gts_permit = bh->gts_permit;
+	cfg802154_record_coordinator(scan_req->wpan_phy, scan_req->wpan_dev, desc);
+
+	return 0;
+}
-- 
2.34.1

