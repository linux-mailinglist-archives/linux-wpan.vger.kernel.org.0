Return-Path: <linux-wpan+bounces-528-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D89A2C339
	for <lists+linux-wpan@lfdr.de>; Fri,  7 Feb 2025 14:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD94E3AAE11
	for <lists+linux-wpan@lfdr.de>; Fri,  7 Feb 2025 13:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305B21E261F;
	Fri,  7 Feb 2025 13:05:25 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455D1E0DE5
	for <linux-wpan@vger.kernel.org>; Fri,  7 Feb 2025 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933525; cv=none; b=tmUfp56XK4N2IEP3SkbwpjKJWTcbflB9deIAhtbHuk5KEjWjTuH0FzSe2rzZAlwxesnguO9Xy2SnSYeEMWrYm9IDn6LUyxLXtk2xjC9aA/QrW/xtNnRDK24WmsKW2Pj9Btu77YM2bAUEwRlMKRS+jUtxP8zfEQajYq4TFgu2X54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933525; c=relaxed/simple;
	bh=/3TUutAEsyiEiao1f5FuJ2MBJPxkW4v41kYmALIyI0c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g+IY0Z86KB1jPGCPHjbpiivbo2a6sdvHJVONpwtU2FD1BOzLHAiNjaO1yqKyC9ZXml+IrQVomNnuzuqnyXCheUfAzFk+6yPfWIolAGY4WGxXehkbAWhKQLtu2LdoXmRrgz1RMiz/0D58F/o/+Ek09IiLikUsSRxlXpG0kUk2oDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3cfb20d74b5so15466195ab.3
        for <linux-wpan@vger.kernel.org>; Fri, 07 Feb 2025 05:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933523; x=1739538323;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiVOJOpa7LbU2POENlx9r029/9cBmYAxUUpk+kw3rJE=;
        b=KBpNAfIGCbm57VtqLcXKxDHC588sODKThu+L49H2VrZtI+6lz1YcQwEQTykjIKq1jP
         ZQ3TBjIMbOCce1EL65rnhY6N7lnZ0L+whGCjmNhjEeo0se9ZAK1OBj+o+g6QMYf7qUnD
         xPCudBfb7K0i6/CPkmN1SbMVaqTd1JynTrCRD6u5IzcCyaMGddU71cQizYj5guJZtsEG
         xW0GVQ3FIGA4cEyWKEzZFl/Ex7Xj8CRc2L9Cdz+sJB0qN7iiH76CitSioZPwISgiLqA/
         jQw3q1xn1C/Z2ZkSJva3I6iGXuYL3OI4baZ2My9lds3Tuq8sEbinhzneAXrzjQ+Ghudw
         Rq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2QnxkXG3ogr++sz/Iqr2//oi/GdJzW+TOfrCJGYxv/oP9B5AICQCpUnNen9/KHXBOzK2z7OeioRro@vger.kernel.org
X-Gm-Message-State: AOJu0YzwT9x+bdKqNzy3BaoBiLI1raZTHS94+xNK+vb/zmj79HUd3Cgs
	i8mhWOXR3yCNYXRRk3KJConHHa0nNShf/3l09rLn2vtGMD2+Cofvw8+H4HEkHRh0HVOn4tJQfZE
	5RnnIfwZ6VkJes0YGdWTWik7ihnMFyrIRkGVUrfyyEefYgdRhIi121EU=
X-Google-Smtp-Source: AGHT+IG0tuY2b6nMAOLuwu6yK48ezZCBaK2ZBL+1JMYx0HTn541i6zfsmHzkEyOTjECukRqzo4b1KBq2R0zJRhzdL0+U7VRNyorx
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216a:b0:3cf:fd28:852 with SMTP id
 e9e14a558f8ab-3d13dd0280fmr28382165ab.3.1738933522772; Fri, 07 Feb 2025
 05:05:22 -0800 (PST)
Date: Fri, 07 Feb 2025 05:05:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a60512.050a0220.2b1e6.0024.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Feb 2025)
From: syzbot <syzbot+list9ffec93ebc4680dc8d34@syzkaller.appspotmail.com>
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
<1> 192     Yes   KMSAN: uninit-value in ieee802154_hdr_push (2)
                  https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
<2> 20      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<3> 11      No    WARNING in __dev_change_net_namespace (3)
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

