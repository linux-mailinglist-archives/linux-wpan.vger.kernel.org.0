Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C2254FDC1
	for <lists+linux-wpan@lfdr.de>; Fri, 17 Jun 2022 21:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbiFQTdN (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 17 Jun 2022 15:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbiFQTdM (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 17 Jun 2022 15:33:12 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5816913D51;
        Fri, 17 Jun 2022 12:33:11 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E794CC0002;
        Fri, 17 Jun 2022 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1655494389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fJo1iNlrC6pXt/HGXA00sqO583p/JVnVsx1bL3t4GcE=;
        b=gm1JfRnJthxWQX2dsA4Uli3/48ReT8KWh6d2w9ZFckvWf/o/+XWWfsNcYmfNPAMyjH/i/J
        Is68XF6S1uRpEywtS56mjMVwWzC6HsoQWqnCVq03Gfjf6rfUCmUXm4luzIlfiwTodhzfFB
        f1Q5wuJW5z8EJZDdFP5RzzPqupCB5FyjZ54aI5radgr6InLJOg9XyUIQiYm9YDOwcEs3k0
        dlF9jgCf4Eqi8L5aexZC8U1jq1WImhi4pDqwRmO5sfmVmn+uiXK1rn5TH3cl/P3p1QomM0
        /PM7NEYb0TRIxAwu03etdqC1g3hq7YMvzI9ZalbI/z+NXrP9s7RUKVtSy0gMow==
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
Subject: [PATCH wpan-next v2 6/6] net: ieee802154: Trace the registration of new PANs
Date:   Fri, 17 Jun 2022 21:32:54 +0200
Message-Id: <20220617193254.1275912-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220617193254.1275912-1-miquel.raynal@bootlin.com>
References: <20220617193254.1275912-1-miquel.raynal@bootlin.com>
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

From: David Girault <david.girault@qorvo.com>

Add an internal trace when new PANs get discovered.

Signed-off-by: David Girault <david.girault@qorvo.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 net/ieee802154/pan.c   |  3 +++
 net/ieee802154/trace.h | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/net/ieee802154/pan.c b/net/ieee802154/pan.c
index b9f50f785960..0dd30c19c3a2 100644
--- a/net/ieee802154/pan.c
+++ b/net/ieee802154/pan.c
@@ -18,6 +18,7 @@
 
 #include "ieee802154.h"
 #include "core.h"
+#include "trace.h"
 
 static struct cfg802154_internal_pan *
 cfg802154_alloc_pan(struct ieee802154_pan_desc *desc)
@@ -205,6 +206,8 @@ static void cfg802154_pan_update(struct cfg802154_registered_device *rdev,
 	found = cfg802154_find_matching_pan(rdev, new);
 	if (found)
 		cfg802154_unlink_pan(rdev, found);
+	else
+		trace_802154_new_pan(&new->desc);
 
 	if (unlikely(cfg802154_need_to_expire_pans(rdev)))
 		cfg802154_expire_oldest_pan(rdev);
diff --git a/net/ieee802154/trace.h b/net/ieee802154/trace.h
index 19c2e5d60e76..fa989dac090d 100644
--- a/net/ieee802154/trace.h
+++ b/net/ieee802154/trace.h
@@ -295,6 +295,31 @@ TRACE_EVENT(802154_rdev_set_ackreq_default,
 		WPAN_DEV_PR_ARG, BOOL_TO_STR(__entry->ackreq))
 );
 
+DECLARE_EVENT_CLASS(802154_pan_evt,
+	TP_PROTO(struct ieee802154_pan_desc *desc),
+	TP_ARGS(desc),
+	TP_STRUCT__entry(
+		__field(u16, pan_id)
+		__field(__le64, coord_addr)
+		__field(u8, channel)
+		__field(u8, page)
+	),
+	TP_fast_assign(
+		__entry->page = desc->page;
+		__entry->channel = desc->channel;
+		memcpy(&__entry->pan_id, &desc->coord->pan_id, 2);
+		memcpy(&__entry->coord_addr, &desc->coord->extended_addr, 8);
+	),
+	TP_printk("panid: %u, coord_addr: 0x%llx, page: %u, channel: %u",
+		  __entry->pan_id, __le64_to_cpu(__entry->coord_addr),
+		  __entry->page, __entry->channel)
+);
+
+DEFINE_EVENT(802154_pan_evt, 802154_new_pan,
+	TP_PROTO(struct ieee802154_pan_desc *desc),
+	TP_ARGS(desc)
+);
+
 TRACE_EVENT(802154_rdev_return_int,
 	TP_PROTO(struct wpan_phy *wpan_phy, int ret),
 	TP_ARGS(wpan_phy, ret),
-- 
2.34.1

