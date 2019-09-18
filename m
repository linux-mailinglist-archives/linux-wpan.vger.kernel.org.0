Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93481B6D19
	for <lists+linux-wpan@lfdr.de>; Wed, 18 Sep 2019 21:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731746AbfIRT6n (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 18 Sep 2019 15:58:43 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:46933 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731476AbfIRT6n (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 18 Sep 2019 15:58:43 -0400
Received: from localhost.localdomain (p200300E9D7197EFAD2D4565022F53F4F.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7efa:d2d4:5650:22f5:3f4f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id B3B8FC1515;
        Wed, 18 Sep 2019 21:58:40 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     alex.aring@gmail.com
Cc:     linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH rpld 1/6] build: test various names for our lua dependency
Date:   Wed, 18 Sep 2019 21:58:14 +0200
Message-Id: <20190918195819.7492-2-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918195819.7492-1-stefan@datenfreihafen.org>
References: <20190918195819.7492-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Distros name this differently in their pkgconfig files.
This is a first attempt to cope with all of them.

If we depend on a recent meson version at some later
point we could handle this in a cleaner way by using
the break keyword coming in 0.49
---
 meson.build | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8f2ccfe..70a2bc3 100644
--- a/meson.build
+++ b/meson.build
@@ -10,7 +10,16 @@ else
 	error('Couldn\'t find libev header / library')
 endif
 
-luadep = dependency('lua5.3')
+foreach name : ['lua', 'lua5.3', 'lua-5.3', 'lua53']
+	dep = dependency(name, version: '>=5.3', required: false)
+	if dep.found()
+		luadep = dep
+	endif
+endforeach
+if not luadep.found()
+	error('Couldn\'t find Lua.')
+endif
+
 mnldep = dependency('libmnl')
 
 srcs = files(
-- 
2.21.0

