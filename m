Return-Path: <linux-wpan+bounces-754-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9549B0770C
	for <lists+linux-wpan@lfdr.de>; Wed, 16 Jul 2025 15:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A6DB1C23A4B
	for <lists+linux-wpan@lfdr.de>; Wed, 16 Jul 2025 13:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491551C54AA;
	Wed, 16 Jul 2025 13:32:36 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50A01A4E70
	for <linux-wpan@vger.kernel.org>; Wed, 16 Jul 2025 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672756; cv=none; b=bOYBQv9nbF2qRoHiNEWwPhbnu0VmoMC44Flz+mkKhLRB3LePFHiqQ+5of2yHX5UfcNPxGReRf3rQTCXcbMWhiphXUGT+THrP1aKd73bvo9av0LbUXK5xeHsF55LWpmI0eqSpW89uwPZqVVOFlo/WXu1J4MIQ/SW5bo1Hdjpj3UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672756; c=relaxed/simple;
	bh=0LjF+WEpfWxbMuI94iSle2uStVAP8+DyETXP7hJ2nWE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JGN+3bKvzPkD5qQfNhXuYK1Jio0wIr+zZqMbJfhNQ/2e/kZSF2nu+WDD0OTTLwkaLiQWoYRYlamgcWW1r3YR4q2pnz1cj26AKP1JV/wXyf2akPSlCES+GivuML1dgHbENh7AJHuhav8DWKlHACber6G/PwsHi+N3xGF9WXZjjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86d01ff56ebso1123770939f.1
        for <linux-wpan@vger.kernel.org>; Wed, 16 Jul 2025 06:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672754; x=1753277554;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8FKo4QvDVoH70iqyD4IXeGiSxCF2PDv2mvb9DgjsTuQ=;
        b=r9YNLPZ22IZEnQZ0MPcA7EBiaDvdrlySeac+D4evesmCW49uJnFuwkYXNTXzyEJHI2
         yXXdu0+MYDCy3OgxN+hEi3ubLKaLAMIiy/wVbxCFUtl7nfkjG0btIud2jJ/LwyabHOXe
         2Nij1JA3AlYHeYcVTrHsqTA6hPCmWsSyhHD56zUSvCP3Nwxgvs8p8Qiose1MjtZ2GbNB
         rBGbqSWBbppOo/GfZ2u/8rrY8zYW9anrcEiHBUlFRZIjnjUp6lNiRXMtM1DJvX/blLyE
         +eqP849GDUQjwp7awKM0YggDVUb6ExXWcu2RbnMRqnQCb0F+4qNaXrBWcpEeGBeu06cA
         9ldw==
X-Forwarded-Encrypted: i=1; AJvYcCXG2lR7kGywJo90thUGStg1rQ3wy4TroTacGqQ34t7JcegBlpYv16uG5PjJflJOfYEEFcclbhH9z9vZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6bQj2Z7b38hM7XyO2xvNCqJ5SFdGfMuBy/qb8xKBdzIbhBv/
	WKWNpbB716mil5DTLknNJ1/+PnfJNu2SFJvejDPvtJQ7XraLIEl6tMdEyJ4B4z0aGRnHLdf99ck
	S234Ad8PC/m1DLzNM5t4SWtWUFjeAzmwo1r9EtIl1vDO5hCO1+HnOAYeaXCA=
X-Google-Smtp-Source: AGHT+IGF/kwqN7mja3XdkF3JMxQnYsfIzdVe8SJG2JlSEMJrev647LnGXH+ZgnnCfb6c21qzpSjvMFXxHCtaE/I2Xx80WB5mV8aY
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6305:b0:879:72d5:96e7 with SMTP id
 ca18e2360f4ac-879c28da0b2mr283284239f.8.1752672753981; Wed, 16 Jul 2025
 06:32:33 -0700 (PDT)
Date: Wed, 16 Jul 2025 06:32:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6877a9f1.a70a0220.693ce.002a.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Jul 2025)
From: syzbot <syzbot+list57b57add8873522eb296@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 286     Yes   KMSAN: uninit-value in ieee802154_hdr_push (2)
                  https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
<2> 36      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<3> 23      Yes   WARNING in __dev_change_net_namespace (3)
                  https://syzkaller.appspot.com/bug?extid=3344d668bbbc12996d46
<4> 10      No    KMSAN: uninit-value in ieee802154_max_payload
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

