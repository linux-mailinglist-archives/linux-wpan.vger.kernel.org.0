Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625D854416C
	for <lists+linux-wpan@lfdr.de>; Thu,  9 Jun 2022 04:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbiFICX3 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 8 Jun 2022 22:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbiFICX2 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 8 Jun 2022 22:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3AC48FF9B
        for <linux-wpan@vger.kernel.org>; Wed,  8 Jun 2022 19:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654741407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eYNDEDwZM6hyBg8vNkvjxS80NrwAKCp+U6fNDWVw9JI=;
        b=Eku6tpaoIKC/b9ReSJWMSRIrFjmIvnhgJtZKenXkzVgYUfW8nEMk117Pp0GvWPEZv79L+g
        0gO+xrPE/0ReGiQ1a4h3rQufl/Fe/QJwxB4tdzFTMkdJemNxwU072SN0B9r8J/EUkMtuVY
        vEFmhqoeJxhX1unT6BYHcywsWAbbXQA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-8tEiZwbgNV2npT_8Wby8Kg-1; Wed, 08 Jun 2022 22:23:25 -0400
X-MC-Unique: 8tEiZwbgNV2npT_8Wby8Kg-1
Received: by mail-qt1-f198.google.com with SMTP id f22-20020ac859d6000000b00304bf4dba7fso17690406qtf.3
        for <linux-wpan@vger.kernel.org>; Wed, 08 Jun 2022 19:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYNDEDwZM6hyBg8vNkvjxS80NrwAKCp+U6fNDWVw9JI=;
        b=ZZ4qbLKCpqgorQ2arTlF1xUWl0086rk78Iov8FzxVXVKUS/d3O6FxQB/+Q3wNE4MI9
         c6zlY9I7vRqp4jjobS2Q+CnzWgwQcmBuTILew4CtkDWuUBfz44SAXgKDkwJc+l2NFDFI
         bPwLCEO9uIUejwwbqSokAcXjI6NS9qRAjd2iiufX1BRpf56+QjP7cBaVvv6EKovjYHtz
         irl7YfI9s3WwFrcyC4R/xve+sV8MGMVc0jgtBIweY81Qp01Zc7cv4ebzs2hZOEbMGnpv
         okcGF6y+RtJSNoQAMK2x8gPAlPvrSVwqrpxWC7N6+R3q3UisThTp7gulZjGJqThz6mTP
         ecug==
X-Gm-Message-State: AOAM532WdgBcvqbQ1VJFS9197b0qP2O2uXq4skykImvC5x7aUkapqYu1
        P/TH06y9tDnR0f478JUEWuB9l51PEMv/8vBKxjiYMWk51jVyKuV74pcaVBeFVOdiY4G2ubpZYsc
        hr4gH000KU+sePVzoqcr4rDax/4QnNNSWw7ePiw==
X-Received: by 2002:ad4:5f86:0:b0:46b:9505:5a27 with SMTP id jp6-20020ad45f86000000b0046b95055a27mr15060063qvb.2.1654741405180;
        Wed, 08 Jun 2022 19:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF0vr6SZ+jfD7Mv2R9WVieb9D8PWZIbLy9cHal/y2tBi5+x3mGbKQhuIJfdxjhh3z6s8iDHRVlgRKtDllMVME=
X-Received: by 2002:ad4:5f86:0:b0:46b:9505:5a27 with SMTP id
 jp6-20020ad45f86000000b0046b95055a27mr15060048qvb.2.1654741404942; Wed, 08
 Jun 2022 19:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220603182143.692576-1-miquel.raynal@bootlin.com>
 <20220603182143.692576-2-miquel.raynal@bootlin.com> <CAK-6q+hAZMqsN=S9uWAm4rTN+uZwz7_L42=emPHz7+MvfW6ZpQ@mail.gmail.com>
 <20220606174319.0924f80d@xps-13> <CAK-6q+itswJrmy-AhZ5DpnHH0UsfAeTPQTmX8WfG8=PteumVLg@mail.gmail.com>
 <20220607181608.609429cb@xps-13> <20220608154749.06b62d59@xps-13>
 <20220608163708.26ccd4cc@xps-13> <CAK-6q+iD0_bS2z_BdKsyeqYvzxj2x-v+SWAo2UO02j7yGtEcEg@mail.gmail.com>
