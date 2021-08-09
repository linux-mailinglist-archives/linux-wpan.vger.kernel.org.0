Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1563E461C
	for <lists+linux-wpan@lfdr.de>; Mon,  9 Aug 2021 15:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbhHINHU (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 9 Aug 2021 09:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhHINHU (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 9 Aug 2021 09:07:20 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8228EC0613D3;
        Mon,  9 Aug 2021 06:06:59 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so11523114wmb.5;
        Mon, 09 Aug 2021 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wO6dIk6sGlvME4DHqwcRib7/pkX9nrtkj0EYpHUiXq4=;
        b=PUrP4YMs2FrwZ2oqOrctjZoc5IuOFRZv1QNtY4+W08mHVXThFvmfDTDRcD/80/VVSj
         4pIoBC3TNH33GDiLmjTls57nF+Lp7DYGIoIkZiBBfZIrfkxXbEvgHk97aMPnRSPRmbrX
         M97ccKZD8HC6j28wFtciO1L+IrwiHHwIW0/Gcf1CFEp8RHjOfD8Ho+qTWFqaNgfaWyx0
         EPQCke5wVyNT/Dt4/GdLiU0XobEJhBWHrtvBr6H+O0++81JhpgyeLs9NU7+QwFpDoK/+
         nJfxDwOD6792v8gZFYny6/zV6tDnn565Vk/VNBrnaQObJG+d/CKc6y7OCP84/POqTqQz
         1OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wO6dIk6sGlvME4DHqwcRib7/pkX9nrtkj0EYpHUiXq4=;
        b=b8scyQ6TdGcDSif04JSk4n4u2ELs20zeVT66GByGoVSlLOKk4hr3w0pfXzCc3WJ4xP
         OwC0G7C67oQ3q18I5s74dqElA8q8rvbqDnyCdhOdcKu0LDG4nZuKjEWQjFgONDBbIYWr
         v0OoVf1E0/JuCkP4Xae6q8xzW3YirojOnDVQDpNzzKOLbSiviK39/9bHPLvY5ZBYTEPh
         JAIRASgN8AwfWcHn28Ii5+TFroKqLv5KZcCCLDnJwWThp4OgUqvaiSNqzSBGk8z2z+UZ
         4LM3QVpcWGbW4VQ2/kjHXsvkDyjzTKG4PMtwMdchdPOXEpLV3RUS4tdnwrtG+PLA/1xm
         SpaQ==
X-Gm-Message-State: AOAM531Q5N7LIRGs3pyvO/UFnhEcqNXeacX+DR5dXBAR1BdmG8Z2ajb6
        3B2nGSlv9tgm/eKxAhQrIkskoA/npjqC8LiR9Xc=
X-Google-Smtp-Source: ABdhPJwdxOd8XX5QAtBl68Ukm/oAM/V33DwkuIW90B1rewPa2Mp+o4Duh7mjd1C+W8Qau3kjgVowk9K2Edoz+CQKWmw=
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr54395wmg.164.1628514418109;
 Mon, 09 Aug 2021 06:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210805075414.GA15796@DESKTOP> <20210805065022.574e0691@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210805065022.574e0691@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Alexander Aring <alex.aring@gmail.com>
Date:   Mon, 9 Aug 2021 09:06:46 -0400
Message-ID: <CAB_54W4DK3uo+q7vRC2Vzrs5BENq2L_ukkkewiSXMNaSBiTsEQ@mail.gmail.com>
Subject: Re: [PATCH net] net: Fix memory leak in ieee802154_raw_deliver
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Takeshi Misawa <jeliantsurux@gmail.com>,
        David Howells <dhowells@redhat.com>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Thu, 5 Aug 2021 at 09:50, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 5 Aug 2021 16:54:14 +0900 Takeshi Misawa wrote:
> > If IEEE-802.15.4-RAW is closed before receive skb, skb is leaked.
> > Fix this, by freeing sk_receive_queue in sk->sk_destruct().
> >
> > syzbot report:
> > BUG: memory leak
> > unreferenced object 0xffff88810f644600 (size 232):
> >   comm "softirq", pid 0, jiffies 4294967032 (age 81.270s)
> >   hex dump (first 32 bytes):
> >     10 7d 4b 12 81 88 ff ff 10 7d 4b 12 81 88 ff ff  .}K......}K.....
> >     00 00 00 00 00 00 00 00 40 7c 4b 12 81 88 ff ff  ........@|K.....
> >   backtrace:
> >     [<ffffffff83651d4a>] skb_clone+0xaa/0x2b0 net/core/skbuff.c:1496
> >     [<ffffffff83fe1b80>] ieee802154_raw_deliver net/ieee802154/socket.c:369 [inline]
> >     [<ffffffff83fe1b80>] ieee802154_rcv+0x100/0x340 net/ieee802154/socket.c:1070
> >     [<ffffffff8367cc7a>] __netif_receive_skb_one_core+0x6a/0xa0 net/core/dev.c:5384
> >     [<ffffffff8367cd07>] __netif_receive_skb+0x27/0xa0 net/core/dev.c:5498
> >     [<ffffffff8367cdd9>] netif_receive_skb_internal net/core/dev.c:5603 [inline]
> >     [<ffffffff8367cdd9>] netif_receive_skb+0x59/0x260 net/core/dev.c:5662
> >     [<ffffffff83fe6302>] ieee802154_deliver_skb net/mac802154/rx.c:29 [inline]
> >     [<ffffffff83fe6302>] ieee802154_subif_frame net/mac802154/rx.c:102 [inline]
> >     [<ffffffff83fe6302>] __ieee802154_rx_handle_packet net/mac802154/rx.c:212 [inline]
> >     [<ffffffff83fe6302>] ieee802154_rx+0x612/0x620 net/mac802154/rx.c:284
> >     [<ffffffff83fe59a6>] ieee802154_tasklet_handler+0x86/0xa0 net/mac802154/main.c:35
> >     [<ffffffff81232aab>] tasklet_action_common.constprop.0+0x5b/0x100 kernel/softirq.c:557
> >     [<ffffffff846000bf>] __do_softirq+0xbf/0x2ab kernel/softirq.c:345
> >     [<ffffffff81232f4c>] do_softirq kernel/softirq.c:248 [inline]
> >     [<ffffffff81232f4c>] do_softirq+0x5c/0x80 kernel/softirq.c:235
> >     [<ffffffff81232fc1>] __local_bh_enable_ip+0x51/0x60 kernel/softirq.c:198
> >     [<ffffffff8367a9a4>] local_bh_enable include/linux/bottom_half.h:32 [inline]
> >     [<ffffffff8367a9a4>] rcu_read_unlock_bh include/linux/rcupdate.h:745 [inline]
> >     [<ffffffff8367a9a4>] __dev_queue_xmit+0x7f4/0xf60 net/core/dev.c:4221
> >     [<ffffffff83fe2db4>] raw_sendmsg+0x1f4/0x2b0 net/ieee802154/socket.c:295
> >     [<ffffffff8363af16>] sock_sendmsg_nosec net/socket.c:654 [inline]
> >     [<ffffffff8363af16>] sock_sendmsg+0x56/0x80 net/socket.c:674
> >     [<ffffffff8363deec>] __sys_sendto+0x15c/0x200 net/socket.c:1977
> >     [<ffffffff8363dfb6>] __do_sys_sendto net/socket.c:1989 [inline]
> >     [<ffffffff8363dfb6>] __se_sys_sendto net/socket.c:1985 [inline]
> >     [<ffffffff8363dfb6>] __x64_sys_sendto+0x26/0x30 net/socket.c:1985
> >
> > Fixes: 9ec767160357 ("net: add IEEE 802.15.4 socket family implementation")
> > Reported-and-tested-by: syzbot+1f68113fa907bf0695a8@syzkaller.appspotmail.com
> > Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>

Acked-by: Alexander Aring <aahringo@redhat.com>

Tested with one of the c reproducers. Doesn't occur anymore. I see
other socket implementations e.g. af_can.c which do similar things.

Thank you so much for fixing this issue!

- Alex
