Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC627AC7FE
	for <lists+linux-wpan@lfdr.de>; Sun, 24 Sep 2023 14:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjIXMXG (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sun, 24 Sep 2023 08:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjIXMXF (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Sun, 24 Sep 2023 08:23:05 -0400
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D102101
        for <linux-wpan@vger.kernel.org>; Sun, 24 Sep 2023 05:22:55 -0700 (PDT)
Received: from localhost.localdomain.datenfreihafen.local (p200300e9d71918519b00d9454c2dda6a.dip0.t-ipconnect.de [IPv6:2003:e9:d719:1851:9b00:d945:4c2d:da6a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id F02F7C0E5B;
        Sun, 24 Sep 2023 14:22:48 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     linux-wpan@vger.kernel.org
Cc:     alex.aring@gmail.com, miquel.raynal@bootlin.com,
        david.girault@qorvo.com, Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH 3/9] wpan-ping: switch files to SPDX header for license and copyright
Date:   Sun, 24 Sep 2023 14:22:25 +0200
Message-ID: <20230924122231.716878-4-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924122231.716878-1-stefan@datenfreihafen.org>
References: <20230924122231.716878-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 wpan-ping/.gitignore       |  4 ++++
 wpan-ping/Makefile.am      |  4 ++++
 wpan-ping/README.wpan-ping |  4 ++++
 wpan-ping/wpan-ping.c      | 22 +++++-----------------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/wpan-ping/.gitignore b/wpan-ping/.gitignore
index 0e2e07a..4d78615 100644
--- a/wpan-ping/.gitignore
+++ b/wpan-ping/.gitignore
@@ -1,2 +1,6 @@
+# SPDX-FileCopyrightText: 2015 Stefan Schmidt <stefan@datenfreihafen.org>
+#
+# SPDX-License-Identifier: ISC
+
 .deps/
 wpan-ping
diff --git a/wpan-ping/Makefile.am b/wpan-ping/Makefile.am
index 6021c95..5003205 100644
--- a/wpan-ping/Makefile.am
+++ b/wpan-ping/Makefile.am
@@ -1,3 +1,7 @@
+# SPDX-FileCopyrightText: 2015 Stefan Schmidt <stefan@datenfreihafen.org>
+#
+# SPDX-License-Identifier: ISC
+
 bin_PROGRAMS = wpan-ping
 
 wpan_ping_SOURCES = wpan-ping.c
diff --git a/wpan-ping/README.wpan-ping b/wpan-ping/README.wpan-ping
index 4827e21..5d18661 100644
--- a/wpan-ping/README.wpan-ping
+++ b/wpan-ping/README.wpan-ping
@@ -1,3 +1,7 @@
+// SPDX-FileCopyrightText: 2015 Stefan Schmidt <stefan@datenfreihafen.org>
+//
+// SPDX-License-Identifier: ISC
+
 wpan-ping aims to offer ping/ping6 like functionality on a IEEE 802.15.4 level.
 
 No control message protocol is defined so we will simply use DGRAM's over a
diff --git a/wpan-ping/wpan-ping.c b/wpan-ping/wpan-ping.c
index 791346c..d82b1f0 100644
--- a/wpan-ping/wpan-ping.c
+++ b/wpan-ping/wpan-ping.c
@@ -1,20 +1,8 @@
-/*
- * Linux IEEE 802.15.4 ping tool
- *
- * Copyright (C) 2015 Stefan Schmidt <stefan@datenfreihafen.org>
- *
- * Permission to use, copy, modify, and/or distribute this software for any
- * purpose with or without fee is hereby granted, provided that the above
- * copyright notice and this permission notice appear in all copies.
- *
- * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
- * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
- * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
- * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
- * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
- * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- */
+// SPDX-FileCopyrightText: 2015 Stefan Schmidt <stefan@datenfreihafen.org>
+//
+// SPDX-License-Identifier: ISC
+
+/* Linux IEEE 802.15.4 ping tool */
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
-- 
2.41.0

