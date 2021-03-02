Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6529A32B024
	for <lists+linux-wpan@lfdr.de>; Wed,  3 Mar 2021 04:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352282AbhCCDcy (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 2 Mar 2021 22:32:54 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:51489 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838144AbhCBJ37 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 2 Mar 2021 04:29:59 -0500
Received: by mail-il1-f200.google.com with SMTP id y11so14103514ilc.18
        for <linux-wpan@vger.kernel.org>; Tue, 02 Mar 2021 01:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=mWrgSF6bXDt8oZKzNoVO6j2ZDCRfyqKvx81/QMegxVY=;
        b=tJfN/lq16VANOe++2shHHUlre3yYNw0Tz0wdl9+wPuzqaBfYku8OPdOdhoYGC23h5l
         BC8x3L5CtceLQs5mtzFeIbkbnjze3Wt7891ZjCq3/thYDVm0vNVYvvsj7UTgrS+Lgize
         XTQOcIIVdZa3/4SK+pt3LZwdspGcQDziHrhl1YF3TtVZmSpCRqgOksPJTR229NVlIQvi
         g9vMPle1mLjhrbAUEVTFYWGTVqyl62jRRzrs5HenRyhJdF4k+tmDhIuSRRS5QMAA+rfY
         bdLZOwDcn9X0UUope02sh/ivtjtUFLMvF899ECoOXQADpyZ67f8QkkQCOVc9SYwv1onc
         mD1Q==
X-Gm-Message-State: AOAM532uq8UO4j77uI1W8umMFRhyLMi04NGbnzT6L8eiyg1n2ukxL5yV
        F1CHVn1S7DxaWlYKcxfgE2OOFYzuoAlpHj4a57G0VzTcVBVM
X-Google-Smtp-Source: ABdhPJzYRtugQNJwsfcvLS+hVKsgyEYDJW1KKRISaXRdJRbOrHfk6pYCMLv0Os1pprF2odVOB6j7luJaC0meF1O3pydUvjmKoHoJ
MIME-Version: 1.0
X-Received: by 2002:a02:a606:: with SMTP id c6mr10241993jam.108.1614677357837;
 Tue, 02 Mar 2021 01:29:17 -0800 (PST)
Date:   Tue, 02 Mar 2021 01:29:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000057420705bc8a5eeb@google.com>
Subject: KMSAN: uninit-value in ieee802154_hdr_push
From:   syzbot <syzbot+4f6e279a71100e94ae65@syzkaller.appspotmail.com>
To:     alex.aring@gmail.com, davem@davemloft.net, glider@google.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=1756eff2d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8e3b38ca92283e
dashboard link: https://syzkaller.appspot.com/bug?extid=4f6e279a71100e94ae65
compiler:       Debian clang version 11.0.1-2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4f6e279a71100e94ae65@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
BUG: KMSAN: uninit-value in ieee802154_hdr_push+0xd68/0xdd0 net/ieee802154/header_ops.c:108
CPU: 1 PID: 15015 Comm: syz-executor.3 Not tainted 5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
 ieee802154_hdr_push+0xd68/0xdd0 net/ieee802154/header_ops.c:108
 ieee802154_header_create+0xd07/0x1070 net/mac802154/iface.c:404
 wpan_dev_hard_header include/net/cfg802154.h:374 [inline]
 dgram_sendmsg+0xf48/0x15c0 net/ieee802154/socket.c:670
 ieee802154_sock_sendmsg+0xec/0x130 net/ieee802154/socket.c:97
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0xcfc/0x12f0 net/socket.c:2345
 ___sys_sendmsg net/socket.c:2399 [inline]
 __sys_sendmsg+0x714/0x830 net/socket.c:2432
 __compat_sys_sendmsg net/compat.c:347 [inline]
 __do_compat_sys_sendmsg net/compat.c:354 [inline]
 __se_compat_sys_sendmsg+0xa7/0xc0 net/compat.c:351
 __ia32_compat_sys_sendmsg+0x4a/0x70 net/compat.c:351
 do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f65549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000f555f5fc EFLAGS: 00000296 ORIG_RAX: 0000000000000172
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00000000200003c0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Local variable ----hdr@ieee802154_header_create created at:
 ieee802154_header_create+0xc9/0x1070 net/mac802154/iface.c:368
 ieee802154_header_create+0xc9/0x1070 net/mac802154/iface.c:368
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
