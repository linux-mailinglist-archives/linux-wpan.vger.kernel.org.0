Return-Path: <linux-wpan+bounces-65-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 491CF82D359
	for <lists+linux-wpan@lfdr.de>; Mon, 15 Jan 2024 04:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD86E1C20D66
	for <lists+linux-wpan@lfdr.de>; Mon, 15 Jan 2024 03:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79CE20E6;
	Mon, 15 Jan 2024 03:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THKP8QGL"
X-Original-To: linux-wpan@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1862F25
	for <linux-wpan@vger.kernel.org>; Mon, 15 Jan 2024 03:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705289550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALGKSPiwx3An9TAdIFkfIrrz7nokmTgvsAQvBw77JOo=;
	b=THKP8QGL0pde3TkyloPP2OLTpE74SUC8TRS2D//YogyvxSRRuLftbK06rLsZ6YqeJCVhYm
	YgeYca+XmkyFdLjsR2YhyB5QcUmAvBJfnji5sEiMLkrPu/rCJuCy8FVmmGyTqBs8xKu0tG
	ILQoaVNQF7SgbpjsLbUjUO/rnTB8S4M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-cLnBMV8SPqGDNP6ftdJ52g-1; Sun, 14 Jan 2024 22:32:26 -0500
X-MC-Unique: cLnBMV8SPqGDNP6ftdJ52g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-559391de41bso349387a12.3
        for <linux-wpan@vger.kernel.org>; Sun, 14 Jan 2024 19:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705289545; x=1705894345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALGKSPiwx3An9TAdIFkfIrrz7nokmTgvsAQvBw77JOo=;
        b=iTkN1a1pEjvzftSt9SRWPuFQH/tV7eSK9jWH/hCUv/mrC149ytY4jQw9NPaKbMVM/R
         xriBhbm2Z/jSJmiR0ZlkqZ/wm8wrDCtuvYjPTseL18itpHrlWmoOkB1XvAi52tTYtHWp
         Ej1FhBmfo12US46B48nDgE730MctSCHuGRGJzdXPOtNZYRuFq5RV5dS1FhC63dKOhApb
         ShLSGClT9ZmlspP92xpuO1I3FrnI7sz2Rl6LEgyqkyf+AUUXyL7t4IuZXXMTboQn3+Gh
         vEib1Y4wTOBpbCxDhCLgY0kbiso50yIyf3q805YQta6wPZEN/5c/27tev1calEm9QMV2
         w8xA==
X-Gm-Message-State: AOJu0Yx52uDhxrHxiDorpVyH055Ks4h2Ax//Uns0ONKZkEa8SfVfTkFY
	Qh7285OE4w05LsEfe2r9rRa1X27lIa4meLTgMBqI8B8+onJf9piAIEuyh/v8ZRrr8NbeWj+hc0w
	8GIDHQKmY6FthLa1m6xwXC46swORAGL2KOK+iCL7a2Cjlqg==
X-Received: by 2002:a05:6402:7d6:b0:54c:53a6:c49 with SMTP id u22-20020a05640207d600b0054c53a60c49mr2264876edy.16.1705289545528;
        Sun, 14 Jan 2024 19:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6FEcu/eqN6EciGwY3Xi/+yiC9iJ0IP/VEBccXfAT7g+8JuhgBlkGZMNRxn1ZIhtTf5vJmzjqW8TWcXwocLKs=
X-Received: by 2002:a05:6402:7d6:b0:54c:53a6:c49 with SMTP id
 u22-20020a05640207d600b0054c53a60c49mr2264870edy.16.1705289545205; Sun, 14
 Jan 2024 19:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK-6q+jsZ13Cs9iuk_WjFeYFCEnnj-dJ9QYkWaw4fh6Gi=JtHA@mail.gmail.com>
 <20240112131554.10352-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240112131554.10352-1-n.zhandarovich@fintech.ru>
