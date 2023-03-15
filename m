Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03DB6BA71F
	for <lists+linux-wpan@lfdr.de>; Wed, 15 Mar 2023 06:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCOFcy (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 15 Mar 2023 01:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjCOFcx (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 15 Mar 2023 01:32:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769052CC75;
        Tue, 14 Mar 2023 22:32:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5E7461AA3;
        Wed, 15 Mar 2023 05:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845ADC433EF;
        Wed, 15 Mar 2023 05:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678857766;
        bh=Ho9vgqp2jyAVZx01d08QVZd9aMjXRu8aXf2qqWMyHgs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gfrqScDnSV2ajr9IDlCMnWcUlVQHuP91pjpKeNxRDwTGdOwpxeTJnBqI6FJDaIkU5
         o8/WEUNdy8LQLBL65yVx2d9D7pZa+daLJlUWqMrweJG73zgQcrbJpxEnxzgHbHkttg
         sNK/FSN/kLDomRmCDRm0qI0Vg6lsQYT6ojzMXOzGCa+DxbreIBMtY7K2lGY0ERPvpS
         yYuwyo1Dk20SqB1Co+RFoIL5wpuFm81JEBx9OcfaTN0mTWt9Zx2+ThJIJMJLW0l0Ey
         IC8gBqXtrqQ/xIERwXMCCNdkQQsC0ucHBwybZz4BkEjnHcychgzg/dIWTY42Dbf888
         bW0a68bthbUmQ==
Date:   Tue, 14 Mar 2023 22:22:44 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org
Subject: Re: [PATCH 01/12] net: dsa: lantiq_gswip: mark OF related data as
 maybe unused
Message-ID: <20230314222244.4325bb3f@kernel.org>
In-Reply-To: <20230312105729.bnxn4a6mf2gav7ym@skbuf>
References: <20230311173303.262618-1-krzysztof.kozlowski@linaro.org>
        <20230311181434.lycxr5h2f6xcmwdj@skbuf>
        <d9b197c8-56fe-b59d-5fca-bc863ac1e7ed@linaro.org>
        <20230312105729.bnxn4a6mf2gav7ym@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Sun, 12 Mar 2023 12:57:29 +0200 Vladimir Oltean wrote:
> > Sorry, I don't follow. I don't touch that wrappers, just fix errors
> > related to OF device ID tables, although in few cases it is indeed
> > related to of_match_node.  
> 
> I'm saying this because in lantiq_gswip.c, xway_gphy_match is accessed
> through of_match_node(). If the shim definition for of_match_node() was
> different, the variable wouldn't have been unused with CONFIG_OF=n.
> I guess it's worth considering changing that wrapper instead of adding
> the __maybe_unused.

Hi Krzysztof, have you had a chance to check if using an empty static
inline is enough to silence the compiler? Seems like it could save
us quite some churn? Or do we want the of_match_node() decorations
to go away in general?