In-Reply-To: <CAK-6q+iD0_bS2z_BdKsyeqYvzxj2x-v+SWAo2UO02j7yGtEcEg@mail.gmail.com>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Wed, 8 Jun 2022 22:23:14 -0400
Message-ID: <CAK-6q+gBCakX8Vm1SHuLfex5jBqLKySUiaZKg3So+zjeJaSehw@mail.gmail.com>
Subject: Re: [PATCH wpan-next 1/6] net: ieee802154: Drop coordinator interface type
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Network Development <netdev@vger.kernel.org>,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Wed, Jun 8, 2022 at 10:06 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Wed, Jun 8, 2022 at 10:37 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> >
> > miquel.raynal@bootlin.com wrote on Wed, 8 Jun 2022 15:47:49 +0200:
> >
> > > Hi Alex,
> > >
> > > > > 3. coordinator (any $TYPE specific) userspace software
> > > > >
> > > > > May the main argument. Some coordinator specific user space daemon
> > > > > does specific type handling (e.g. hostapd) maybe because some library
> > > > > is required. It is a pain to deal with changing roles during the
> > > > > lifetime of an interface and synchronize user space software with it.
> > > > > We should keep in mind that some of those handlings will maybe be
> > > > > moved to user space instead of doing it in the kernel. I am fine with
> > > > > the solution now, but keep in mind to offer such a possibility.
> > > > >
> > > > > I think the above arguments are probably the same why wireless is
> > > > > doing something similar and I would avoid running into issues or it's
> > > > > really difficult to handle because you need to solve other Linux net
> > > > > architecture handling at first.
> > > >
> > > > Yep.
> > >
> > > The spec makes a difference between "coordinator" and "PAN
> > > coordinator", which one is the "coordinator" interface type supposed to
> > > picture? I believe we are talking about being a "PAN coordinator", but
> > > I want to be sure that we are aligned on the terms.
> > >
> > > > > > > You are mixing things here with "role in the network" and what
> > > > > > > the transceiver capability (RFD, FFD) is, which are two
> > > > > > > different things.
> > > > > >
> > > > > > I don't think I am, however maybe our vision differ on what an
> > > > > > interface should be.
> > > > > >
> > > > > > > You should use those defines and the user needs to create a new
> > > > > > > interface type and probably have a different extended address
> > > > > > > to act as a coordinator.
> > > > > >
> > > > > > Can't we just simply switch from coordinator to !coordinator
> > > > > > (that's what I currently implemented)? Why would we need the user
> > > > > > to create a new interface type *and* to provide a new address?
> > > > > >
> > > > > > Note that these are real questions that I am asking myself. I'm
> > > > > > fine adapting my implementation, as long as I get the main idea.
> > > > > >
> > > > >
> > > > > See above.
> > > >
> > > > That's okay for me. I will adapt my implementation to use the
> > > > interface thing. In the mean time additional details about what a
> > > > coordinator interface should do differently (above question) is
> > > > welcome because this is not something I am really comfortable with.
> > >
> > > I've updated the implementation to use the IFACE_COORD interface and it
> > > works fine, besides one question below.
> > >
> > > Also, I read the spec once again (soon I'll sleep with it) and
> > > actually what I extracted is that:
> > >
> > > * A FFD, when turned on, will perform a scan, then associate to any PAN
> > >   it found (algorithm is beyond the spec) or otherwise create a PAN ID
> > >   and start its own PAN. In both cases, it finishes its setup by
> > >   starting to send beacons.
> > >
> > > * A RFD will behave more or less the same, without the PAN creation
> > >   possibility of course. RFD-RX and RFD-TX are not required to support
> > >   any of that, I'll assume none of the scanning features is suitable
> > >   for them.
> >
> > Acutally, RFDs do not send beacons, AFAIU.
> >
> > > I have a couple of questions however:
> > >
> > > - Creating an interface (let's call it wpancoord) out of wpan0 means
> > >   that two interfaces can be used in different ways and one can use
> > >   wpan0 as a node while using wpancoord as a PAN coordinator. Is that
> > >   really allowed? How should we prevent this from happening?
> > >
> > > - Should the device always wait for the user(space) to provide the PAN
> > >   to associate to after the scan procedure right after the
> > >   add_interface()? (like an information that must be provided prior to
> > >   set the interface up?)
> > >
> > > - How does an orphan FFD should pick the PAN ID for a PAN creation?
> > >   Should we use a random number? Start from 0 upwards? Start from
> > >   0xfffd downwards? Should the user always provide it?
> > >
> > > - Should an FFD be able to create its own PAN on demand? Shall we
> > >   allow to do that at the creation of the new interface?
> >
> > Additional questions:
> >
> >   - How is chosen the beacon order? Should we have a default value?
> >     Should we default to 15 (not on a beacon enabled PAN)? Should we be
> >     able to update this value during the lifetime of the PAN?
> >
>
> Is there no mib default value for this?
>
> >   - The spec talks about the cluster topology, where a coordinator that
> >     just associated to a PAN starts emitting beacons, which may enable
> >     other devices in its range to ask to join the PAN (increased area
> >     coverage). But then, there is no information about how the newly
> >     added device should do to join the PAN coordinator which is anyway
> >     out of range to require the association, transmit data, etc. Any
> >     idea how this is supposed to work?
> >
>
> I think we should maybe add a feature for this later if we don't know
> how it is supposed to work or there are still open questions and first
> introduce the manual setup. After that, maybe things will become
> clearer and we can add support for this part. Is this okay?

*I also think that this can be done in user space by a daemon by
triggering netlink commands for scan/assoc/etc. (manual setup) and
providing such functionality as mentioned by the spec (auto creation
of pan, assoc with pan). Things which are unclear here are then moved
to the user as the operations for scan/assoc/etc. will not be
different or at least parameterized. The point here is that providing
the minimum basic functionality should be done at first, then we can
look at how to realize such handling (either in kernel or user space).

- Alex

