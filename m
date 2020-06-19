Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66F4201C37
	for <lists+linux-wpan@lfdr.de>; Fri, 19 Jun 2020 22:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391614AbgFSUPS (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 19 Jun 2020 16:15:18 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:39398 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391592AbgFSUPR (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 19 Jun 2020 16:15:17 -0400
Received: from PC192.168.2.50 (p200300e9d71c614fed812a542701ea41.dip0.t-ipconnect.de [IPv6:2003:e9:d71c:614f:ed81:2a54:2701:ea41])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 58124C04C5;
        Fri, 19 Jun 2020 22:15:15 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     davem@davemloft.net
Cc:     linux-wpan@vger.kernel.org, alex.aring@gmail.com,
        netdev@vger.kernel.org
Subject: pull-request: ieee802154 for net 2020-06-19
Date:   Fri, 19 Jun 2020 22:14:59 +0200
Message-Id: <20200619201459.894622-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello Dave.

An update from ieee802154 for your *net* tree.

Just two small maintenance fixes to update references to the new project
homepage.

regards
Stefan Schmidt


The following changes since commit 0ad6f6e767ec2f613418cbc7ebe5ec4c35af540c:

  net: increment xmit_recursion level in dev_direct_xmit() (2020-06-18 20:47:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan.git tags/ieee802154-for-davem-2020-06-19

for you to fetch changes up to e795a61a85e65b4f12c2ed3529911ac0f013fa40:

  MAINTAINERS: update ieee802154 project website URL (2020-06-19 22:08:11 +0200)

----------------------------------------------------------------
Stefan Schmidt (2):
      docs: net: ieee802154: change link to new project URL
      MAINTAINERS: update ieee802154 project website URL

 Documentation/networking/ieee802154.rst | 4 ++--
 MAINTAINERS                             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
