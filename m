Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815FF5AA60E
	for <lists+linux-wpan@lfdr.de>; Fri,  2 Sep 2022 04:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbiIBCs1 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 1 Sep 2022 22:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234828AbiIBCsY (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 1 Sep 2022 22:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E29EB07C7
        for <linux-wpan@vger.kernel.org>; Thu,  1 Sep 2022 19:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662086903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6KEvl3zUNi9HajmySQBLA/mODmKbbOY/odaiZIlDLHM=;
        b=QVh/puHPrf0zKe5mT+FLIsBBC+KM6hhV9rXvHCpBtOuKw7B8llGdrLfRUIaKXR/uct6Eaf
        f0Y8U9x3vx1ASm5Wt6Q+Iz0ZOtW4oIRYAfNqY4NeShi9PQFRbsZ3VNYkNRkvwvsDBYmuet
        gOpLZ7zj8thIo03ZgckHwNUC71qSuh4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-juIrSHf_OXO_3UKZoro0fA-1; Thu, 01 Sep 2022 22:48:21 -0400
X-MC-Unique: juIrSHf_OXO_3UKZoro0fA-1
Received: by mail-qt1-f199.google.com with SMTP id h19-20020ac85493000000b00343408bd8e5so619542qtq.4
        for <linux-wpan@vger.kernel.org>; Thu, 01 Sep 2022 19:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6KEvl3zUNi9HajmySQBLA/mODmKbbOY/odaiZIlDLHM=;
        b=d9m+NEw4te8aGA28x/WZcJ/vVLs0MRQeS8Nsrz3MD0rEooGibzGJ1uLSIlEb7TyRgo
         F3qG/7K8qPPMv09AjvEzJ0zWN6Imqj1c6invvJieG0H9KgeB1VpQdzt0b2DRCju228uz
         T40QT6voyt89oPcthu3/EYMCpL/ifDAMRsUajm3sHhUylCgLIqmIsrmRyW2RtsggLBxr
         QiFCFttsmc9ljf//m7j5UVoSt5Y0h0MIRMY2TUityPACf1r+R5CYMcL08/TGADH+TGnH
         Nohg1j4QRBnDDxhqOjorHJZXTnkb7d0vA/6dq4GeKRSCpYZ/L/YAeSVxYm357mP7dZzf
         768g==
X-Gm-Message-State: ACgBeo2hwGfxtrWmFaYyXCaAaQL32CM0sDMhN8kWK4K4LiXEfJ34KyeT
        6zkuhlHLqsr5MRBua6IHaQi2z/xGEIgYazcfvAuUdTGq0moTIOHrbGqI0z3kIpjhTSEYZ9iREMN
        IJdhC6pRIWN6eBw/Oc/fj2yEaR62DOUopHx86kw==
X-Received: by 2002:a05:622a:4cd:b0:343:65a4:e212 with SMTP id q13-20020a05622a04cd00b0034365a4e212mr26028885qtx.526.1662086901411;
        Thu, 01 Sep 2022 19:48:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7kM+aUx6ow6Gtwtn5277EboelJA3nOHPK3W7NAcU9dfPSIyV1OalkAADe0Q4cM5H8qXURXWh9Pty2JrHnEdsw=
X-Received: by 2002:a05:622a:4cd:b0:343:65a4:e212 with SMTP id
 q13-20020a05622a04cd00b0034365a4e212mr26028873qtx.526.1662086901205; Thu, 01
 Sep 2022 19:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220830101237.22782-1-gal@nvidia.com> <20220830231330.1c618258@kernel.org>
 <4187e35d-0965-cf65-bff5-e4f71a04d272@nvidia.com> <20220830233124.2770ffc2@kernel.org>
 <20220831112150.36e503bd@kernel.org> <36f09967-b211-ef48-7360-b6dedfda73e3@datenfreihafen.org>
 <20220831140947.7e8d06ee@kernel.org> <YxBTaxMmHKiLjcCo@unreal> <20220901132338.2953518c@kernel.org>
In-Reply-To: <20220901132338.2953518c@kernel.org>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Thu, 1 Sep 2022 22:48:10 -0400
Message-ID: <CAK-6q+gtcDVCGB0KvhMjQ-WotWuyL7mpw99-36j_TcC7mc2qyA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ieee802154: Fix compilation error when
 CONFIG_IEEE802154_NL802154_EXPERIMENTAL is disabled
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Alexander Aring <alex.aring@gmail.com>,
        Gal Pressman <gal@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Network Development <netdev@vger.kernel.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Thu, Sep 1, 2022 at 4:23 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 1 Sep 2022 09:38:35 +0300 Leon Romanovsky wrote:
> > There is no such thing like experimental UAPI. Once you put something
> > in UAPI headers and/or allowed users to issue calls from userspace
> > to kernel, they can use it. We don't control how users compile their
> > kernels.
> >
> > So it is not break "experimental commands", but break commands that
> > maybe shouldn't exist in first place.
> >
> > nl802154 code suffers from two basic mistakes:
> > 1. User visible defines are not part of UAPI headers. For example,
> > include/net/nl802154.h should be in include/uapi/net/....
> > 2. Used Kconfig option for pseudo-UAPI header.
> >
> > In this specific case, I checked that Fedora didn't enable this
> > CONFIG_IEEE802154_NL802154_EXPERIMENTAL knob, but someone needs
> > to check debian and other distros too.
> >
> > Most likely it is not used at all.
>
> You're right, FWIW. I didn't want to get sidetracked into that before
> we fix the immediate build issue. It's not the only family playing uAPI
> games :(
>

I am not sure how to proceed here now, if removing the
CONFIG_IEEE802154_NL802154_EXPERIMENTAL option is the way to go. Then
do it?

It was a mistake to introduce that whole thing and a probably better
way is to change nl802154 is to mark it deprecated, after a while
rename the enum value to some reserved value and remove the associated
code. Then after some time it can be reused again? If this sounds like
a better idea how to handle the use case we have here?

I am sorry that this config currently causes such a big problem here.

- Alex

