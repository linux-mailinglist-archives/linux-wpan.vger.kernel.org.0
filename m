Return-Path: <linux-wpan+bounces-449-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502B9E8085
	for <lists+linux-wpan@lfdr.de>; Sat,  7 Dec 2024 17:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05978163FE1
	for <lists+linux-wpan@lfdr.de>; Sat,  7 Dec 2024 16:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC4F1494CF;
	Sat,  7 Dec 2024 16:12:28 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A413D29A
	for <linux-wpan@vger.kernel.org>; Sat,  7 Dec 2024 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733587948; cv=none; b=Oopt2+5UKd4SU/vDAYCwfuxKUKaruaBoKC2cTlhWEET/GviOxAVnTv6rS+WdrgEz4mymKqqOG6A64P2wLRANQl6rM67edC1JKvKuD0dQM3GqfcFeOtIKbxkZmrMJ4Cly1gkEw8d4ejHGfTn7QsLCWOt//9N2lsbsj2Npy0qiocA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733587948; c=relaxed/simple;
	bh=BM0qNEKyoqiw5u8Eq/oGv7Qwv3jU51gvmnBUjHvD21M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MX3TLUEa/MBUwBB8xnhvKQIeDNHGvlt1xZaMTtuGkLHkuFCcQqpNnDfXoyG9MTKwIIJFR/W/bDg5xDPiSxAsT1gowKPICzHI/KUDjWwD5Jh9h9S+dHUYE2FEeU581iJanH3YhGZiTeuPruuUseZX+rGxhQWy3e5mazBUwBgFsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8418307b4f9so323276339f.1
        for <linux-wpan@vger.kernel.org>; Sat, 07 Dec 2024 08:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733587946; x=1734192746;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrkbXyO1gWQb08Qbhw9tuE++tiqxf0uwJSolasA1Xvo=;
        b=fiq1NC8xIKilvf4y0qVtzRanxnE7SbYp01nZ6yIJqBHx11qgVJs5qc2joaxO9Vk2FT
         D1NXVf5p9N9XJ49hDp0YaD+gD1Y0T+KqHTTSfq2kY2soPg8BxP93L1HT59+q8gLMv41z
         gynv7SFMOJWpQ7OXOAg4wFnjspGzxixB8AW3EQ2OxxQ5ZkVwYzEO2OFuGOf+xKk1+d+x
         NjO6aPVWPqECB3JLrF+WFT5DDHPFsXCV9/OAIic9Kob2/SY6yvWLCEepUQnOdRX5JSPk
         dNoZu7hbTYoQfhbIz+i9kYfcvHpiXQDb0Vpz23XOVoM0JchUEbETsSI//q4bvwlA4iYp
         GwTg==
X-Forwarded-Encrypted: i=1; AJvYcCVcKKN2etf1jHQpHe0/SNimMs6s0TF9mqo8PQI/NMdyL3dnCxEGhBAmFlTur4S8hivUye7vGUq+Z+Xy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp0D2VTbajaF6fC2qQmia/Zt67RfREWkmaHt7+rl1h/kc5fdyw
	7As18MCAOq6XSRVPXIlBFst/TSwE9cNDFwx3+kKSdhKh3Jr0Dd1znOh71hd3oLciNeIKzpyciRG
	im3JX+Xda5nk1hbVIe/1bdTpu5qps7eBoirYRJ6qc8qbf53jc+CH+i3I=
X-Google-Smtp-Source: AGHT+IEZvxHxO79IMt43jnaEdxnKpXMfM/Z9I2CvNRBeP7EJ7AX8ZUHeQbrJi/5uV4buEbpFDP73/EVVEsOs/FkrIU3QxTpW4/wp
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c249:0:b0:3a7:bc2a:2522 with SMTP id
 e9e14a558f8ab-3a811d915demr65071415ab.7.1733587946625; Sat, 07 Dec 2024
 08:12:26 -0800 (PST)
Date: Sat, 07 Dec 2024 08:12:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675473ea.050a0220.a30f1.015a.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Dec 2024)
From: syzbot <syzbot+list298a2131cad081a6c900@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 2 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 25 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 120     Yes   KMSAN: uninit-value in ieee802154_hdr_push (2)
                  https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
<2> 4       No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<3> 4       No    WARNING in __dev_change_net_namespace (3)
                  https://syzkaller.appspot.com/bug?extid=3344d668bbbc12996d46

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