From: Alexander Aring <aahringo@redhat.com>
Date: Sun, 14 Jan 2024 22:32:13 -0500
Message-ID: <CAK-6q+gcs2djQfKRsuGpD7WERmbLhzjkHEm80MRe+2UE3bteKw@mail.gmail.com>
Subject: Re: [PATCH RESEND] mac802154: Fix uninit-value access in ieee802154_hdr_push_sechdr
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Zhang Shurong <zhang_shurong@foxmail.com>, alex.aring@gmail.com, 
	stefan@datenfreihafen.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	harperchen1110@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 12, 2024 at 8:16=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> >> > >
> >> > > BUG: KMSAN: uninit-value in ieee802154_hdr_push_sechdr net/ieee802=
154=3D
> > /header_ops.c:54 [inline]
> >> > > BUG: KMSAN: uninit-value in ieee802154_hdr_push+0x971/0xb90 net/ie=
ee8=3D
> > 02154/header_ops.c:108
> >> > >  ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline=
]
> >> > >  ieee802154_hdr_push+0x971/0xb90 net/ieee802154/header_ops.c:108
> >> > >  ieee802154_header_create+0x9c0/0xc00 net/mac802154/iface.c:396
> >> > >  wpan_dev_hard_header include/net/cfg802154.h:494 [inline]
> >> > >  dgram_sendmsg+0xd1d/0x1500 net/ieee802154/socket.c:677
> >> > >  ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
> >> > >  sock_sendmsg_nosec net/socket.c:725 [inline]
> >> > >  sock_sendmsg net/socket.c:748 [inline]
> >> > >  ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2494
> >> > >  ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2548
> >> > >  __sys_sendmsg+0x225/0x3c0 net/socket.c:2577
> >> > >  __compat_sys_sendmsg net/compat.c:346 [inline]
> >> > >  __do_compat_sys_sendmsg net/compat.c:353 [inline]
> >> > >  __se_compat_sys_sendmsg net/compat.c:350 [inline]
> >> > >
> >> > > We found hdr->key_id_mode is uninitialized in mac802154_set_header=
_se=3D
> > curity()
> >> > > which indicates hdr.fc.security_enabled should be 0. However, it i=
s s=3D
> > et to be cb->secen before.
> >> > > Later, ieee802154_hdr_push_sechdr is invoked, causing KMSAN compla=
ins=3D
> >  uninit-value issue.
> >> >
> >> > I am not too deeply involved in the security header but for me it fe=
els
> >> > like your patch does the opposite of what's needed. We should maybe
> >> > initialize hdr->key_id_mode based on the value in cb->secen, no? (ma=
ybe
> >> > Alexander will have a better understanding than I have).
> >>
> >> I can't help yet with a better answer why syzkaller reports it but it
> >> will break things as we using skb->cb to pass additional parameters
> >> through header_ops->create()... in this case it is some sockopts of
> >> af802154, I guess.
> >>
> >
> > Maybe we just need to init some "more" defaults in [0]
> >
> > - Alex
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree=3D
> > /net/ieee802154/socket.c?h=3D3Dv6.7-rc5#n474
>
> Hello,
>
> I was looking into the same issue (now present in syzbot [1]) and since i=
t has a
> C-repro, the error is easy to recreate. Apparently, despite cb->secen (an=
d
> hdr.fc.security_enabled accordingly) being equal 1, mac802154_set_header_=
security()
> finishes with 0 in:
>
>         if (!params.enabled ||
>             (cb->secen_override && !cb->secen) ||
>             !params.out_level)
>             return 0;
>
> Not presuming to understand the issue fully but if we do end up leaving
> mac802154_set_header_security() early, should we init hdr->key_id_mode
> with IEEE802154_SCF_KEY_IMPLICIT before returning with 0?
> I imagine that reseting hdr.fc.security_enabled to 0 ourselves in this
> case is a wrong way to go too.
>

I think here are two problems:

1.
When (in any way) secen path is hit then we should make sure some
other security parameters are set, if not return with an error. This
needs to be done somewhere in the 802.15.4 socket code. [0]

2.
The "secen path" itself in the socket code need to have defaults to be
disabled. [1]

> [1] https://syzkaller.appspot.com/bug?extid=3D60a66d44892b66b56545
>

Well we can test now but I think this is a check for the 1. case only.

> Hoping not to have spewed too much nonsense here...
>

I hope my words make sense here, too. :-)

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/net/ieee802154/socket.c#n669
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/net/ieee802154/socket.c#n474


