Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DF35A4113
	for <lists+linux-wpan@lfdr.de>; Mon, 29 Aug 2022 04:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiH2Cbf (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sun, 28 Aug 2022 22:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiH2Cbe (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Sun, 28 Aug 2022 22:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC6430F6D
        for <linux-wpan@vger.kernel.org>; Sun, 28 Aug 2022 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661740292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ah8Haau/7IaRkO08sKK/2Ap55aXTGN4QiqzCtQHwyPs=;
        b=hVT7VSonrffn7koa15oFpJYqeTUbn2ak1ldRHeACVtRg6Chlz4v1SWBkF+Ok8NAvAZBZsH
        +QqpCkPsAJeyMZqmjEMF1hrC4XNcBIQUeWVT7hYVo7ruu0M9wpkdcTgWiJcwaJR7AUxp0D
        SHSi/VpjncK+a50esluRyD6eEWPnDxk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-AAs2AbpCPPe92z5piZz6_Q-1; Sun, 28 Aug 2022 22:31:30 -0400
X-MC-Unique: AAs2AbpCPPe92z5piZz6_Q-1
Received: by mail-qk1-f198.google.com with SMTP id l15-20020a05620a28cf00b006b46997c070so5698678qkp.20
        for <linux-wpan@vger.kernel.org>; Sun, 28 Aug 2022 19:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ah8Haau/7IaRkO08sKK/2Ap55aXTGN4QiqzCtQHwyPs=;
        b=w9gxriCulI+Ax8uAIv4QOUwcZBPHc6rPCIPhyPLW6K5aQK2stvS1AuEVKwWhu8mom9
         KxwhZvgISj0xAs1LkYD5Qa8SHIriGluthMP66C7YyyqnPkR6BizreUNy1DJLHXFlg3Mt
         M+YhRR2CpjWbPBiUFIFrtfhhxx6x7Fc+uhGhLyJJYpLno7AqlKWzCR5spI4Z5O5gX/ng
         MLnvxzpjpClBWgY7lUB7h61vdif1ojjXeQrnIx54NoR55bYRl6vmEaABG5gT4s9fJObF
         MRkl4qy2645n+W2G+X6ZQI1AW2HFrb5nPwWWhMGdkCP0vfrrfYS1WnMZPvnkN3vdk4ic
         6fIg==
X-Gm-Message-State: ACgBeo2OADb8s8BbRckL2A55XlvjwjKnb2ppG3nIh5yUooZXtB2RtPzc
        dCKu+UgQXDqOzHMpkaf4Db5wW/CAv0sW3PND/KaaobTvuChZQIxh9BaLQiF4wbRSLAtZC+B/daK
        IO3z4zWzfiY0WuBar+lHzApRmzCwoUF+Xp+moSg==
X-Received: by 2002:a05:622a:214:b0:342:f97c:1706 with SMTP id b20-20020a05622a021400b00342f97c1706mr8420714qtx.291.1661740290450;
        Sun, 28 Aug 2022 19:31:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4BlX9asFU3kB2QAzKQnGObKQL+aiQ/8YjuCdJVz26dC8K8S8TDzTsjey0PyYfu5baLhfz1ztdhu8kcjt2ZtN4=
X-Received: by 2002:a05:622a:214:b0:342:f97c:1706 with SMTP id
 b20-20020a05622a021400b00342f97c1706mr8420702qtx.291.1661740290272; Sun, 28
 Aug 2022 19:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220701143052.1267509-1-miquel.raynal@bootlin.com>
 <20220701143052.1267509-2-miquel.raynal@bootlin.com> <CAK-6q+jkUUjAGqEDgU1oJvRkigUbvSO5SXWRau6+320b=GbfxQ@mail.gmail.com>
 <20220819191109.0e639918@xps-13> <CAK-6q+gCY3ufaADHNQWJGNpNZJMwm=fhKfe02GWkfGEdgsMVzg@mail.gmail.com>
 <20220823182950.1c722e13@xps-13> <CAK-6q+jfva++dGkyX_h2zQGXnoJpiOu5+eofCto=KZ+u6KJbJA@mail.gmail.com>
 <20220824093547.16f05d15@xps-13> <CAK-6q+gqX8w+WEgSk2J9FOdrFJPvqJOsgmaY4wOu=siRszBujA@mail.gmail.com>
 <20220825104035.11806a67@xps-13> <CAK-6q+hxSpw1yJR5H5D6gy5gGdm6Qa3VzyjZXA45KFQfVVqwFw@mail.gmail.com>
 <CAK-6q+jbBg4kCh88Oz7mBa0RBBX_+cqqoPjT3POEjbQKX1ZDKw@mail.gmail.com> <20220826100825.4f79c777@xps-13>
In-Reply-To: <20220826100825.4f79c777@xps-13>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Sun, 28 Aug 2022 22:31:19 -0400
Message-ID: <CAK-6q+gZ5fSdNptvQoKpf1SOqODv70gzbFTYyWBagC6AFtAkig@mail.gmail.com>
Subject: Re: [PATCH wpan-next 01/20] net: mac802154: Allow the creation of
 coordinator interfaces
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Network Development <netdev@vger.kernel.org>,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Fri, Aug 26, 2022 at 4:08 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
...
> >
> > I need to say that I really used multiple monitors at the same time on
> > one phy only and I did that with hwsim to run multiple user space
> > stacks. It was working and I was happy and didn't need to do a lot of
> > phy creations in hwsim.
>
> Indeed, looking at the code, you could use as many MONITOR interfaces
> you needed, but only a single NODE. I've changed that to use as many
> NODE and COORD that we wish.
>

Be careful there, there is a reason why we don't allow this and this
has to do with support of multiple address filters... but here it
depends also what you mean with "use".

I need to admit, you can achieve the same behaviour of multiple user
space stacks and one monitor, _but_ you can easily filter the traffic
if you do it per interface...

- Alex

