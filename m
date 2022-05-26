Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF953567C
	for <lists+linux-wpan@lfdr.de>; Fri, 27 May 2022 01:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349523AbiEZXxV (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 26 May 2022 19:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349520AbiEZXxS (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 26 May 2022 19:53:18 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131F86F494;
        Thu, 26 May 2022 16:53:16 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5aedc6.dynamic.kabel-deutschland.de [95.90.237.198])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id EE28A61EA1923;
        Fri, 27 May 2022 01:53:13 +0200 (CEST)
Message-ID: <2f18718f-d13a-f905-528a-cc4f97e6b2e2@molgen.mpg.de>
Date:   Fri, 27 May 2022 01:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] MAINTAINERS: Remove me as maintainer of 6lowpan
Content-Language: en-US
To:     Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc:     alex.aring@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-wpan@vger.kernel.org
References: <20220526162806.16618-1-jukka.rissanen@linux.intel.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220526162806.16618-1-jukka.rissanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Dear Jukka,


Am 26.05.22 um 18:28 schrieb Jukka Rissanen:
> I no longer work on this so better update the file.

Thank you for the update. “me” in the summary is not helpful, when 
looking at `git log --oneline`. Maybe use `Remove Jukka Rissanen as 
6lowpan maintainer`.


Kind regards,

Paul


> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6618e9b91b6c..2e03de59d700 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -171,7 +171,6 @@ F:	drivers/scsi/53c700*
>   
>   6LOWPAN GENERIC (BTLE/IEEE 802.15.4)
>   M:	Alexander Aring <alex.aring@gmail.com>
> -M:	Jukka Rissanen <jukka.rissanen@linux.intel.com>
>   L:	linux-bluetooth@vger.kernel.org
>   L:	linux-wpan@vger.kernel.org
>   S:	Maintained
