Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A638551EB3
	for <lists+linux-wpan@lfdr.de>; Mon, 20 Jun 2022 16:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351182AbiFTOZD (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 20 Jun 2022 10:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351115AbiFTOYf (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 20 Jun 2022 10:24:35 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630762934C;
        Mon, 20 Jun 2022 06:40:25 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E54F40006;
        Mon, 20 Jun 2022 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1655732423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ji6tFCWqFFRFGPFEV2Sax2ZGcwlFfByrTdSZbYBCzqg=;
        b=ZqEs8Txd0rEGpNbDYSvwysdNlqrO3el5Z63uteOpsuuFcuebxbVTJccWJCeddCEgZ9OoyA
        SHH69RatTtfYNSxfgk4hjyz85LxOKBz0A0Kpv0nwPxKOJKQDewKjm4lBPAGden103/zzaP
        LBOWw9Ft3WeLjzgDdgt8hx574khZhdGBFBohjInL9Z6mDkOkKtaiiGdHtNwNl028FxPAtM
        hKyrwus7iHI+dBjWh0O0eYHgWZm3xNRKgNMxU1/v9SMqatGuWO400KarbVhJPFeAL65xwc
        Ul/WmdTyOWG9wl7rKORJEtnA/VwbpIWowcGUBhlGoOmPo7updXFgzLXV7brnqg==
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
Subject: [PATCH wpan-next v3 2/4] net: ieee802154: Add support for inter PAN management
Date:   Mon, 20 Jun 2022 15:40:16 +0200
Message-Id: <20220620134018.62414-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620134018.62414-1-miquel.raynal@bootlin.com>
References: <20220620134018.62414-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Let's introduce the basics for defining PANs:
- structures defining a PAN
- helpers for PAN registration
- helpers discarding old PANs

Co-developed-by: David Girault <david.girault@qorvo.com>
Signed-off-by: David Girault <david.girault@qorvo.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/net/cfg802154.h |  31 ++++++
 net/ieee802154/Makefile |   2 +-
 net/ieee802154/core.c   |   2 +
 net/ieee802154/core.h   |  26 +++++
 net/ieee802154/pan.c    | 231 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 net/ieee802154/pan.c

diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
index 04b996895fc1..9838eca3c41e 100644
--- a/include/net/cfg802154.h
+++ b/include/net/cfg802154.h
@@ -255,6 +255,24 @@ struct ieee802154_addr {
 	};
 };
 
+/**
+ * struct ieee802154_pan_desc - PAN descriptor information
+ * @coord: PAN ID and coordinator address
+ * @page: page this PAN is on
+ * @channel: channel this PAN is on
+ * @superframe_spec: SuperFrame specification as received
+ * @link_quality: link quality indicator at which the beacon was received
+ * @gts_permit: the PAN coordinator accepts GTS requests
+ */
+struct ieee802154_pan_desc {
+	struct ieee802154_addr *coord;
+	u8 page;
+	u8 channel;
+	u16 superframe_spec;
+	u8 link_quality;
+	bool gts_permit;
+};
+
 struct ieee802154_llsec_key_id {
 	u8 mode;
 	u8 id;
@@ -426,4 +444,17 @@ static inline const char *wpan_phy_name(struct wpan_phy *phy)
 
 void ieee802154_configure_durations(struct wpan_phy *phy);
 
+/**
+ * cfg802154_record_pan - Advertize a new PAN following a beacon's reception
+ * @wpan_phy: PHY receiving the beacon
+ * @pan: PAN descriptor
+ *
+ * Tells the internal pan management layer to either register this PAN if it is
+ * new or at least update its entry if already discovered.
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ */
+int cfg802154_record_pan(struct wpan_phy *wpan_phy,
+			 struct ieee802154_pan_desc *pan);
+
 #endif /* __NET_CFG802154_H */
diff --git a/net/ieee802154/Makefile b/net/ieee802154/Makefile
index f05b7bdae2aa..6b7c66de730d 100644
--- a/net/ieee802154/Makefile
+++ b/net/ieee802154/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_IEEE802154_SOCKET) += ieee802154_socket.o
 obj-y += 6lowpan/
 
 ieee802154-y := netlink.o nl-mac.o nl-phy.o nl_policy.o core.o \
-                header_ops.o sysfs.o nl802154.o trace.o
+                header_ops.o sysfs.o nl802154.o pan.o trace.o
 ieee802154_socket-y := socket.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
index 57546e07e06a..f642db35d62e 100644
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -115,6 +115,8 @@ wpan_phy_new(const struct cfg802154_ops *ops, size_t priv_size)
 		kfree(rdev);
 		return NULL;
 	}
+	spin_lock_init(&rdev->pan_lock);
+	INIT_LIST_HEAD(&rdev->pan_list);
 
 	/* atomic_inc_return makes it start at 1, make it start at 0 */
 	rdev->wpan_phy_idx--;
