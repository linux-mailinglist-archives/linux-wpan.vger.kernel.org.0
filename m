Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D11733C19
	for <lists+linux-wpan@lfdr.de>; Sat, 17 Jun 2023 00:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjFPWJb (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 16 Jun 2023 18:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjFPWJb (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 16 Jun 2023 18:09:31 -0400
X-Greylist: delayed 1197 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Jun 2023 15:09:29 PDT
Received: from proxima.lasnet.de (proxima.lasnet.de [IPv6:2a01:4f8:121:31eb:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDE7B5
        for <linux-wpan@vger.kernel.org>; Fri, 16 Jun 2023 15:09:29 -0700 (PDT)
Received: from [IPV6:2003:e9:d710:7c92:fc77:12a4:52e5:4e01] (p200300e9d7107c92fc7712a452e54e01.dip0.t-ipconnect.de [IPv6:2003:e9:d710:7c92:fc77:12a4:52e5:4e01])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id C1744C0144;
        Fri, 16 Jun 2023 23:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
        s=2021; t=1686951170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sdxCqBl7J5TyGt6xLYgsGc0Y2cygd5RnxZTzgOT8fsk=;
        b=l73Fxqs3erVsnGjPoX7NAxYqG0JEv76CcAcfhhW2xcAembKT2Li4D7bADb3FBjwqQ9MA6U
        ssT03A0wNVHJf/ONu4jEGiuHR1y1F/bbHFYw/+JEC0idlX2rymcD16ccDqEKGxhRdrVzvz
        xHrISZCbQypEzsQ96LOHOdqkykITe6xZ5xHCzMtIEojAtXXEVA7cpYpMSsr6pRIT2gvUqT
        e1bgKpJSRfkJdX1ESnnOOtBoSqnbWJRtlr2zF8yM1BBme2gD7ITUoZjlIIa8YD5Fi1jfjn
        IiOT/uk9yb3MszqQHD+aeAMgns1i3yygAeGx/FtB0XDeO1edELEAD6drSjqG1g==
Message-ID: <6ec8cf42-aff0-a832-87f2-1526ff00c42d@datenfreihafen.org>
Date:   Fri, 16 Jun 2023 23:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ieee802154: Replace strlcpy with strscpy
To:     Azeem Shaikh <azeemshaikh38@gmail.com>,
        Alexander Aring <alex.aring@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-hardening@vger.kernel.org, linux-wpan@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
References: <20230613003326.3538391-1-azeemshaikh38@gmail.com>
Content-Language: en-US
From:   Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20230613003326.3538391-1-azeemshaikh38@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello.

On 13.06.23 02:33, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> 
> Direct replacement is safe here since the return values
> from the helper macros are ignored by the callers.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
> ---
>   net/ieee802154/trace.h |    2 +-
>   net/mac802154/trace.h  |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ieee802154/trace.h b/net/ieee802154/trace.h
> index e5d8439b9e45..c16db0b326fa 100644
> --- a/net/ieee802154/trace.h
> +++ b/net/ieee802154/trace.h
> @@ -13,7 +13,7 @@
>   
>   #define MAXNAME		32
>   #define WPAN_PHY_ENTRY	__array(char, wpan_phy_name, MAXNAME)
> -#define WPAN_PHY_ASSIGN	strlcpy(__entry->wpan_phy_name,	 \
> +#define WPAN_PHY_ASSIGN	strscpy(__entry->wpan_phy_name,	 \
>   				wpan_phy_name(wpan_phy), \
>   				MAXNAME)
>   #define WPAN_PHY_PR_FMT	"%s"
> diff --git a/net/mac802154/trace.h b/net/mac802154/trace.h
> index 689396d6c76a..1574ecc48075 100644
> --- a/net/mac802154/trace.h
> +++ b/net/mac802154/trace.h
> @@ -14,7 +14,7 @@
>   
>   #define MAXNAME		32
>   #define LOCAL_ENTRY	__array(char, wpan_phy_name, MAXNAME)
> -#define LOCAL_ASSIGN	strlcpy(__entry->wpan_phy_name, \
> +#define LOCAL_ASSIGN	strscpy(__entry->wpan_phy_name, \
>   				wpan_phy_name(local->hw.phy), MAXNAME)
>   #define LOCAL_PR_FMT	"%s"
>   #define LOCAL_PR_ARG	__entry->wpan_phy_name


This patch has been applied to the wpan tree and will be
part of the next pull request to net. Thanks!

regards
Stefan Schmidt
