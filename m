Return-Path: <linux-wpan+bounces-742-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AA7ADACE3
	for <lists+linux-wpan@lfdr.de>; Mon, 16 Jun 2025 12:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61373B13F2
	for <lists+linux-wpan@lfdr.de>; Mon, 16 Jun 2025 10:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9562EB5D6;
	Mon, 16 Jun 2025 10:02:31 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76E2951D4
	for <linux-wpan@vger.kernel.org>; Mon, 16 Jun 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068150; cv=none; b=HOCSMQeRiWtwaJgcUnT6TgmH0TRvTj1gk2p1ZEEAe7uyejec7E9+2l0LenIwEzxSWhZwci4lOvJHm+mFTNEAMQOhiITkskz0/4ZRismkzYtcMvPKVInHBEhERmVBf0Wq34gMHtXJB3Tlkbo896BZEbou661Fbet61q3yc4NDX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068150; c=relaxed/simple;
	bh=z9kAnrkpj2GfKxE79pAFRpyJIW6iX5B03w9R6zhT0X4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UFopa9BNaXnFrtpOnqVk14nN+xxwPsF1Ry1ErAecHx/eg2fF2O5DlQylSz9MyBhpYmyTy/OiEGwL6seaQu7dq/i/hvT6b5noBU3TqpYOETnUeLk6yzqY/cPnLFKlIfpcihgh2FXUsGLlRQDw62V4bMzLY47bhFO2WFXv9ewKypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86d54e66cefso354127739f.1
        for <linux-wpan@vger.kernel.org>; Mon, 16 Jun 2025 03:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068148; x=1750672948;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myEXstyGfSAkN+bF6xcG4feR2elJpzxIo3WyiuH/a/Y=;
        b=V5Ly+zYt22dS/U2P9B/10ANFKcywMltbo9XMB0J1eUBSH+S0zr5OWD3Aw1HIeZHec3
         NHfJJiP7XktWvNRik1bWo+Sv+GS1DVmEsC01rA221esKuxu39Nbfemome7q0B03jRPgf
         zAm69T9AJi80OxAkUBPJsxUO+POcrHFeJqVuL9zgUYb+l+XovNiA4wEtkuiS4ND72AY3
         5ghnoVaiQQ4r6h17KnYiCRq5068m22BdHtzW61O9jfcS+Bkao/r6Pa88un7sxrZojzMN
         TPLgDPNGCfp5psQ1CuRMP67Qv/RW6PJJcpWY11xhCZX1aEtLHLQscVjsfbDRM2e4B2WX
         0HFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6dw7CpwodxrihUTFlWXoxIVdlCbBbnyGUY9jzE65pzPRbnwmab0yhYoJpKNBXbJjsl0FnzvXMFbtI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqhpa+79BNjeZFsaqwNTnjFWYfBTAuwlCSyxZkYJ6ybC3BwpCF
	YppgHg4D1BZkzdDK4p9zRheZg69d7rflxjJwqyob+6L5J0EddIYABtpj8ynRB74O8R4n+rKEHd7
	1pqY0Fjh3D1Di8lbk4gkZOwEZA8vd90s7Bz2SUXe5zZWrwb9I38dGPT7M9VE=
X-Google-Smtp-Source: AGHT+IE8eiWFRAM5rURp9zmqZHi1FS/z6eQkz4OXZuea06egVDNxYRzDQP1WE/XQ3CLWQbe2r/oGDMBmQW8gq/iCHHdIXhc4axEW
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1687:b0:3d9:6cb6:fa52 with SMTP id
 e9e14a558f8ab-3de07d6855emr93274005ab.12.1750068148473; Mon, 16 Jun 2025
 03:02:28 -0700 (PDT)
Date: Mon, 16 Jun 2025 03:02:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684febb4.a00a0220.c6bd7.0017.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Jun 2025)
From: syzbot <syzbot+list96e7686d3d4357107084@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 1 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 34      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<2> 17      Yes   KMSAN: kernel-infoleak in move_addr_to_user (7)
                  https://syzkaller.appspot.com/bug?extid=346474e3bf0b26bd3090
<3> 1       No    KMSAN: uninit-value in ieee802154_max_payload
                  https://syzkaller.appspot.com/bug?extid=fe68c78fbbd3c0ad70ee

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

