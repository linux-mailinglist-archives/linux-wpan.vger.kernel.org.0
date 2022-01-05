Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A834484C01
	for <lists+linux-wpan@lfdr.de>; Wed,  5 Jan 2022 02:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235704AbiAEBQn (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 4 Jan 2022 20:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235660AbiAEBQn (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 4 Jan 2022 20:16:43 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4416C061761;
        Tue,  4 Jan 2022 17:16:42 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id w20so70586800wra.9;
        Tue, 04 Jan 2022 17:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+guEoPafkUbErZ17N8q8rCXywG45j8Yuz7sIO8/TE4=;
        b=XhiS7BmkUZFx2KfgeaSMHI/wY+mxrq1ySFLY0ENGolNnmaf3M4bQkxsIAfcsIc+HDR
         pJlwHz7zXpiVNb1K9oO1QSXZsJhBv1qPV0iynWYVHcZqgLJA7ovujYZIT7kt5s3ZUekw
         jBOK+O34Q3etwRL6oMivF8CHJnlp+Nu6CRIZaQBU+z2dbEUwwvCo6W04cwbUNqcbluEw
         /WTKZ4DckybfdLMhtD8z9yjTm9JuOJCCzpkQfBMdM/l8O7nH/zu17fJImmTkJFA/K4gA
         Sq2g+Z1uaDYwvkjGAmjO6DvG2P+1Ev/2CybtEAe3OkEKIy65MHjd9f931ZDcDy94RHAI
         X3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+guEoPafkUbErZ17N8q8rCXywG45j8Yuz7sIO8/TE4=;
        b=CXWrh/Jo90kukSOEgqCLX8n+8IBt43jVVhFYknClX8zR44HGBPUW831YF8uYPj0FHA
         lwZpCbE0UkFq3Pxyq/k3rMrORkvBpRUdqlhRU7lr1mI6fD9W7zdB04QfV9ti6v02Ngat
         ypTHjz2EEYoD29ChFSHpzKBTuWRj1C+EIdLj+Nry72OtxNCv7BUIHwxiKFOiN6G4uLar
         McaBDm//7zwvUvp4bkG4UoLb/cDmXcu0CbiYQPSuot7lPDDYkz/2wcZhD5PfHaBVX7lg
         vpj4865SK/FrRIgfjQ8V0vwHxchjS8vLmaJPlNbt32nYG3CTy8Q79B4ldHogTXVqhPkg
         Lvqg==
X-Gm-Message-State: AOAM533YaWkAL9aswTl6ZRwtRNIxGUfvKrX28iksLIhKic8Bbv3C7xtc
        gHAi4Mg8CIU9o2Qy+TShOD06DG8l0IvSpVND8YE=
X-Google-Smtp-Source: ABdhPJzUsgss4V3sU+zUmGws2K3JI44IUVjw54V+CZHz3iYuXs4bUgJs0qmt/eNY8uWUcz+hDFz5OOeMGhbrrAASNqg=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr45097940wrd.81.1641345401204;
 Tue, 04 Jan 2022 17:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20211222155743.256280-1-miquel.raynal@bootlin.com>
 <20211222155743.256280-13-miquel.raynal@bootlin.com> <CAB_54W6AZ+LGTcFsQjNx7uq=+R5v_kdF0Xm5kwWQ8ONtfOrmAw@mail.gmail.com>
 <Ycx0mwQcFsmVqWVH@ni.fr.eu.org> <CAB_54W41ZEoXzoD2_wadfMTY8anv9D9e2T5wRckdXjs7jKTTCA@mail.gmail.com>
 <CAB_54W6gHE1S9Q+-SVbrnAWPxBxnvf54XVTCmddtj8g-bZzMRA@mail.gmail.com> <20220104191802.2323e44a@xps13>
In-Reply-To: <20220104191802.2323e44a@xps13>
From:   Alexander Aring <alex.aring@gmail.com>
Date:   Tue, 4 Jan 2022 20:16:30 -0500
Message-ID: <CAB_54W5quZz8rVrbdx+cotTRZZpJ4ouRDZkxeW6S1L775Si=cw@mail.gmail.com>
Subject: Re: [net-next 12/18] net: mac802154: Handle scan requests
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Nicolas Schodet <nico@ni.fr.eu.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi.

On Tue, 4 Jan 2022 at 13:18, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Alexander,
>
...
> >
> > I see now why promiscuous mode is necessary here. The actual
> > promiscuous mode setting for the driver is not the same as promiscuous
> > mode in 802.15.4 spec. For until now it was there for running a
> > sniffer device only.
> > As the 802.15.4 spec defines some "filtering levels" I came up with a
> > draft so we can define which filtering level should be done on the
> > hardware.
>
> I like the idea but I'm not sure on what side you want to tackle the
> problem first. Is it the phy drivers which should advertise the mac
> about the promiscuous mode they support (which matches the description
> below but does not fit the purpose of an enum very well)? Or is it the
> MAC that requests a particular filtering mode? In this case what a phy
> driver should do if:
> - the requested mode is more constrained than its usual promiscuous
>   capabilities?

Then, the driver needs to go one level lower and tell mac802154 to
filter more out.

> - the requested mode is less constrained than its usual promiscuous
>   capabilities?
>

Then mac802154 needs to filter more out.

I am more worried at the point the transceiver will shut off automatic
acknowledge handling which we probably can't do in software in cases
where it's required. Some transceivers will shut that off if they turn
off address filtering and if they don't have a detailed setting for
that they will ack every frame what they see, which is... not so good.

Future work would be to warn about mismatch of seeing frames, what the
hardware would filter out vs what mac802154 sees. More further work
could be to use a monitor interface and raw sockets and verify
transceivers how they act to frames.

> >
> > diff --git a/include/net/mac802154.h b/include/net/mac802154.h
> > index 72978fb72a3a..3839ed3f8f0d 100644
> > --- a/include/net/mac802154.h
> > +++ b/include/net/mac802154.h
> > @@ -130,6 +130,48 @@ enum ieee802154_hw_flags {
> >  #define IEEE802154_HW_OMIT_CKSUM       (IEEE802154_HW_TX_OMIT_CKSUM | \
> >                                          IEEE802154_HW_RX_OMIT_CKSUM)
> >
> > +/**
> > + * enum ieee802154_filter_mode - hardware filter mode that a driver
> > will pass to
> > + *                              pass to mac802154.
>
> Isn't it the opposite: The filtering level the mac is requesting? Here
> it looks like we are describing driver capabilities (ie what drivers
> advertise supporting).
>

I am sorry. I meant what the transceiver "should" deliver or "level
less" to mac802154.

I think the filtering when not much resources are required can also be
done in a hardirq context. There exists a tasklet which is there to
switch to a softirq context [0], currently we do all parsing there.

> > + *
> > + * @IEEE802154_FILTER_MODE_0: No MFR filtering at all.
>
> I suppose this would be for a sniffer accepting all frames, including
> the bad ones.
>

yes.

> > + *
> > + * @IEEE802154_FILTER_MODE_1: IEEE802154_FILTER_MODE_1 with a bad FCS filter.
>
> This means that the driver should only discard bad frames and propagate
> all the remaining frames, right? So this typically is a regular sniffer
> mode.
>

I think this depends on what you want to filter out, so far I know in
wireless this is configurable. Wireshark always expects the FCS in
their payload for a linux 802.15.4 monitor interface and I think this
is because of some historical reason to support the first 802.15.4
sniffers in wireshark.
There is a difference between filter bad FCS and cutoff FCS. I need to
look it up but I think wireless would cut off the checksum if FCS is
filtered on hardware (may even some transceivers will not deliver FCS
to you if you enable filtering).

> > + *
> > + * @IEEE802154_FILTER_MODE_2: Same as IEEE802154_FILTER_MODE_1, known as
> > + *                           802.15.4 promiscuous mode, sets
> > + *                           mib.PromiscuousMode.
>
> I believe what you call mib.PromiscuousMode is the mode that is
> referred in the spec, ie. being in the official promiscuous mode? So
> that is the mode that should be used "by default" when really asking
> for a 802154 promiscuous mode.
>

then we don't call it in driver level promiscuous mode, we call it
"filtering level". And this is the filtering for cases when the
standard says set "mib.PromiscuousMode".

> Is there really a need for a different mode than mode_1 ?
>

I think so, I am not sure what they or will define if PromiscuousMode
is set or not and might the transceiver need to get notice about it?
It's not needed now, but we might keep it in mind then.

> > + *
> > + * @IEEE802154_FILTER_MODE_3_SCAN: Same as IEEE802154_FILTER_MODE_2 without
> > + *                                set mib.PromiscuousMode.
>
> And here what is the difference between MODE_1 and MODE_3 ?
>
> I suppose here we should as well drop all non-beacon frames?

Yes, additionally there could be a transceiver doing this filtering on
hardware and tell that it's in scan and this is the difference.

>
> > + *
> > + * @IEEE802154_FILTER_MODE_3_NO_SCAN:
> > + *     IEEE802154_FILTER_MODE_3_SCAN with MFR additional filter on:
> > + *

should be IEEE802154_FILTER_MODE_2. Maybe we can also get some better
names for that but the standard describes it with numbers as well.

> > + *     - No reserved value in frame type
> > + *     - No reserved value in frame version
> > + *     - Match mib.PanId or broadcast
> > + *     - Destination address field:
> > + *       - Match mib.ShortAddress or broadcast
> > + *       - Match mib.ExtendedAddress or GroupRxMode is true
> > + *       - ImplicitBroadcast is true and destination address field/destination
> > + *         panid is not included.
> > + *       - Device is coordinator only source address present in data
> > + *         frame/command frame and source panid matches mib.PanId
> > + *       - Device is coordinator only source address present in multipurpose
> > + *         frame and destination panid matches macPanId
> > + *     - Beacon frames source panid matches mib.PanId. If mib.PanId is
> > + *       broadcast it should always be accepted.
>
> This is a bit counter intuitive, but do we agree on the fact that the
> higher level of filtering should refer to promiscuous = false?
>

Yes, it's a lot of filter rules at this level.
Yes, promiscuous is false in this case. That is what currently what
wpan "node" interface should filter at mac802154 [1] (for cases device
coordinator is false).

I might mention a lot of future work here. I think we can live for now
to make a difference between those levels and be sure that we drop
everything else in the scan operation (inclusive check fcs in
software). Moving stuff that we can do in hardware to hardware and the
rest in software is a bigger task here...

- Alex

[0] https://elixir.bootlin.com/linux/v5.16-rc8/source/net/mac802154/rx.c#L294
[1] https://elixir.bootlin.com/linux/v5.16-rc8/source/net/mac802154/rx.c#L132
