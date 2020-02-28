Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748A41739EB
	for <lists+linux-wpan@lfdr.de>; Fri, 28 Feb 2020 15:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgB1OeJ (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 28 Feb 2020 09:34:09 -0500
Received: from gateway36.websitewelcome.com ([192.185.200.11]:42926 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgB1OeJ (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>);
        Fri, 28 Feb 2020 09:34:09 -0500
X-Greylist: delayed 1501 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Feb 2020 09:34:08 EST
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 6E5484067AAA2
        for <linux-wpan@vger.kernel.org>; Fri, 28 Feb 2020 07:00:03 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 7fwxjzoAPXVkQ7fwxjKhQZ; Fri, 28 Feb 2020 07:45:07 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dp7OH8A4KnczyYJovH59Zksat//ZZyGW27TssWDaCwU=; b=ezaOkChQzVs7vsAT/2k7fCErdV
        HTx/3dG3u0qkOqddA1n/Z9+SpTSmpto04B7IvkemtDFzEOZICZXOiyDPL0WE1QCn+XdqO0CNOMR6m
        oz+5p6Db+i4pKSIb8tCzT3UAvjW10RupagVTAUvLBsmJe/jweCMYXVo8I72avmwnMmV+XxPis7fS3
        88lEXQ1hL1eoBCN+llyqJLcTSc7anMZHwIncI7ZnhnDOtn9DNIGypQgHn1TrGx49vwIh+6lJO5Pu6
        k5eVzONUrWFuETjhEl4NSmm1QSv7W6e3T4P24X0SNjloblgMikDkxsftpSVI3r88q1Z1XGY8uFx74
        6bI5h8Xg==;
Received: from [201.162.240.44] (port=21260 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j7fwv-001U2f-DG; Fri, 28 Feb 2020 07:45:05 -0600
Date:   Fri, 28 Feb 2020 07:47:58 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Jukka Rissanen <jukka.rissanen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] 6lowpan: Replace zero-length array with flexible-array
 member
Message-ID: <20200228134758.GA29760@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.240.44
X-Source-L: No
X-Exim-ID: 1j7fwv-001U2f-DG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.240.44]:21260
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 59
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 include/net/6lowpan.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/6lowpan.h b/include/net/6lowpan.h
index a71378007e61..c80539be1542 100644
--- a/include/net/6lowpan.h
+++ b/include/net/6lowpan.h
@@ -138,7 +138,7 @@ struct lowpan_dev {
 	struct lowpan_iphc_ctx_table ctx;
 
 	/* must be last */
-	u8 priv[0] __aligned(sizeof(void *));
+	u8 priv[] __aligned(sizeof(void *));
 };
 
 struct lowpan_802154_neigh {
-- 
2.25.0

