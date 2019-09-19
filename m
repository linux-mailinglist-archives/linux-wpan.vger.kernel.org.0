Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC4EB7975
	for <lists+linux-wpan@lfdr.de>; Thu, 19 Sep 2019 14:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbfISMcD (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 19 Sep 2019 08:32:03 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:36730 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731891AbfISMcD (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 19 Sep 2019 08:32:03 -0400
Received: by mail-io1-f70.google.com with SMTP id g126so4990266iof.3
        for <linux-wpan@vger.kernel.org>; Thu, 19 Sep 2019 05:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=xRvATBd4vJz/ca0H8KHxwpk25gX5YP7T2VKX90zZjjY=;
        b=r4b8huv0jEczurkyLMP2dEIWwr4KitU+5bMwtONGI4fniRbJJMjJwlm/4IjG67MGsh
         CuJDNZmw3H9K4Or3GlL+4wjRMY7gZJ1Eg5B8bR5pWmyM5xVKldxOLCI6G7EbtC336n2B
         SKADwig8I37U+uh9EySS79969Sj4KhBZ8CyGEVR34Nu1zhwOfG9g5Fmfq0lqyuFR5IZf
         pC1Z+ThrpNRg+SuqHDGqwhQwbZISra4AEx2poq+ZBEuCXgNB8H4+Tn67jTzCftCw78bY
         ETJUt6ctRNrAfgy46bjTGmK7/odoPWMm8xYh43W5k4RTmD4x9yuinGGwFDvcCWeZD0S5
         RJ+w==
X-Gm-Message-State: APjAAAXXx+EHVGGzuLEUEcUsLILz/ElHmSCEHdgj0PZunE4ZtgRFo9dI
        o+lOefEap2vR2KctoTI/bRvZuLEiY5TgkF9HhW3mMEd22v7W
X-Google-Smtp-Source: APXvYqznsY295KYp6iVKDsqG6sE+Z6Mre4W0acF8SRnsbhhSSg0DoispESLcXcx0yTSMXL8rH7pjSRc8Sz/uxP6+Ti76M+HxxP4c
MIME-Version: 1.0
X-Received: by 2002:a6b:b8c3:: with SMTP id i186mr12174261iof.194.1568896320918;
 Thu, 19 Sep 2019 05:32:00 -0700 (PDT)
Date:   Thu, 19 Sep 2019 05:32:00 -0700
In-Reply-To: <20190919121234.30620-1-johan@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e5e3c40592e723c4@google.com>
Subject: Re: KASAN: use-after-free Read in atusb_disconnect
From:   syzbot <syzbot+f4509a9138a1472e7e80@syzkaller.appspotmail.com>
To:     alex.aring@gmail.com, andreyknvl@google.com, davem@davemloft.net,
        johan@kernel.org, linux-kernel@vger.kernel.org,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        stable@vger.kernel.org, stefan@datenfreihafen.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+f4509a9138a1472e7e80@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=f4509a9138a1472e7e80
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10f3ebb5600000

Note: testing is done by a robot and is best-effort only.
