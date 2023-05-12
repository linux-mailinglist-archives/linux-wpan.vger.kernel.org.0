Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706F2700AEE
	for <lists+linux-wpan@lfdr.de>; Fri, 12 May 2023 17:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241632AbjELPBL (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 12 May 2023 11:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241230AbjELPBJ (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 12 May 2023 11:01:09 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3CF3A97
        for <linux-wpan@vger.kernel.org>; Fri, 12 May 2023 08:00:50 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 151AA4000B;
        Fri, 12 May 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1683903648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=76T4lP/8qrM5ij4wOaQkiRGondwEahm0MyLqbhxWo+o=;
        b=NwJA146TmXvXIGuESu5gedxdAJBFWAxveX4DusCR4eNvH5vxoDBPAtZnPl9eAYIjbUgp6f
        wGU3NvH54UvU2Bl312zbM957doCVoIewA3KMW8uZ4lFuMRqIF+/XD1lPF+toUK49wJoWPy
        LLCGifVwRCFj1yqzXLmQ1ryG7+CFe/ekw2sA9BMVv1w1bWKL8jQsXVz2Ll6H+dchNCRABJ
        KwPBpOSS10KSWf/wjIWpCwEN7pPEG0q9BUr47A7gmh6BprcJXSNL9IvbHXl9a9b0Wl2GYi
        0ifdH5XVAyhrtOJMyMDTDbOd4NsU+N912DeSjXzJEgOOSi6z/0sobSo34KE/9g==
Date:   Fri, 12 May 2023 17:00:44 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <aahringo@redhat.com>
Cc:     linux-wpan - ML <linux-wpan@vger.kernel.org>,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: Re: ieee802154_hot_tx() and return value TX_BUSY/TX_OK
Message-ID: <20230512170044.15c2a272@xps-13>
In-Reply-To: <CAK-6q+j8T0WFX0XSFk+=7R4=LHOYLo87AN0bHFy=nZc8YkbQ+A@mail.gmail.com>
References: <CAK-6q+j8T0WFX0XSFk+=7R4=LHOYLo87AN0bHFy=nZc8YkbQ+A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello,

aahringo@redhat.com wrote on Wed, 12 Apr 2023 08:28:42 -0400:

> Hi,
>=20
> I am asking myself if we do the right return value in
> ieee802154_hot_tx(). Currently we transmit and stop the queue as we
> know the transceiver (currently only has one tx buffer (sometimes
> tx/rx is the same buffer)) is busy. As:
>=20
> ieee802154_hot_tx() - we transmit
> ieee802154_hold_queue()
> return NETDEV_TX_OK
>=20
> but I think or I have the feeling it should be run like this:
>=20
> ieee802154_hot_tx() - we transmit
> return NETDEV_TX_OK
> ieee802154_hot_tx() - we are busy
> ieee802154_hold_queue()
> return NETDEV_TX_BUSY
>=20
> The side effects are probably how the qdisc implementation handles the
> different return values. Some qdisc implementations are evaluating
> this and need to know that it hits hardware limitation... Some qdiscs
> don't evaluate this value.

I get what you mean regarding the return value despite my limited
knowledge about qdiscs. But I am wondering how we would be supposed to
return two values upon transmission. Is net/ providing an
infrastructure for the second time we need to do that?

> This is just a brainstorming here to find if what we do is currently
> correct or not correct... we can move this discussion to netdev to
> clarify this... or we figure it out by ourselves? Somehow it bothers
> me that there is an additional extra callback to detect it is busy and
> I can't believe this is not optimized yet.
>=20
> However we should keep that in mind that I think there is some
> clarification needed.
>=20
> btw: I also have some other things in my mind that currently could
> make problems in the qdisc handling related to 802.15.4 (and may with
> 6LoWPAN on top).

I have no idea how qdiscs policies are chosen, but are we supposed to
support all of them? Maybe all are not relevant to 802.15.4?

Thanks,
Miqu=C3=A8l