diff --git a/net/ieee802154/core.h b/net/ieee802154/core.h
index 1c19f575d574..cae071bede37 100644
--- a/net/ieee802154/core.h
+++ b/net/ieee802154/core.h
@@ -22,6 +22,14 @@ struct cfg802154_registered_device {
 	struct list_head wpan_dev_list;
 	int devlist_generation, wpan_dev_id;
 
+	/* PAN management */
+	spinlock_t pan_lock;
+	struct list_head pan_list;
+	unsigned int max_pan_entries;
+	unsigned int pan_expiration;
+	unsigned int pan_entries;
+	unsigned int pan_generation;
+
 	/* must be last because of the way we do wpan_phy_priv(),
 	 * and it should at least be aligned to NETDEV_ALIGN
 	 */
@@ -39,6 +47,17 @@ wpan_phy_to_rdev(struct wpan_phy *wpan_phy)
 extern struct list_head cfg802154_rdev_list;
 extern int cfg802154_rdev_list_generation;
 
+struct cfg802154_internal_pan {
+	struct list_head list;
+	unsigned long discovery_ts;
+	struct ieee802154_pan_desc desc;
+};
+
+/* Always update the list by dropping the expired PANs before iterating */
+#define ieee802154_for_each_pan(pan, rdev)				\
+	cfg802154_expire_pans(rdev);					\
+	list_for_each_entry((pan), &(rdev)->pan_list, list)
+
 int cfg802154_switch_netns(struct cfg802154_registered_device *rdev,
 			   struct net *net);
 /* free object */
@@ -47,4 +66,11 @@ struct cfg802154_registered_device *
 cfg802154_rdev_by_wpan_phy_idx(int wpan_phy_idx);
 struct wpan_phy *wpan_phy_idx_to_wpan_phy(int wpan_phy_idx);
 
+void cfg802154_set_max_pan_entries(struct cfg802154_registered_device *rdev,
+				   unsigned int max);
+void cfg802154_set_pans_expiration(struct cfg802154_registered_device *rdev,
+				   unsigned int exp_time_s);
+void cfg802154_expire_pans(struct cfg802154_registered_device *rdev);
+void cfg802154_flush_pans(struct cfg802154_registered_device *rdev);
+
 #endif /* __IEEE802154_CORE_H */
diff --git a/net/ieee802154/pan.c b/net/ieee802154/pan.c
new file mode 100644
index 000000000000..b9f50f785960
--- /dev/null
+++ b/net/ieee802154/pan.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IEEE 802.15.4 PAN management
+ *
+ * Copyright (C) Qorvo, 2021
+ * Authors:
+ *   - David Girault <david.girault@qorvo.com>
+ *   - Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+
+#include <net/cfg802154.h>
+#include <net/af_ieee802154.h>
+
+#include "ieee802154.h"
+#include "core.h"
+
+static struct cfg802154_internal_pan *
+cfg802154_alloc_pan(struct ieee802154_pan_desc *desc)
+{
+	struct cfg802154_internal_pan *new;
+	struct ieee802154_addr *coord;
+
+	new = kzalloc(sizeof(*new), GFP_ATOMIC);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	coord = kzalloc(sizeof(*coord), GFP_ATOMIC);
+	if (!coord) {
+		kfree(new);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new->discovery_ts = jiffies;
+	new->desc = *desc;
+
+	*coord = *desc->coord;
+	new->desc.coord = coord;
+
+	return new;
+}
+
+static void cfg802154_free_pan(struct cfg802154_internal_pan *pan)
+{
+	kfree(pan->desc.coord);
+	kfree(pan);
+}
+
+static void cfg802154_unlink_pan(struct cfg802154_registered_device *rdev,
+				 struct cfg802154_internal_pan *pan)
+{
+	lockdep_assert_held(&rdev->pan_lock);
+
+	list_del(&pan->list);
+	cfg802154_free_pan(pan);
+	rdev->pan_entries--;
+	rdev->pan_generation++;
+}
+
+static void cfg802154_link_pan(struct cfg802154_registered_device *rdev,
+			       struct cfg802154_internal_pan *pan)
+{
+	lockdep_assert_held(&rdev->pan_lock);
+
+	list_add_tail(&pan->list, &rdev->pan_list);
+	rdev->pan_entries++;
+	rdev->pan_generation++;
+}
+
+void cfg802154_set_max_pan_entries(struct cfg802154_registered_device *rdev,
+				   unsigned int max)
+{
+	lockdep_assert_held(&rdev->pan_lock);
+
+	rdev->max_pan_entries = max;
+}
+EXPORT_SYMBOL(cfg802154_set_max_pan_entries);
+
+static bool
+cfg802154_need_to_expire_pans(struct cfg802154_registered_device *rdev)
+{
+	if (!rdev->max_pan_entries)
+		return false;
+
+	if (rdev->pan_entries > rdev->max_pan_entries)
+		return true;
+
+	return false;
+}
+
+void cfg802154_set_pans_expiration(struct cfg802154_registered_device *rdev,
+				   unsigned int exp_time_s)
+{
+	lockdep_assert_held(&rdev->pan_lock);
+
+	rdev->pan_expiration = exp_time_s * HZ;
+}
+EXPORT_SYMBOL(cfg802154_set_pans_expiration);
+
+void cfg802154_expire_pans(struct cfg802154_registered_device *rdev)
+{
+	struct cfg802154_internal_pan *pan, *tmp;
+	unsigned long expiration_time;
+
+	lockdep_assert_held(&rdev->pan_lock);
+
+	if (!rdev->pan_expiration)
+		return;
+
+	expiration_time = jiffies - rdev->pan_expiration;
+	list_for_each_entry_safe(pan, tmp, &rdev->pan_list, list) {
+		if (!time_after(expiration_time, pan->discovery_ts))
+			continue;
+
+		cfg802154_unlink_pan(rdev, pan);
+	}
+}
+EXPORT_SYMBOL(cfg802154_expire_pans);
+
+static void cfg802154_expire_oldest_pan(struct cfg802154_registered_device *rdev)
+{
+	struct cfg802154_internal_pan *pan, *oldest;
+
+	lockdep_assert_held(&rdev->pan_lock);
+
+	if (WARN_ON(list_empty(&rdev->pan_list)))
+		return;
+
+	oldest = list_first_entry(&rdev->pan_list,
+				  struct cfg802154_internal_pan, list);
+
+	list_for_each_entry(pan, &rdev->pan_list, list) {
+		if (!time_before(oldest->discovery_ts, pan->discovery_ts))
+			oldest = pan;
+	}
+
+	cfg802154_unlink_pan(rdev, oldest);
+}
+
+void cfg802154_flush_pans(struct cfg802154_registered_device *rdev)
+{
+	struct cfg802154_internal_pan *pan, *tmp;
+
+	lockdep_assert_held(&rdev->pan_lock);
+
+	list_for_each_entry_safe(pan, tmp, &rdev->pan_list, list)
+		cfg802154_unlink_pan(rdev, pan);
+}
+EXPORT_SYMBOL(cfg802154_flush_pans);
+
+static bool cfg802154_same_pan(struct ieee802154_pan_desc *a,
+			       struct ieee802154_pan_desc *b)
+{
+	int ret;
+
+	if (a->page != b->page)
+		return false;
+
+	if (a->channel != b->channel)
+		return false;
+
+	ret = memcmp(&a->coord->pan_id, &b->coord->pan_id,
+		     sizeof(a->coord->pan_id));
+	if (ret)
+		return false;
+
+	if (a->coord->mode != b->coord->mode)
+		return false;
+
+	if (a->coord->mode == IEEE802154_ADDR_SHORT)
+		ret = memcmp(&a->coord->short_addr, &b->coord->short_addr,
+			     IEEE802154_SHORT_ADDR_LEN);
+	else
+		ret = memcmp(&a->coord->extended_addr, &b->coord->extended_addr,
+			     IEEE802154_EXTENDED_ADDR_LEN);
+
+	return true;
+}
+
+static struct cfg802154_internal_pan *
+cfg802154_find_matching_pan(struct cfg802154_registered_device *rdev,
+			    struct cfg802154_internal_pan *tmp)
+{
+	struct cfg802154_internal_pan *pan;
+
+	list_for_each_entry(pan, &rdev->pan_list, list) {
+		if (cfg802154_same_pan(&pan->desc, &tmp->desc))
+			return pan;
+	}
+
+	return NULL;
+}
+
+static void cfg802154_pan_update(struct cfg802154_registered_device *rdev,
+				 struct cfg802154_internal_pan *new)
+{
+	struct cfg802154_internal_pan *found;
+
+	spin_lock_bh(&rdev->pan_lock);
+
+	found = cfg802154_find_matching_pan(rdev, new);
+	if (found)
+		cfg802154_unlink_pan(rdev, found);
+
+	if (unlikely(cfg802154_need_to_expire_pans(rdev)))
+		cfg802154_expire_oldest_pan(rdev);
+
+	cfg802154_link_pan(rdev, new);
+
+	spin_unlock_bh(&rdev->pan_lock);
+}
+
+int cfg802154_record_pan(struct wpan_phy *wpan_phy,
+			 struct ieee802154_pan_desc *desc)
+{
+	struct cfg802154_registered_device *rdev = wpan_phy_to_rdev(wpan_phy);
+	struct cfg802154_internal_pan *new;
+
+	new = cfg802154_alloc_pan(desc);
+	if (IS_ERR(new))
+		return (PTR_ERR(new));
+
+	cfg802154_pan_update(rdev, new);
+
+	return 0;
+}
+EXPORT_SYMBOL(cfg802154_record_pan);
-- 
2.34.1

