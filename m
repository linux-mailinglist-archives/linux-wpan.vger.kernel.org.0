Return-Path: <linux-wpan+bounces-763-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3BB7C8A5
	for <lists+linux-wpan@lfdr.de>; Wed, 17 Sep 2025 14:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B994B3B0698
	for <lists+linux-wpan@lfdr.de>; Wed, 17 Sep 2025 08:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4588E309EE0;
	Wed, 17 Sep 2025 08:29:28 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C3309DA8
	for <linux-wpan@vger.kernel.org>; Wed, 17 Sep 2025 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097768; cv=none; b=oOqdqOq9pd3ma0gn3T2y7l5Opoxiu/aOcDMSlq6A4AVER6MQQpUz+ikzT6/XJxOi06YV3IU/TLjM+5ttoCtHcu67fD1lbw0UmLfNjXGkRf1RmFb1SaPmPP0TgNwk7B284hjteCq5OY5FpWYR0vOb3QR7lNUZQwMkk4BJE5NnnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097768; c=relaxed/simple;
	bh=n59laAWVXht+XSJwX+Rx/sSiBmHzbFIhT7eyu/CjkeY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=El7F9ofjlJHQ/YNz+nsEKo3Hl52NJOZeGY4+tkzS4cIaaIWmSdSMW9mQhniDTiDQrUX2Kib17XoKqEi3Swr+KrP2yzH0z1Sgc7sb+C1MhM2+4MuUzF+HaEn0imutb1fT8/D0KHPkDomnykkpkDW/269K0hnObRdJNSar4i8V0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-424074f3f83so85754615ab.2
        for <linux-wpan@vger.kernel.org>; Wed, 17 Sep 2025 01:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758097766; x=1758702566;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2J8GtT+BO7dplocXTbSJWE7GTVxB1AxvhITY82Zhu38=;
        b=dG0B4w1fgnGQE0FYqCHBH1PSfy4YyATwfjNmOItL9S3TH/bxKXtvQaI6lEg+y4R8F0
         9eEz+udMMg651/2sJmzwNKaJipwRE6vHINi0mqCZFYDp6D92Mz4Z929CIHnp5He6FjVi
         9KRm/SymJMw3YmI81nvtoneHRdSyf8Sdt++AlVzmOVUmC5IMmrQ4M8iuUISXcSyJ93JV
         gmpJq5LBoUOUEmrZEHWEkPENo25QMW2UNisIGjogLuH93bV1Fv8nBSUInvP1no3wExi7
         P0onuS+DtGeafu9gZRDRWXJHpNkpe4sz/yjQ3KhVqLVwcyhjiOFssnGvCRXUd3A9XwsS
         nWMA==
X-Forwarded-Encrypted: i=1; AJvYcCUevc8znW2z1pbmS3b+ZKqEyfJHzfOtV4sltN/L5gR7AVAqYDSBHvR/NGf+rQ18p62ndiJj2p/krleg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Pu4Gn5b6sb5cJR3T+mShkLn3Bsw0rSCAmqW9HXQXjk6K9YrY
	MnDesqmUvP4xYvHRoxvtUiRsQTd875Ckd8LgEBFNZOMs0xh30CefLslMCM/kw/Z0SOM9zj4F0sg
	SDNSHhssEN0TBLj1YY6gYHmvoEBTr06wcdcvxS9lPYjg3qKauZZPb9i1akGE=
X-Google-Smtp-Source: AGHT+IG3kZ/PgMbkZjXiMB1OoMvpiayLLIxDSFGcBjyf/EHLPDkXxRSwkZbtc46UAmaIN7WisPVG1wdEmVR2PIc75EmKZIAVH2kg
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3809:b0:404:c21a:466e with SMTP id
 e9e14a558f8ab-4241a528271mr12754805ab.21.1758097765821; Wed, 17 Sep 2025
 01:29:25 -0700 (PDT)
Date: Wed, 17 Sep 2025 01:29:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ca7165.050a0220.3c6139.0fa0.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Sep 2025)
From: syzbot <syzbot+listc85250626370904755c9@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 2 new issues were detected and 0 were fixed.
In total, 8 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 42      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<2> 31      Yes   WARNING in __dev_change_net_namespace (3)
                  https://syzkaller.appspot.com/bug?extid=3344d668bbbc12996d46
<3> 4       Yes   WARNING in lowpan_xmit (2)
                  https://syzkaller.appspot.com/bug?extid=5b74e0e96f12e3728ec8
<4> 1       No    KMSAN: uninit-value in crc_ccitt (3)
                  https://syzkaller.appspot.com/bug?extid=29d74bf076f40407a62a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

