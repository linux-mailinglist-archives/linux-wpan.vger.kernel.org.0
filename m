Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54346B4941
	for <lists+linux-wpan@lfdr.de>; Fri, 10 Mar 2023 16:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbjCJPKz (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 10 Mar 2023 10:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbjCJPKd (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 10 Mar 2023 10:10:33 -0500
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF6612EAF0
        for <linux-wpan@vger.kernel.org>; Fri, 10 Mar 2023 07:02:51 -0800 (PST)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 5C34ECACD4
        for <linux-wpan@vger.kernel.org>; Fri, 10 Mar 2023 14:55:16 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 735DBFF80A;
        Fri, 10 Mar 2023 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678460028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=GXVUou/K/W58WaSoPIfSsYP2dzMhQEsqgucosZ8y61Y=;
        b=mcdTGinpXUcvGNtbINi/MWXC5BT/WlLm+vtu9hclFY/PnWXjhEyRNUV7G6sprzPlJIJAWw
        7fOPdjdBtLuYlHVUp1/adLj3zmCCaGRAGyd5jveNAVLhmwhHo0vQbsNUOxvW9lTmJAt4mu
        63kAuXW8MqG+dYOi5aQ19QohRU0sYdN5pf2FWvsaWuIMhlDCdWGbtcIH3YmVszJQRCoQxv
        X5UDsU/EDX/XVX1DGV5B7kEESEg99grm47Wvvr35DUaAsQEULEJsV8lhN73BAjUvYIeDA1
        b+Ft6Ehi8bw+NaDynwHp3+SmqbhzZh4SwLsU2ffB5FOABjZyZnC6lcMt9BgJ9Q==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Guilhem Imberton <guilhem.imberton@qorvo.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH wpan-next v2 0/4] ieee802154: Active scan support
Date:   Fri, 10 Mar 2023 15:53:42 +0100
Message-Id: <20230310145346.1397068-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello,
Following the initial support for passive scan and beaconing, here is an
addition to support active scans.
Thanks,
Miquèl

Changes in v2:
* None, just resending the series after -rc1, now that all the late
  changes have been included in Linus' tree.

Miquel Raynal (4):
  ieee802154: Add support for user active scan requests
  mac802154: Handle active scanning
  ieee802154: Add support for allowing to answer BEACON_REQ
  mac802154: Handle received BEACON_REQ

 include/net/ieee802154_netdev.h | 20 +++++++++-
 net/ieee802154/header_ops.c     | 36 +++++++++++++++++
 net/ieee802154/nl802154.c       |  3 +-
 net/mac802154/ieee802154_i.h    | 21 ++++++++++
 net/mac802154/main.c            |  2 +
 net/mac802154/rx.c              | 70 ++++++++++++++++++++++++++++++++-
 net/mac802154/scan.c            | 68 +++++++++++++++++++++++++++++---
 7 files changed, 211 insertions(+), 9 deletions(-)

-- 
2.34.1

