Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8EF9E8A43
	for <lists+linux-wpan@lfdr.de>; Tue, 29 Oct 2019 15:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388294AbfJ2OJC (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 29 Oct 2019 10:09:02 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:45190 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388595AbfJ2OJC (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 29 Oct 2019 10:09:02 -0400
Received: by mail-il1-f199.google.com with SMTP id n84so7094708ila.12
        for <linux-wpan@vger.kernel.org>; Tue, 29 Oct 2019 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ZXDP0wwnNkRnGcZ/hxzyUBVhVAKO5MP3N/7b/HrN89M=;
        b=CjKymLdb9IM/UI0ZDB8/gBPOGKkWNal41FYQbKgwZmWQPhggNyEHA7ku8cx1KKgXgR
         /71G7Plxzs5zOwIayO+ioQN5tYs6tFoAZ/Kvb/nV6I+WJwirGG2vvFg1K64eRHumg9zv
         gH9fcaMK3fOkq6+nwII+gDY8zsGOxk6X/R9qPgncEG4r0vWu6QVm9eH1/kJTA+yqnBHN
         UDkBsjeyDqBePcEw/K0QkFou5PtLsBlxZyIe+yOveEOXw27b16II9B2C1FUCUhQYtUNC
         xTVqSWsgJP+JZxwbvZ8yazRjb7Gu7MA6nUsvQ129/PF9244tVWc8MD2mucTngqoyQigc
         AXRg==
X-Gm-Message-State: APjAAAVuaBKFimqQnRxagLPtXPb6tL3qE492zse2Dh8LVwjYEFk7Wb13
        Ai1w10S3pPGNNrFHhYN6zkMiEkE3ZmWlU3cpjZpqPYKFuZuw
X-Google-Smtp-Source: APXvYqyEO6WTdX2TT1MAC5wh+aMxnQAZiQ9NAP9Ue+ASML0EMHR89Lk5xJp5JZTyc5Ij4tXWW9iYcXeag4DdS0UpQCxA/Rt7L8JZ
MIME-Version: 1.0
X-Received: by 2002:a92:8394:: with SMTP id p20mr28056667ilk.73.1572358141217;
 Tue, 29 Oct 2019 07:09:01 -0700 (PDT)
Date:   Tue, 29 Oct 2019 07:09:01 -0700
In-Reply-To: <0000000000009ea5720595dc03a3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007792ff05960d289d@google.com>
Subject: Re: BUG: MAX_LOCKDEP_KEYS too low!
From:   syzbot <syzbot+692f39f040c1f415567b@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        aroulin@cumulusnetworks.com, ast@domdv.de,
        b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org,
        cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net,
        dcaratti@redhat.com, dsa@cumulusnetworks.com, edumazet@google.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, gvaradar@cisco.com, haiyangz@microsoft.com,
        idosch@mellanox.com, info@metux.net, ivan.khoronzhuk@linaro.org,
        j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us,
        johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.hurley@netronome.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, lariel@mellanox.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

syzbot has bisected this bug to:

commit ab92d68fc22f9afab480153bd82a20f6e2533769
Author: Taehee Yoo <ap420073@gmail.com>
Date:   Mon Oct 21 18:47:51 2019 +0000

     net: core: add generic lockdep keys

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e05224e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11e05224e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16e05224e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid=692f39f040c1f415567b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10be9ed0e00000

Reported-by: syzbot+692f39f040c1f415567b@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
