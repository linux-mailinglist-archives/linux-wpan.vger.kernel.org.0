Return-Path: <linux-wpan+bounces-686-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C630AB54F3
	for <lists+linux-wpan@lfdr.de>; Tue, 13 May 2025 14:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B3A53A4FA1
	for <lists+linux-wpan@lfdr.de>; Tue, 13 May 2025 12:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E0B28FA89;
	Tue, 13 May 2025 12:36:30 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9681128F95F
	for <linux-wpan@vger.kernel.org>; Tue, 13 May 2025 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139790; cv=none; b=oHJlJX5GNZ95yNHPhpCyQdEzP5eScsb8Pn46eB+mNvP7X6vwwdZhPL4hOARWneTiOoesOrAacGt4ERQ2ZC3DNzBdtjfZE8Pg65ZXu4YtoeFZVcKWCJOlXxnO7LlUtXp1y9bAK1X72CNpfUFuJgm94ssx5SYtSeUnKtpGGh+fwqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139790; c=relaxed/simple;
	bh=2Hp279qOKoUwK53A0IlWl9Z6A9oGh6aPql8Id7/C4ec=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NeGwoOPnkvroi7v0znDlWoOQCW1qPsD6tfgUirRegYD1CRejyFetgZB8gLjZ4TgRkhvVbBg8fNNz5hwXroXYJbgHWEt+uAtn6DrKPrRfkyZ2OuVqAp6Pd2MZ9pBW7ha7vwtNhGBHNLwF0p3Bb1pi7/7Py9bwzQfW5lRVxsoeDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3db6dc76193so1484575ab.2
        for <linux-wpan@vger.kernel.org>; Tue, 13 May 2025 05:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747139788; x=1747744588;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYgHQ98etugRn9nrFF/Y396tZ8D+/Ig7ihfcqGgA2as=;
        b=qwipq282be2yJ/TXFVGbv+Tw2q/ltain7spffDHiK9Fwfz6gD3lvawAOPQLKOsbKCe
         nCIMECx9VDodTKkuGoze2OWdZO4+ylhHzvvSvO8fXuwYC/ZL9u7/zkVPfCC5t9wZsVJa
         IDs6fMdqCte8wc7jN3wZ9pEZE69uF3GBL/utlUVb1G9248E5aXI7/IjN0asTonodeDoF
         aYekFdAtM4/8gNaCTDwsQf2knwFbmnS3aOYhoPa5f7WuVq7V2kvVKL6KswiyxW/d8zjf
         bRhs4CEQt+JXwQ5qXCbJgpGteYH4pMKsMJzOcRIddmwxK3qOk4U10ryy6zTGhtqtJ1ZR
         j1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUsoTJxSqWKF8Olrft4PNIbH70ETuQYZ4vP11LUwa4heFgjFUv4Yv1KL5EAshRnP2MVH0DcQObpMKr+@vger.kernel.org
X-Gm-Message-State: AOJu0YzFL+fZJ8qz2Bp9qzn/HgYGQTNtmkltYdSMQrLH4TMiZanShkFt
	U+E2JKaJuCeJmYs8LgeVXWL4GFpCyzmktEuBuIKTbmDAfAbSBS+jN8CSGdxK74FKq4ZmiNCX0Vz
	hfiMxHEm1DYlQ3VnC4YyLNa/HeMX2qetrzhonwzF11Qo5jseggRn0JG4=
X-Google-Smtp-Source: AGHT+IEKhD87ADuvIbZqF3IVuejXHxQwIrZ9v7DshXQN7uxn/CK9a/0SWGRW3VsRb8nou7/Bfipq9krzeFmYzST4ehdVQLjh7HaS
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:398f:b0:3d4:e6:d872 with SMTP id
 e9e14a558f8ab-3da7e1e3ab8mr192584185ab.9.1747139787612; Tue, 13 May 2025
 05:36:27 -0700 (PDT)
Date: Tue, 13 May 2025 05:36:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68233ccb.050a0220.f2294.09f8.GAE@google.com>
Subject: [syzbot] Monthly wpan report (May 2025)
From: syzbot <syzbot+list1679a20fcec2fc473afb@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 273     Yes   KMSAN: uninit-value in ieee802154_hdr_push (2)
                  https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
<2> 33      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<3> 13      Yes   KMSAN: kernel-infoleak in move_addr_to_user (7)
                  https://syzkaller.appspot.com/bug?extid=346474e3bf0b26bd3090

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

