Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B48933414
	for <lists+linux-wpan@lfdr.de>; Mon,  3 Jun 2019 17:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbfFCPvy (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 3 Jun 2019 11:51:54 -0400
Received: from foss.arm.com ([217.140.101.70]:53886 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729419AbfFCPvv (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Mon, 3 Jun 2019 11:51:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C60F1B4B;
        Mon,  3 Jun 2019 08:51:51 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C1783F246;
        Mon,  3 Jun 2019 08:51:50 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Subject: [RFC PATCH 34/57] drivers: ieee802154: Use class_find_device_by_name() helper
Date:   Mon,  3 Jun 2019 16:50:00 +0100
Message-Id: <1559577023-558-35-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Use the new class_find_device_by_name() helper.

Cc: Alexander Aring <alex.aring@gmail.com>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: linux-wpan@vger.kernel.org
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 net/ieee802154/core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
index 60b7ac5..26fe751 100644
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -23,11 +23,6 @@
 LIST_HEAD(cfg802154_rdev_list);
 int cfg802154_rdev_list_generation;
 
-static int wpan_phy_match(struct device *dev, const void *data)
-{
-	return !strcmp(dev_name(dev), (const char *)data);
-}
-
 struct wpan_phy *wpan_phy_find(const char *str)
 {
 	struct device *dev;
@@ -35,7 +30,7 @@ struct wpan_phy *wpan_phy_find(const char *str)
 	if (WARN_ON(!str))
 		return NULL;
 
-	dev = class_find_device(&wpan_phy_class, NULL, str, wpan_phy_match);
+	dev = class_find_device_by_name(&wpan_phy_class, NULL, str);
 	if (!dev)
 		return NULL;
 
-- 
2.7.4

