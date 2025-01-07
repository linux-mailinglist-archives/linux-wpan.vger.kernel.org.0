Return-Path: <linux-wpan+bounces-501-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5956AA04364
	for <lists+linux-wpan@lfdr.de>; Tue,  7 Jan 2025 15:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1A9418857E7
	for <lists+linux-wpan@lfdr.de>; Tue,  7 Jan 2025 14:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978B31F2365;
	Tue,  7 Jan 2025 14:54:30 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E91F1301
	for <linux-wpan@vger.kernel.org>; Tue,  7 Jan 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736261670; cv=none; b=EsVxt7VMe7LKkco57DlOU4MLqs9473LsoV6B1zyyDh62joUk+aUKgPF3M08Vv9bnITJChr2NUpCABcTmZlWtiagkxdTg6hbMv9io5U35a/aM2J0T6Y6QodtrgLPVp7IYorkDGXNnGJr1YYqCG1xpD8jq5fNpaSgGBXarrNpcrus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736261670; c=relaxed/simple;
	bh=q/UTUd4wGepvnY3I65+DtC59TAsbKPAC1wXLZNgjpsQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g15V7symW+VvWNDxVN+XuA+Xm+VijavwDXqGf7ZihEK7C426ZfOwBEpg/DkqCybczYz5eVZBevsfm0DWWQnGnUB6Nc6fRMZZq0u5q4Q2wqhBgl0JEJQZbospRfnDByhPNRFJ0rb7+jSWJsxt1veI0sBMj08S2nc+xhq1TumRgxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a9d195e6e5so140732645ab.2
        for <linux-wpan@vger.kernel.org>; Tue, 07 Jan 2025 06:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261666; x=1736866466;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQNBTv/v8FF/k1N4jHYNKUzYslup0/Ac3YRstwEghs8=;
        b=IyOCXhAVLRXwGFcNmZo+FTaLSS+XZ9+VNWjslUOJAJMrlOGqAf9rvvgwQwC++mDHSz
         Qfh6NWyAkNmYNYtuv7WvhwTx1+Nwr3xSri+KWdcJ4QNSP3QDtB6Qc1/C6JC9Eoc882nL
         FzTYxPtD9qQm7Z9c9/2oZSAyeXipVNjxXFKilwkx5YovStLEDrkCmCYP5E44GouBx/6Z
         r6/6ENxFQ2a3f/0KcHomDv1AJFfP58CkCUsH3avzkmfdc/MSFU/M8vjzTUowRDZUc+Ly
         xlG7YY1U8YBNwO431az6hanXRFB+2wMrmfT2GM2or4+KVpQBLXCGS7x6+xo1xJ49w5AU
         9a2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL6GHjU8JtyHU38JDD+t87sBkpsaDs6+M4EgIRJ0b6KNWVKW31GiDp3Y8eW39AZP2GEYN+jXIY5uyT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYa+zEdRluQwyWwcS9uj1ziJHfBxhIb6AhhKxoj3tjJkTAXhX
	KKOo+43+H3v10APS5OshTI9f1mXsgrxhYynR4jVZLbH5K7SaFzyZbzkOf2K0NIjEn7wn13hZOPn
	pI2o62mlXapLa+XCvRNw6/DUH33S/MLwcelam9yN8XBjT3nl1e7ZvSfE=
X-Google-Smtp-Source: AGHT+IGSpDpIM7Y8UQT2RsbOUsEUEAWNg7z8znh7lgWQEMnUHf9SL8KLITjuRB/zcPlU609cYm95XZIHl49sRBAuXMp4TTEoyRiS
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b87:b0:3a7:e86a:e812 with SMTP id
 e9e14a558f8ab-3c2d48a2f66mr445254125ab.17.1736261666273; Tue, 07 Jan 2025
 06:54:26 -0800 (PST)
Date: Tue, 07 Jan 2025 06:54:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677d4022.050a0220.a40f5.0021.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Jan 2025)
From: syzbot <syzbot+list99b8af0ec3a670fc3fa5@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 0 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 25 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 170     Yes   KMSAN: uninit-value in ieee802154_hdr_push (2)
                  https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
<2> 12      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<3> 7       No    WARNING in __dev_change_net_namespace (3)
                  https://syzkaller.appspot.com/bug?extid=3344d668bbbc12996d46
<4> 3       Yes   WARNING in cfg802154_switch_netns (3)
                  https://syzkaller.appspot.com/bug?extid=bd5829ba3619f08e2341

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

