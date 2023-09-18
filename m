Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DAC7A4BBC
	for <lists+linux-wpan@lfdr.de>; Mon, 18 Sep 2023 17:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236845AbjIRPVm (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 18 Sep 2023 11:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbjIRPVl (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 18 Sep 2023 11:21:41 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5820FCE8;
        Mon, 18 Sep 2023 08:18:06 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 988AD1BF210;
        Mon, 18 Sep 2023 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1695050285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qiGOD37imbNte3fXJU+s3bnG+Fbhu+81zISmYzDoyC4=;
        b=TAULgYdyOHaL1moXRCKQSLREGH1r4T7UEW7j4kalgUzom2Tl4MAE9RTIh7Pu18ve44ZBM/
        eQZRbBmrfiUCCJg4MpZDB33/QOZCH4H8FVOobg7cxGm0Rz7yvH5kgk+fy58abOTqgztGMn
        akLCYeylJqT0ZqZnM5HfmQL7nclL6Hv+ZyH/4lU4m/A14QUbYxrRn2VnvnhbTtnEezaXV1
        OSb8D8fTAmpXMxJz1T8CMkCzjEuO3qlOvHyURv5vOw76JHp+2DoVcXtjPuRTVzWfcA8c6a
        S121Z2bzgoqRA9V7AGGYqmBiXRjYh/TarlfV3WiBc3Ow8c72HAIz93jwqDz7pg==
Date:   Mon, 18 Sep 2023 17:18:01 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Guilhem Imberton <guilhem.imberton@qorvo.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH wpan-next v3 00/11] ieee802154: Associations between
 devices
Message-ID: <20230918171801.42af9b5a@xps-13>
In-Reply-To: <20230918150809.275058-1-miquel.raynal@bootlin.com>
References: <20230918150809.275058-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org


miquel.raynal@bootlin.com wrote on Mon, 18 Sep 2023 17:07:58 +0200:

> Hello,
>=20
> [I know we are in the middle of the merge window, I don't think it
> matters on the wpan side, so as the wpan subsystem did not evolve
> much since the previous merge window I figured I would not delay the
> sending of this series given the fact that I should have send it at the
> beginning of the summer...]

Of course this is outdated, but the following still stands :)

Cheers,
Miqu=C3=A8l

> Now that we can discover our peer coordinators or make ourselves
> dynamically discoverable, we may use the information about surrounding
> devices to create PANs dynamically. This involves of course:
> * Requesting an association to a coordinator, waiting for the response
> * Sending a disassociation notification to a coordinator
> * Receiving an association request when we are coordinator, answering
>   the request (for now all devices are accepted up to a limit, to be
>   refined)
> * Sending a disassociation notification to a child
> * Users may request the list of associated devices (the parent and the
>   children).
>=20
> Here are a few example of userspace calls that can be made:
> iwpan dev <dev> associate pan_id 2 coord $COORD
> iwpan dev <dev> list_associations
> iwpan dev <dev> disassociate ext_addr $COORD
>=20
> I used a small using hwsim to scan for a coordinator, associate with
> it, look at the associations on both sides, disassociate from it and
> check the associations again:
> ./assoc-demo
> *** Scan ***
> PAN 0x0002 (on wpan1)
> 	coordinator 0x060f3b35169a498f
> 	page 0
> 	channel 13
> 	preamble code 0
> 	mean prf 0
> 	superframe spec. 0xcf11
> 	LQI ff
> *** End of scan ***
> Associating wpan1 with coord0 0x060f3b35169a498f...
> Dumping coord0 assoc:
> child : 0x0b6f / 0xba7633ae47ccfb21
> Dumping wpan1 assoc:
> parent: 0xffff / 0x060f3b35169a498f
> Disassociating from wpan1
> Dumping coord0 assoc:
> Dumping wpan1 assoc:
>=20
> I could also successfully interact with a smaller device running Zephir,
> using its command line interface to associate and then disassociate from
> the Linux coordinator.
>=20
> Thanks!
> Miqu=C3=A8l
>=20
> Changes in v3:
> * Clarify a helper which compares if two devices seem to be identical by
>   adding two comments. This is a static function that is only used by
>   the PAN management core to operate or not an
>   association/disassociation request. In this helper, a new check is
>   introduced to be sure we compare fields which have been populated.
> * Dropped the "association_generation" counter and all its uses along
>   the code. I tried to mimic some other counter but I agree it is not
>   super useful and could be dropped anyway.
> * Dropped a faulty sequence number hardcoded to 10. This had no impact
>   because a few lines later the same entry was set to a valid value.
>=20
> Changes in v2:
> * Drop the misleading IEEE802154_ADDR_LONG_BROADCAST definition and its
>   only use which was useless anyway.
> * Clarified how devices are defined when the user requests to associate
>   with a coordinator: for now only the extended address of the
>   coordinator is relevant so this is the only address we care about.
> * Drop a useless NULL check before a kfree() call.
> * Add a check when allocating a child short address: it must be
>   different than ours.
> * Rebased on top of v6.5.
>=20
> Miquel Raynal (11):
>   ieee802154: Let PAN IDs be reset
>   ieee802154: Internal PAN management
>   ieee802154: Add support for user association requests
>   mac802154: Handle associating
>   ieee802154: Add support for user disassociation requests
>   mac802154: Handle disassociations
>   mac802154: Handle association requests from peers
>   ieee802154: Add support for limiting the number of associated devices
>   mac802154: Follow the number of associated devices
>   mac802154: Handle disassociation notifications from peers
>   ieee802154: Give the user the association list
>=20
>  include/net/cfg802154.h         |  69 ++++++
>  include/net/ieee802154_netdev.h |  60 +++++
>  include/net/nl802154.h          |  22 +-
>  net/ieee802154/Makefile         |   2 +-
>  net/ieee802154/core.c           |  24 ++
>  net/ieee802154/nl802154.c       | 223 +++++++++++++++++-
>  net/ieee802154/pan.c            | 115 +++++++++
>  net/ieee802154/rdev-ops.h       |  30 +++
>  net/ieee802154/trace.h          |  38 +++
>  net/mac802154/cfg.c             | 170 ++++++++++++++
>  net/mac802154/ieee802154_i.h    |  27 +++
>  net/mac802154/main.c            |   2 +
>  net/mac802154/rx.c              |  25 ++
>  net/mac802154/scan.c            | 397 ++++++++++++++++++++++++++++++++
>  14 files changed, 1191 insertions(+), 13 deletions(-)
>  create mode 100644 net/ieee802154/pan.c
>=20

