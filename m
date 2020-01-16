Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C495F13EC14
	for <lists+linux-wpan@lfdr.de>; Thu, 16 Jan 2020 18:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405940AbgAPRye (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 16 Jan 2020 12:54:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:35814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405928AbgAPRom (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Thu, 16 Jan 2020 12:44:42 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FB9624770;
        Thu, 16 Jan 2020 17:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196681;
        bh=JBhNtFJ94R8C17PryEob3YDZloOshI0//2W6ZOtVMxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xzh9U9velmeSev1R/cwzUo/oSz9AMbFf5zDjP8uupxE94wVRGSd1XvZ5CFfh8sYWz
         MzhiaadVZYW43mV8OCC4xAUDNXXgTZ2e3pnOZwcfYgCuXh+7UYR4h8JG4uRzxaC46z
         cXvxg+C55h8IY5dxGpS5ryON65bvgcX6AKxSEpY4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jukka Rissanen <jukka.rissanen@linux.intel.com>,
        Alexander Aring <aring@mojatatu.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 079/174] 6lowpan: Off by one handling ->nexthdr
Date:   Thu, 16 Jan 2020 12:41:16 -0500
Message-Id: <20200116174251.24326-79-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit f57c4bbf34439531adccd7d3a4ecc14f409c1399 ]

NEXTHDR_MAX is 255.  What happens here is that we take a u8 value
"hdr->nexthdr" from the network and then look it up in
lowpan_nexthdr_nhcs[].  The problem is that if hdr->nexthdr is 0xff then
we read one element beyond the end of the array so the array needs to
be one element larger.

Fixes: 92aa7c65d295 ("6lowpan: add generic nhc layer interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Acked-by: Alexander Aring <aring@mojatatu.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/6lowpan/nhc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/6lowpan/nhc.c b/net/6lowpan/nhc.c
index 7008d53e455c..e61679bf0908 100644
--- a/net/6lowpan/nhc.c
+++ b/net/6lowpan/nhc.c
@@ -18,7 +18,7 @@
 #include "nhc.h"
 
 static struct rb_root rb_root = RB_ROOT;
-static struct lowpan_nhc *lowpan_nexthdr_nhcs[NEXTHDR_MAX];
+static struct lowpan_nhc *lowpan_nexthdr_nhcs[NEXTHDR_MAX + 1];
 static DEFINE_SPINLOCK(lowpan_nhc_lock);
 
 static int lowpan_nhc_insert(struct lowpan_nhc *nhc)
-- 
2.20.1

