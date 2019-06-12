Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62F142873
	for <lists+linux-wpan@lfdr.de>; Wed, 12 Jun 2019 16:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfFLOKX (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 12 Jun 2019 10:10:23 -0400
Received: from mail-it1-f180.google.com ([209.85.166.180]:51128 "EHLO
        mail-it1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbfFLOKX (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Jun 2019 10:10:23 -0400
Received: by mail-it1-f180.google.com with SMTP id j194so11018659ite.0
        for <linux-wpan@vger.kernel.org>; Wed, 12 Jun 2019 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sOk2O30hMTQUweve2UY5VyAoOc2wKgRzCMqLKzQtkx8=;
        b=ufgvOVGhSHZwynfb0daNMEuJLyder7ZE4PRCg/rGYPjeQZLXwhsNQnEhjrwTGxE6S7
         Z780iZrIyEFIVKO0uYAaLrEV3qFw1+4hoB65YyYMqfj87e12LJXB+NqPUGLH7i8+MC60
         YhqyYdJlEYYWnznOWBcm6psyVSHmyv4txw0v3eLyoGql8yT55i9XjmP4k/PoFExKTU7s
         gZaWeSrjtVUKeXQuleDr68Mq938tkCi2l5+cLkvn9y3oQvJ3aKxj6k8uSzwyO5BYCF9o
         gQA9G4fhWys2B4sNsQ5E8+jTN+uTmf9zfD7KidKcwp2dJYisUzc6zLo5Yvy0V2SpNzS7
         5DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sOk2O30hMTQUweve2UY5VyAoOc2wKgRzCMqLKzQtkx8=;
        b=Zvdl4vPoh58mB58P1EoVLBGj9OhJnn+EwhR1QZrm9KbzqnxRnu7QnTU9rPHB/fioqM
         dg3iXnIi+ifaFXZkpHcJMrZnCwGfXXSBkrDqowWDQEWwGmuwbN6cuamjNKlnpXMglC4e
         oYzGbplyumOeLHh+lJH4+Otx4PgPCNeSWnc3RqyZUy1W7PgTwRoq1L+gxuriD6RvAnJ6
         pVkibo4ekU+FabOcZoGeXYkV9a9UaUnXRqDxNzyfvTa8rAiFlUtbD3gTry1Hy29OF6xc
         O7+rtu706ZutncsHOmuS2pbnl6z40kTYkYwuPF004YWQTSDNPcwCS62l8s14G9+si68J
         G5kw==
X-Gm-Message-State: APjAAAXc3jW3pM33KqQhWBg9KnjHcGTZIIUXm28hzjJM5tFq0/8sUhKf
        8aNZ5M1pOU2mCJ7upMmydQNq4QGMm3U=
X-Google-Smtp-Source: APXvYqxVKnh0kU0eimEC2l/rREuKp0Qec7V6KnX9CSTCte562zaxX0V9PrdButOaGPpE1loahBWPog==
X-Received: by 2002:a24:6702:: with SMTP id u2mr14852465itc.10.1560348622463;
        Wed, 12 Jun 2019 07:10:22 -0700 (PDT)
Received: from x220t ([64.26.149.125])
        by smtp.gmail.com with ESMTPSA id y194sm44814itb.34.2019.06.12.07.10.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 07:10:22 -0700 (PDT)
Date:   Wed, 12 Jun 2019 10:10:16 -0400
From:   Alexander Aring <aring@mojatatu.com>
To:     Ramon Fontes <ramonreisfontes@gmail.com>
Cc:     linux-wpan@vger.kernel.org
Subject: Re: Simulating 6lowpan with mac802154_hwsim
Message-ID: <20190612141016.owy6csdatcugsgak@x220t>
References: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Thu, Jun 06, 2019 at 07:49:07PM -0300, Ramon Fontes wrote:
> Hello all,
> 
> I've been developed a wireless network emulator for IoT
> (https://github.com/ramonfontes/mininet-iot) in which I'm using
> mac802154_hwsim. Mininet-IoT extends Mininet-WiFi
> (https://github.com/intrig-unicamp/mininet-wifi) by simulating WiFi
> through mac80211_hwsim. Mininet-WiFi already supports 6lowpan with
> fakelb and I moving everything to mac802154_hwsim. Since I'm using
> iwpan with mac802154_hwsim and given the expertise of this community,
> I was wondering whether there is any work in which simulate the data
> rate based on the distance/rssi with 6lowpan. If the answer is no,
> what would be the best way to do so? I was thinking of doing this with
> TC, but TC wouldn't work well with multiple hops. Should I develop a
> wmediumd-like simulator (https://github.com/bcopeland/wmediumd) for
> mac802154_hwsim?
> 

rssi as 802.15.4 LQI value can be set per hop in mac802154_hwsim netlink
api. For delays/drops/etc. where is the problem using by TC netem?

LQI value is *mostly dropped to garbage right now.

It was on my list to try out netem with mac802154_hwsim but I didn't do
it yet because I have no use case.

- Alex
