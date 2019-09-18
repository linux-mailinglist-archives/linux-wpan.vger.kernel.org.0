Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF142B6D1B
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfIRT65 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:57 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46941 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387870AbfIRT65 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:57 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 29280C14F9;
        Wed, 18 Sep 2019 21:58:54 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 3/6] ci: travis: initial setup for CI testing with Travis
Date:   Wed, 18 Sep 2019 21:58:16 +0200
Message-Id: <20190918195819.7492-4-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918195819.7492-1-stefan@datenfreihafen.org>
References: <20190918195819.7492-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Basic setup of building with gcc and clang, as well as
using Coverity scan service.
---
 .travis.yml | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 .travis.yml

diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 0000000..0bbefea
--- /dev/null
+++ b/.travis.yml
@@ -0,0 +1,38 @@
+env:
+  global:
+   # The next declaration is the encrypted COVERITY_SCAN_TOKEN, created
+   #   via the "travis encrypt" command using the project repo's public key
+    - secure: "H2LC/vR1TNyECl8K1MJnvBay7je0NO4hzVdxk1TanJM4Cjo66Bdf+iMsIWW9KifTWlF+I8ATC8yrweGm02b9FqKSl7gBEPpgOev3q/IXlcU5HHqP+TDrGnn4aLFVYDiTjNYI39TpouUEQBN5cbDljN0GlYFyrXQkP28rvnhGyvvF65t0yQWRXrE1vlAeXq/1/IK/DwMams5YmGAVanH9TtOfePomAGtFtpiryHSgrZugyC03W6eiIzmJ2jzIJ6Wkykv1ASy1v2MEC5xl0YYOpZM1EF8hfScqKbA5Vn1JwM6yrGmDbjwFZCEYBj8N8EPAaZFXj6VNtJoaRB9jnO9Im1GqnD6TuYVc4caXYSrgxT7nMZhFe/Jt9y2mVsy5/nngJjZ5me3hLJlWuRgWDfo9hi02U6K8GkoHNumejGzOikErqGPVp4+aEFy3qr1sElWXgVYQP0/nKHGtciLnE3g2Tbt3mNEAakv+38Rh2zu2icn6vAXD5o4tlr7B86YUaSZlWVNr3LmW/GCZazdcR+I8zAwwo7Tj66pDvdejAe4s8yotOJw1/TMnBvJTO2w+ngggSoo/Ftp6AfdvNWqNBLV8h62uHjL5rXQh/Nx2lE3pA4PyN4mJegFPvqUSAdQurk+JZbfeP9HJ1R3CvP34LNsqoRWziKvv895xxjD3vjlJ7s8="
+
+notifications:
+  irc: "chat.freenode.net#linux-wpan"
+
+language: c
+
+dist: bionic
+sudo: true
+
+compiler:
+  - clang
+  - gcc
+
+addons:
+  apt:
+    packages:
+    - libev-dev
+    - liblua5.3-dev
+    - libmnl-dev
+    - meson
+    - ninja-build
+  coverity_scan:
+    project:
+      name: "linux-wpan/rpld"
+      description: "Build submitted via Travis CI"
+    notification_email: stefan@datenfreihafen.org
+    build_command_prepend:   "rm -rf build && mkdir build && meson build"
+    build_command:   "ninja -C build"
+    branch_pattern: coverity_scan
+
+script:
+  - rm -rf build && mkdir build && meson build .
+  - ninja -C build
-- 
2.21.0

