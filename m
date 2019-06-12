Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03EFD42CF9
	for <lists+linux-wpan@lfdr.de>; Wed, 12 Jun 2019 19:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438291AbfFLRHk (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 12 Jun 2019 13:07:40 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:43776 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438289AbfFLRHk (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Jun 2019 13:07:40 -0400
Received: by mail-lj1-f169.google.com with SMTP id 16so15742672ljv.10
        for <linux-wpan@vger.kernel.org>; Wed, 12 Jun 2019 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jcS0Qzs1exN//W5rDxeyjQ3VB2kIb3SGLNiO1+mI4c=;
        b=Hg50MUoDuUNOtnpsPo4QQ4K5hrIXscfTo6yAQYf4oebRsM2lKXXvJtDy/X08YbPtby
         c+w8ui7Y1/oEqSqJXUOn5y/vKVYO0UlWOynIUz/TLBuGxETgplDhy8zohKZDz2HIRJld
         P7wRdpIQoPagk7zsN5cGKXZv6zS8R/xU6LXd6K1u5BWpm6So15I2lAB5x4KqA2uZSn2I
         722xhsHD/MLp/qz2MOV3sjuzHakfUNq6Jv+0QfPH2QnApWUIpoR3OHieSk1jMy8MOk7Z
         uh/E3P1vw68D9GnQ5iqytG7jwGjDjJGhh4QQV60V3lR6HOK8CT3yklBHx/cvLkCY4txL
         SNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jcS0Qzs1exN//W5rDxeyjQ3VB2kIb3SGLNiO1+mI4c=;
        b=llGwQH/nQXiIBcd4XHk4b0pjCAB5x/LPux6iJJ9XFur7I/j7l7lYWPpkW2EUpivcdg
         vW55C1bR0UK0WIHdYvlmtUkZBBhx2nc6q4tMd9GAJyJ92lg2DlCGIvPU7LWIF1Vt3XDn
         OO8oRrN/mh8CUI8DEaYJqg36qETkn8sN/ejZLfXbdQPGrLzWAk5ZZ2hVWoxZ4bfIKVho
         VR68T4cyzgKpfCNWcOKJjiWEOLoyoEfsdRB7JSql7soo40HwOn5CQpBdIMaKLn948gOK
         vphke/k4/3AxHQDa5nP10KlYfAgq/mBWLusKuUYPx83xDGrrohEbMmKjnvXWVTCtaLrl
         MdzQ==
X-Gm-Message-State: APjAAAW6GmvJyXjbIrMIqiFRajKQa0Hn0FdAw1Mir3Nvldzr6mzN8vrD
        2uV0qr9SifC3FzlUgnHwEhFuZjl3wC/u+HPasyq5q83Vwo8=
X-Google-Smtp-Source: APXvYqxvt0OCCVpf5N0wcJB2u7v7v/nwIjOJykm7bQueVu2tHI84tGaq83keJU7+PA39MlWi0m1qI3gU5Bw0Xh8/8Aw=
X-Received: by 2002:a2e:12dc:: with SMTP id 89mr21004022ljs.40.1560359257831;
 Wed, 12 Jun 2019 10:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
 <20190612141016.owy6csdatcugsgak@x220t>
In-Reply-To: <20190612141016.owy6csdatcugsgak@x220t>
From:   Ramon Fontes <ramonreisfontes@gmail.com>
Date:   Wed, 12 Jun 2019 14:07:26 -0300
Message-ID: <CAK8U23ZW+4MXkTcmzR9VV=Kw__wfEoXqvphEbH7ZPSe7rGH2Gw@mail.gmail.com>
Subject: Re: Simulating 6lowpan with mac802154_hwsim
To:     Alexander Aring <aring@mojatatu.com>
Cc:     linux-wpan@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

One node (e.g. node1) can be connected simultaneously to multiple
nodes  (e.g. node2 and node3) by using only one 6lowpan interface.
That said, which node (2 or 3) will node1 taking into account? They
can have different distances and only one interface in which we can
use TC. Please correct me if I'm wrong. In my mind, the same is true
for LQI.

This code (https://github.com/ramonfontes/mininet-iot/blob/master/examples/6LoWPan.py)
produce such scenario. You can also try 6lowpan.py -m for mobility
purposes.

On Wed, Jun 12, 2019 at 11:10 AM Alexander Aring <aring@mojatatu.com> wrote:
>
> On Thu, Jun 06, 2019 at 07:49:07PM -0300, Ramon Fontes wrote:
> > Hello all,
> >
> > I've been developed a wireless network emulator for IoT
> > (https://github.com/ramonfontes/mininet-iot) in which I'm using
> > mac802154_hwsim. Mininet-IoT extends Mininet-WiFi
> > (https://github.com/intrig-unicamp/mininet-wifi) by simulating WiFi
> > through mac80211_hwsim. Mininet-WiFi already supports 6lowpan with
> > fakelb and I moving everything to mac802154_hwsim. Since I'm using
> > iwpan with mac802154_hwsim and given the expertise of this community,
> > I was wondering whether there is any work in which simulate the data
> > rate based on the distance/rssi with 6lowpan. If the answer is no,
> > what would be the best way to do so? I was thinking of doing this with
> > TC, but TC wouldn't work well with multiple hops. Should I develop a
> > wmediumd-like simulator (https://github.com/bcopeland/wmediumd) for
> > mac802154_hwsim?
> >
>
> rssi as 802.15.4 LQI value can be set per hop in mac802154_hwsim netlink
> api. For delays/drops/etc. where is the problem using by TC netem?
>
> LQI value is *mostly dropped to garbage right now.
>
> It was on my list to try out netem with mac802154_hwsim but I didn't do
> it yet because I have no use case.
>
> - Alex
