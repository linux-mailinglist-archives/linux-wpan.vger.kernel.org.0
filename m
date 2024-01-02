Return-Path: <linux-wpan+bounces-47-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42394821CF2
	for <lists+linux-wpan@lfdr.de>; Tue,  2 Jan 2024 14:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F4A71C204FB
	for <lists+linux-wpan@lfdr.de>; Tue,  2 Jan 2024 13:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E402BFBF0;
	Tue,  2 Jan 2024 13:42:31 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7DFBEF
	for <linux-wpan@vger.kernel.org>; Tue,  2 Jan 2024 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35fc6976630so111558765ab.0
        for <linux-wpan@vger.kernel.org>; Tue, 02 Jan 2024 05:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202949; x=1704807749;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQf4vuacvd9yifzeZtNC0Acc2lFbtoxn1Tig8dfG3Tk=;
        b=O3Hi+qUYaMPMD2L/GSSAli2L1FwgfjQDZ7UjyTcJp3gxYISLyDqQ2p6tavU0Kn1y0c
         PHVlTQKv9mdXDye2oDxdo3jtGMMkRBoL+139CB5wI3+eWJX1j7oYdxP009gGSiMfPwsx
         MuNtwMnT4vyLxQcj3/lKEJsaJUL/fHloc6GGyxGVW9bRghlVxtMAXbnRgrrcTqxB2+qX
         CbAWjaSuKPWFGySNJjo651QQ7QlzCPkSCF190Ay0n5rPj/ZyiCguN2bajpj5F7OwEvWX
         GioyN/mjDvohOR0TzG21ePEdI5TIdJt1TRvHc5M7KdqqHyBB8gRDBb+celAC2+uxzOnE
         WAzw==
X-Gm-Message-State: AOJu0YzuIfmgzfqcNW8zlFlx+Wtjfo1Q7F4fpkSdlDhQ1AvNr7U/I28H
	QyxtgpZPcz+tA7zdfVCVAlqf7Ieo7LwrJD85IkWG3U5nszEL
X-Google-Smtp-Source: AGHT+IHpfgO/iWwluzNRvkbtKAz3sm6zOo2s0906NPXXxwsLSCVxGF4/psRoxMHpL/alH0Ub82OEO1hlRj0GXbobHpiK0jqEZ/fH
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b24:b0:35f:f01e:bb1d with SMTP id
 e4-20020a056e020b2400b0035ff01ebb1dmr1816322ilu.5.1704202949655; Tue, 02 Jan
 2024 05:42:29 -0800 (PST)
Date: Tue, 02 Jan 2024 05:42:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000708723060df6ab96@google.com>
Subject: [syzbot] [wpan?] KMSAN: uninit-value in ieee802154_hdr_push (2)
From: syzbot <syzbot+60a66d44892b66b56545@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, 
	miquel.raynal@bootlin.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    610a9b8f49fb Linux 6.7-rc8
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1419f31ae80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e51fe20c3e51ba7f
dashboard link: https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12551029e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12595b95e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/28ecdd56de1e/disk-610a9b8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3c5afc17c174/vmlinux-610a9b8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/96ff79b2992d/bzImage-610a9b8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+60a66d44892b66b56545@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
BUG: KMSAN: uninit-value in ieee802154_hdr_push+0x971/0xb90 net/ieee802154/header_ops.c:108
 ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
 ieee802154_hdr_push+0x971/0xb90 net/ieee802154/header_ops.c:108
 ieee802154_header_create+0x9c0/0xc00 net/mac802154/iface.c:396
 wpan_dev_hard_header include/net/cfg802154.h:494 [inline]
 dgram_sendmsg+0xd1d/0x1500 net/ieee802154/socket.c:677
 ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg net/socket.c:745 [inline]
 ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2584
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
 __sys_sendmsg net/socket.c:2667 [inline]
 __do_sys_sendmsg net/socket.c:2676 [inline]
 __se_sys_sendmsg net/socket.c:2674 [inline]
 __x64_sys_sendmsg+0x307/0x490 net/socket.c:2674
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x44/0x110 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

Local variable hdr created at:
 ieee802154_header_create+0x4e/0xc00 net/mac802154/iface.c:360
 wpan_dev_hard_header include/net/cfg802154.h:494 [inline]
 dgram_sendmsg+0xd1d/0x1500 net/ieee802154/socket.c:677

CPU: 1 PID: 5009 Comm: syz-executor271 Not tainted 6.7.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

