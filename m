Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DDF5635C1
	for <lists+linux-wpan@lfdr.de>; Fri,  1 Jul 2022 16:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbiGAOgQ (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 1 Jul 2022 10:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiGAOfl (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 1 Jul 2022 10:35:41 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DD96B805;
        Fri,  1 Jul 2022 07:31:15 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8D8CEFF80F;
        Fri,  1 Jul 2022 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656685874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ocxbWdcl4mMHYc5HbDE1q7HijgptxH2Rs9Qwuibjyhw=;
        b=LyHNtG6ZHrhA8PXgjwRqnyS57ab7XUGHcr6GUi4xHG8fiyxNLJAgYHH2DBRIipE0L9vurs
        3r43OP4cTbgclWrxrF7+BInF0cj7twwWXmTJkPO0cq14N22ZzxSG+u0Z5jcY7yPAiqmb2O
        lyHNfRE/pBsB6MX0yAB/nw7rIykonZ7fUml9pGYebFmIEE+S2xhLIObUmZuqHoHYyxlV9y
        suaJtc2qgOPwqd4lwfZCZUDLw6A0qXPQbNJZwMoixckmRerhokgzPnbqJ6dQwmpfhZeuLI
        vIYng1SBhQydlC+GTDfwwZ/qb5NPKeSezU5ZWn2EyhA5QdeIOAqggUoOJzjDDw==
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
Subject: [PATCH wpan-next 09/20] net: mac802154: Introduce a global device lock
Date:   Fri,  1 Jul 2022 16:30:41 +0200
Message-Id: <20220701143052.1267509-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701143052.1267509-1-miquel.raynal@bootlin.com>
References: <20220701143052.1267509-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The purpose of this device lock is to prevent the removal of the device
while an asynchronous MLME operation happens. The RTNL works well for
that but in a later series having the RTNL taken here will be
problematic and will cause lockdep to warn us about a circular
dependency. We don't really need the RTNL here, just a serialization
over this operation.

Replace the RTNL calls with this new lock.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 net/mac802154/ieee802154_i.h |  2 ++
 net/mac802154/iface.c        |  4 ++++
 net/mac802154/main.c         |  1 +
 net/mac802154/tx.c           | 12 ++++++------
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/net/mac802154/ieee802154_i.h b/net/mac802154/ieee802154_i.h
index 010365a6364e..b8775bcc9003 100644
--- a/net/mac802154/ieee802154_i.h
+++ b/net/mac802154/ieee802154_i.h
@@ -29,7 +29,9 @@ struct ieee802154_local {
 	/* ieee802154 phy */
 	struct wpan_phy *phy;
 
+	/* Open/close counter and lock */
 	int open_count;
+	struct mutex device_lock;
 
 	/* As in mac80211 slaves list is modified:
 	 * 1) under the RTNL
diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index 7ac0c5685d3f..7715e17d9ba1 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -315,11 +315,15 @@ static int mac802154_slave_close(struct net_device *dev)
 
 	ASSERT_RTNL();
 
+	mutex_lock(&local->device_lock);
+
 	netif_stop_queue(dev);
 	local->open_count--;
 
 	clear_bit(SDATA_STATE_RUNNING, &sdata->state);
 
+	mutex_unlock(&local->device_lock);
+
 	if (!local->open_count)
 		ieee802154_stop_device(local);
 
diff --git a/net/mac802154/main.c b/net/mac802154/main.c
index a2da9d4c5273..e5fb7ed73663 100644
--- a/net/mac802154/main.c
+++ b/net/mac802154/main.c
@@ -90,6 +90,7 @@ ieee802154_alloc_hw(size_t priv_data_len, const struct ieee802154_ops *ops)
 
 	INIT_LIST_HEAD(&local->interfaces);
 	mutex_init(&local->iflist_mtx);
+	mutex_init(&local->device_lock);
 
 	tasklet_setup(&local->tasklet, ieee802154_tasklet_handler);
 
diff --git a/net/mac802154/tx.c b/net/mac802154/tx.c
index 9d8d43cf1e64..fb555797f326 100644
--- a/net/mac802154/tx.c
+++ b/net/mac802154/tx.c
@@ -143,14 +143,14 @@ int ieee802154_mlme_tx(struct ieee802154_local *local,
 {
 	int ret;
 
-	/* Avoid possible calls to ->ndo_stop() when we asynchronously perform
-	 * MLME transmissions.
+	/* Serialize possible calls to ->ndo_stop() when we asynchronously
+	 * perform MLME transmissions.
 	 */
-	rtnl_lock();
+	mutex_lock(&local->device_lock);
 
 	/* Ensure the device was not stopped, otherwise error out */
 	if (!local->open_count) {
-		rtnl_unlock();
+		mutex_unlock(&local->device_lock);
 		return -ENETDOWN;
 	}
 
@@ -158,14 +158,14 @@ int ieee802154_mlme_tx(struct ieee802154_local *local,
 	 * net interface expects this cannot happen.
 	 */
 	if (WARN_ON_ONCE(!netif_running(sdata->dev))) {
-		rtnl_unlock();
+		mutex_unlock(&local->device_lock);
 		return -ENETDOWN;
 	}
 
 	ieee802154_tx(local, skb);
 	ret = ieee802154_sync_queue(local);
 
-	rtnl_unlock();
+	mutex_unlock(&local->device_lock);
 
 	return ret;
 }
-- 
2.34.1

