Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9176460DCA0
	for <lists+linux-wpan@lfdr.de>; Wed, 26 Oct 2022 09:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbiJZH4z (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 26 Oct 2022 03:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbiJZH4w (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 26 Oct 2022 03:56:52 -0400
Received: from proxima.lasnet.de (proxima.lasnet.de [IPv6:2a01:4f8:121:31eb:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E7CA02C5;
        Wed, 26 Oct 2022 00:56:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [92.79.119.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 9C833C040C;
        Wed, 26 Oct 2022 09:56:42 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     linux-wpan@vger.kernel.org, alex.aring@gmail.com,
        netdev@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: pull-request v2: ieee802154-next 2022-10-26
Date:   Wed, 26 Oct 2022 09:56:38 +0200
Message-Id: <20221026075638.578840-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello Dave, Jakub.

An update from ieee802154 for *net-next*

One of the biggest cycles for ieee802154 in a long time. We are landing the
first pieces of a big enhancements in managing PAN's. We might have another pull
request ready for this cycle later on, but I want to get this one out first.

Miquel Raynal added support for sending frames synchronously as a dependency
to handle MLME commands. Also introducing more filtering levels to match with
the needs of a device when scanning or operating as a pan coordinator.
To support development and testing the hwsim driver for ieee802154 was also
enhanced for the new filtering levels and to update the PIB attributes.

Alexander Aring fixed quite a few bugs spotted during reviewing changes. He
also added support for TRAC in the atusb driver to have better failure
handling if the firmware provides the needed information.

Jilin Yuan fixed a comment with a repeated word in it.

regards
Stefan Schmidt

The following changes since commit 6cbd05b2d07a651e00c76d287a5f44994cbafe60:

  Merge tag 'ieee802154-for-net-next-2022-06-09' of git://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next (2022-06-09 23:21:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.git tags/ieee802154-for-net-next-2022-10-26

for you to fetch changes up to 982e2b7329fe5c5387453524f40eec706d2c60bf:

  net: mac802154: Fixup function parameter name in docs (2022-10-26 09:40:34 +0200)

----------------------------------------------------------------
Alexander Aring (5):
      mac802154: util: fix release queue handling
      mac802154: fix atomic_dec_and_test checks
      mac802154: move receive parameters above start
      mac802154: set filter at drv_start()
      ieee802154: atusb: add support for trac feature

Jilin Yuan (1):
      net/ieee802154: fix repeated words in comments

Miquel Raynal (21):
      net: mac802154: Rename the synchronous xmit worker
      net: mac802154: Rename the main tx_work struct
      net: mac802154: Enhance the error path in the main tx helper
      net: mac802154: Follow the count of ongoing transmissions
      net: mac802154: Bring the ability to hold the transmit queue
      net: mac802154: Create a hot tx path
      net: mac802154: Introduce a helper to disable the queue
      net: mac802154: Introduce a tx queue flushing mechanism
      net: mac802154: Introduce a synchronous API for MLME commands
      net: mac802154: Add a warning in the hot path
      net: mac802154: Add a warning in the slow path
      net: mac802154: Fix a Tx warning check
      mac802154: Introduce filtering levels
      ieee802154: hwsim: Record the address filter values
      ieee802154: hwsim: Implement address filtering
      mac802154: Drop IEEE802154_HW_RX_DROP_BAD_CKSUM
      mac802154: Avoid delivering frames received in a non satisfying filtering mode
      net: mac802154: Avoid displaying misleading debug information
      ieee802154: hwsim: Introduce a helper to update all the PIB attributes
      ieee802154: hwsim: Save the current filtering level and use it
      mac802154: Ensure proper scan-level filtering

Stefan Schmidt (1):
      net: mac802154: Fixup function parameter name in docs

Yang Yingliang (1):
      net: ieee802154: mcr20a: Switch to use dev_err_probe() helper

 drivers/net/ieee802154/atusb.c           |  33 +++-
 drivers/net/ieee802154/ca8210.c          |   2 +-
 drivers/net/ieee802154/mac802154_hwsim.c | 179 +++++++++++++++++++++-
 drivers/net/ieee802154/mcr20a.c          |   9 +-
 include/linux/ieee802154.h               |  24 +++
 include/net/cfg802154.h                  |  20 ++-
 include/net/ieee802154_netdev.h          |   8 +
 include/net/mac802154.h                  |  31 ----
 net/ieee802154/core.c                    |   3 +
 net/mac802154/cfg.c                      |   6 +-
 net/mac802154/driver-ops.h               | 253 ++++++++++++++++++++-----------
 net/mac802154/ieee802154_i.h             |  56 ++++++-
 net/mac802154/iface.c                    |  44 ++----
 net/mac802154/main.c                     |   2 +-
 net/mac802154/rx.c                       |  29 +++-
 net/mac802154/tx.c                       | 132 ++++++++++++++--
 net/mac802154/util.c                     |  71 ++++++++-
 17 files changed, 696 insertions(+), 206 deletions(-)
