Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9283A54BFD4
	for <lists+linux-wpan@lfdr.de>; Wed, 15 Jun 2022 04:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243570AbiFOCxg (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 14 Jun 2022 22:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiFOCxe (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 14 Jun 2022 22:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 498BF2EA31
        for <linux-wpan@vger.kernel.org>; Tue, 14 Jun 2022 19:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655261612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+psGn1HbD1ddfcHcN+3MfAY7nS065MYabWrtHtxzgJo=;
        b=CqhB66fWzDfsL275I8IYbkxJrnPELG6vw0n4KmwDUgj9IDXnwq478BFSN0xiN8/kK7Jmwu
        pnT8MrGoJDp7KIf9JhaGVk5MCnKXujWcBh7jh7YdlM2LHh0WYWBob8fpQv+VE5VvmPfznx
        x8JOTHsPlA1YBdy4xBKn+2K+hFK832A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-DnsdQ8f0PECZolFwxWMCcg-1; Tue, 14 Jun 2022 22:53:30 -0400
X-MC-Unique: DnsdQ8f0PECZolFwxWMCcg-1
Received: by mail-qk1-f197.google.com with SMTP id j11-20020a37c24b000000b006a6bd97578aso8953823qkm.15
        for <linux-wpan@vger.kernel.org>; Tue, 14 Jun 2022 19:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+psGn1HbD1ddfcHcN+3MfAY7nS065MYabWrtHtxzgJo=;
        b=VtfAIt/rd/FjRw3B924Wq59AP4H2AsJ1LL5vBgc8HaDI8rM+IBKcmy/7gDt/EwKPlE
         EA8m6/8yptCAwPMMukssm9vrQvPm7cR/ov/BQ1yzGQ4mqfEILX0Y1tb+s2YC/oQ9sSiY
         dMRSj4dBW2sd9ynoBjCA/o0KDBzCXhwFFKGCJ6H3IlponRwHaQc2t+F/r71Jey7dBMER
         k4DPap5DfWlzjPM1NW46OoD/KyEEv0EOWfaB2R4J6ETh7FGDn1VawaOyx8hHUan9ynBl
         9c6swRyk4X8hZP5Vm7uZxlHQwGdznOkap5QoXZp4B0Vt4Zzxp+4j7MGYFPEStmgHB/HB
         n0qw==
X-Gm-Message-State: AOAM532c4fH9ZAQLXC+lgOE+dDxXgxFiVE5eTfJyNM8HAH7taUmsgnXO
        qwNFuMRE+zspchmnMWFGaf9pFF2Ej/083t1AD5ViN7DsVRMTt60xIPeATFP1zYaE6v5fvO6cC5G
        2BMghGCfP4kxMLrrTPouo3p10UsPGqeEMm+Hx5w==
X-Received: by 2002:ac8:5749:0:b0:305:1ea5:4a7 with SMTP id 9-20020ac85749000000b003051ea504a7mr6799825qtx.291.1655261610342;
        Tue, 14 Jun 2022 19:53:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJozBKiWIIRK2SoWxW71uiM6m1ijR9laogZS/lkB354NOpSjaTp93daJqxAGR2o2gRD2tO9VBCFoSgWJLub18=
X-Received: by 2002:ac8:5749:0:b0:305:1ea5:4a7 with SMTP id
 9-20020ac85749000000b003051ea504a7mr6799821qtx.291.1655261610152; Tue, 14 Jun
 2022 19:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220613043735.1039895-1-aahringo@redhat.com> <20220613161457.0a05cda0@xps-13>
In-Reply-To: <20220613161457.0a05cda0@xps-13>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Tue, 14 Jun 2022 22:53:19 -0400
Message-ID: <CAK-6q+ioLUC=M-i00JX4mq8a9dh6+Jh=q4ZhYgmZmeoS8WMN+g@mail.gmail.com>
Subject: Re: [PATCHv2 wpan-next 0/2] mac802154: atomic_dec_and_test() fixes
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Mon, Jun 13, 2022 at 10:15 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Alex,
>
> aahringo@redhat.com wrote on Mon, 13 Jun 2022 00:37:33 -0400:
>
> > Hi,
> >
> > I was wondering why nothing worked anymore. I found it...
> >
> > changes since v2:
> >
> >  - fix fixes tags in mac802154: util: fix release queue handling
> >  - add patch mac802154: fix atomic_dec_and_test checks got somehow
> >    confused 2 patch same issue
>
> I've got initially confused with your patchset but yes indeed the API
> works the opposite way compared to my gut understanding.
>

not the first time I am seeing this, I fixed similar issues already at
other places.

btw I told you the right semantic at [0] ....

> We bought hardware and I am currently setting up a real network to
> hopefully track these regressions myself in the future.
>

I wonder why you don't use hwsim... and you already mentioned hwsim to
me. You can simply make a 6lowpan interface on it and ping it - no
hardware needed and this would already show issues... Now you can say,
why I do not test it... maybe I do next time but review takes longer
then.

- Alex

[0] https://lore.kernel.org/linux-wpan/CAK-6q+jCYDQ-rtyawz1m2Yt+ti=3d6PrhZebB=-PjcX-6L-Kdg@mail.gmail.com/

