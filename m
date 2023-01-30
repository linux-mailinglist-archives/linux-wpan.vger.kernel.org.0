Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDAE68158E
	for <lists+linux-wpan@lfdr.de>; Mon, 30 Jan 2023 16:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237687AbjA3Pus (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 30 Jan 2023 10:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237920AbjA3Puf (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 30 Jan 2023 10:50:35 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFABC42DFF
        for <linux-wpan@vger.kernel.org>; Mon, 30 Jan 2023 07:50:25 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DE282E000E;
        Mon, 30 Jan 2023 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675093824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/36nz8IPLxl0kqCV42nHpJ5Ij0f+n6QpsNuDaouU0nQ=;
        b=VwOLvi9BV2AiW4c656hooUx5vjBX45gYj42B1JssP5FAalHcLSMOVgOlX56mWcGX2Y4YvV
        xIyTA+4HpNhtMWpUh4e3e9jayq3W9palZ5K7pHEEHCi6WZd1QQ3FcRoHGT3beVq9KdWpJA
        Nver2KaPbjrk3/YO4y1oFfYkLMUr8a7xbW5ZeNqaS+gRvaz4l91VurMWmTgxujLjMGWfTo
        UByDaShjjh0+W3XZUbyC/GjD5lWHPb9evRB2wWSVxQ+bYwZaT85ZTGR/sWv0yqJ3K0tdC8
        e9i8InSI9b9i6ixNjDj9iFd1/JnROxZehwpU63lXpcyKDleTRMjAMGLCrGtypg==
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
Subject: [wpan-tools 0/2] iwpan: Beaconing support
Date:   Mon, 30 Jan 2023 16:50:20 +0100
Message-Id: <20230130155022.115117-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Following the userspace series to support scan:

    [PATCH wpan-tools v2 0/8] iwpan: Scan support
    https://lore.kernel.org/linux-wpan/20230106111831.692202-1-miquel.raynal@bootlin.com/T/#t

And thanks to the recent merge of the beaconing part in the Linux kernel:

    [PATCH wpan-next v2 0/2] ieee802154: Beaconing support
    https://lore.kernel.org/linux-wpan/d17b1f40-b878-28fa-f93d-37f7e5ba856c@datenfreihafen.org/T/#t

Here is now some example code showing how to interact through the
netlink interface with the kernel in order to manage beaconing.

Thanks,
Miquèl

David Girault (1):
  iwpan: Add beaconing support

Miquel Raynal (1):
  iwpan: Synchronize nl802154.h with the latest beaconing changes

 src/nl802154.h |  3 +++
 src/scan.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.34.1

