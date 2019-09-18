Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442A5B6D18
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731269AbfIRT6i (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:38 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46931 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731548AbfIRT6i (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:38 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 1EFEDC14F9;
        Wed, 18 Sep 2019 21:58:36 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 0/6] Mixed bag of rpld patches
Date:   Wed, 18 Sep 2019 21:58:13 +0200
Message-Id: <20190918195819.7492-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello.

This series does really not have any theme, besides me starting
to look into rpld and playing around with it.

I had to fix meson for my lua detection and make sure the ifdef
for SCOPE_ID is honoured. After getting it all building locally
I added Travis support and submitted builds to Coverity.
Afterwards I did a quick run through the reports from address
sanitizer and coverity scan.

Not sure if you would prefer review for rpld as patches here on
the list or as pull requests on github. Up to you.

Stefan Schmidt (6):
  build: test various names for our lua dependency
  send: make sure we check on scope id usage
  ci: travis: initial setup for CI testing with Travis
  config : fix leaks on error paths
  socket: make sure we close our socket if setsockopt() fails
  send: ensure we free the buffer after sending the message

 .travis.yml | 38 ++++++++++++++++++++++++++++++++++++++
 config.c    | 24 ++++++++++++++++++++----
 meson.build | 11 ++++++++++-
 send.c      | 12 +++++++-----
 socket.c    |  7 +++++++
 5 files changed, 82 insertions(+), 10 deletions(-)
 create mode 100644 .travis.yml

regards
Stefan Schmidt
-- 
2.21.0

