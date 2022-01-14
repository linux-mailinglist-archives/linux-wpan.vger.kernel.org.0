Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5FD48F012
	for <lists+linux-wpan@lfdr.de>; Fri, 14 Jan 2022 19:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242795AbiANSoc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-wpan@lfdr.de>); Fri, 14 Jan 2022 13:44:32 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50923 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236181AbiANSob (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 14 Jan 2022 13:44:31 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E532FFF805;
        Fri, 14 Jan 2022 18:44:26 +0000 (UTC)
Date:   Fri, 14 Jan 2022 19:44:25 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>
Cc:     Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Harry Morris <h.morris@cascoda.com>,
        Varka Bhadram <varkabhadram@gmail.com>,
        Xue Liu <liuxuenetmail@gmail.com>, Alan Ott <alan@signal11.us>,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "linux-wireless@vger.kernel.org Wireless" 
        <linux-wireless@vger.kernel.org>
Subject: Re: [wpan-next v2 18/27] net: mac802154: Handle scan requests
Message-ID: <20220114194425.3df06391@xps13>
In-Reply-To: <CAB_54W4LdzH9=XS7-ZnxfyCMQFCTS-F5JkUmV+6HtWcCpUS-nQ@mail.gmail.com>
References: <20220112173312.764660-1-miquel.raynal@bootlin.com>
        <20220112173312.764660-19-miquel.raynal@bootlin.com>
        <CAB_54W4PL1ty5XsqRoEKwsy-h8KL9gSGMK6N=HiWJDp6NHsb0A@mail.gmail.com>
        <20220113180709.0dade123@xps13>
        <CAB_54W4LdzH9=XS7-ZnxfyCMQFCTS-F5JkUmV+6HtWcCpUS-nQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi Alexander,

alex.aring@gmail.com wrote on Thu, 13 Jan 2022 19:01:56 -0500:

> Hi,
> 
> On Thu, 13 Jan 2022 at 12:07, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > Hi Alexander,
> >
> > alex.aring@gmail.com wrote on Wed, 12 Jan 2022 17:44:02 -0500:
> >  
> > > Hi,
> > >
> > > On Wed, 12 Jan 2022 at 12:33, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > ...  
> > > > +       return 0;
> > > > +}
> > > > diff --git a/net/mac802154/tx.c b/net/mac802154/tx.c
> > > > index c829e4a75325..40656728c624 100644
> > > > --- a/net/mac802154/tx.c
> > > > +++ b/net/mac802154/tx.c
> > > > @@ -54,6 +54,9 @@ ieee802154_tx(struct ieee802154_local *local, struct sk_buff *skb)
> > > >         struct net_device *dev = skb->dev;
> > > >         int ret;
> > > >
> > > > +       if (unlikely(mac802154_scan_is_ongoing(local)))
> > > > +               return NETDEV_TX_BUSY;
> > > > +  
> > >
> > > Please look into the functions "ieee802154_wake_queue()" and
> > > "ieee802154_stop_queue()" which prevent this function from being
> > > called. Call stop before starting scanning and wake after scanning is
> > > done or stopped.  
> >
> > Mmmh all this is already done, isn't it?
> > - mac802154_trigger_scan_locked() stops the queue before setting the
> >   promiscuous mode
> > - mac802154_end_of_scan() wakes the queue after resetting the
> >   promiscuous mode to its original state
> >
> > Should I drop the check which stands for an extra precaution?
> >  
> 
> no, I think then it should be a WARN_ON() more without any return
> (hopefully it will survive). This case should never happen otherwise
> we have a bug that we wake the queue when we "took control about
> transmissions" only.
> Change the name, I think it will be in future not only scan related.
> Maybe "mac802154_queue_stopped()". Everything which is queued from
> socket/upperlayer(6lowpan) goes this way.

Got it.

I've changed the name of the helper, and used an atomic variable there
to follow the count. 

> > But overall I think I don't understand well this part. What is
> > a bit foggy to me is why the (async) tx implementation does:
> >
> > *Core*                           *Driver*
> >
> > stop_queue()
> > drv_async_xmit() -------
> >                         \------> do something
> >                          ------- calls ieee802154_xmit_complete()
> > wakeup_queue() <--------/
> >
> > So we actually disable the queue for transmitting. Why??
> >  
> 
> Because all transceivers have either _one_ transmit framebuffer or one
> framebuffer for transmit and receive one time. We need to report to
> stop giving us more skb's while we are busy with one to transmit.
> This all will/must be changed in future if there is hardware outside
> which is more powerful and the driver needs to control the flow here.
> 
> That ieee802154_xmit_complete() calls wakeup_queue need to be
> forbidden when we are in "synchronous transmit mode"/the queue is
> stopped. The synchronous transmit mode is not for any hotpath, it's
> for MLME and I think we also need a per phy lock to avoid multiple
> synchronous transmissions at one time. Please note that I don't think
> here only about scan operation, also for other possible MLME-ops.
> 

First, thank you very much for all your guidance and reviews, I think I
have a much clearer understanding now.

I've tried to follow your advices, creating:
- a way of tracking ongoing transmissions
- a synchronous API for MLME transfers

I've decided to use the wait_queue + atomic combo which looks nice.
Everything seems to work, I just need a bit of time to clean and rework
a bit the series before sending a v3.

Thanks,
Miquèl
