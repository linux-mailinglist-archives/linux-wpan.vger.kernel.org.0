Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDA353BBC6
	for <lists+linux-wpan@lfdr.de>; Thu,  2 Jun 2022 17:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbiFBPnT (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 2 Jun 2022 11:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236543AbiFBPnP (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 2 Jun 2022 11:43:15 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A4F82A6880;
        Thu,  2 Jun 2022 08:43:12 -0700 (PDT)
Received: from smtpclient.apple (p4ff9fc30.dip0.t-ipconnect.de [79.249.252.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 969F7CED19;
        Thu,  2 Jun 2022 17:43:10 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH] MAINTAINERS: Remove Jukka Rissanen as 6lowpan maintainer
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220527075625.9693-1-jukka.rissanen@linux.intel.com>
Date:   Thu, 2 Jun 2022 17:43:10 +0200
Cc:     Alexander Aring <alex.aring@gmail.com>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        pmenzel@molgen.mpg.de
Content-Transfer-Encoding: 7bit
Message-Id: <102083F2-787F-4682-83D7-E14F2BD325E6@holtmann.org>
References: <20220526162806.16618-1-jukka.rissanen@linux.intel.com>
 <20220527075625.9693-1-jukka.rissanen@linux.intel.com>
To:     Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi Jukka,

> I no longer work on this so better update the file.
> 
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
> MAINTAINERS | 1 -
> 1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6618e9b91b6c..2e03de59d700 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -171,7 +171,6 @@ F:	drivers/scsi/53c700*
> 
> 6LOWPAN GENERIC (BTLE/IEEE 802.15.4)
> M:	Alexander Aring <alex.aring@gmail.com>
> -M:	Jukka Rissanen <jukka.rissanen@linux.intel.com>
> L:	linux-bluetooth@vger.kernel.org
> L:	linux-wpan@vger.kernel.org
> S:	Maintained
> -- 
> 2.36.1
> 

Acked-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel

