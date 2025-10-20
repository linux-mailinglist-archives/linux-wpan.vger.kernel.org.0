Return-Path: <linux-wpan+bounces-767-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7ABF0E19
	for <lists+linux-wpan@lfdr.de>; Mon, 20 Oct 2025 13:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D7DD4E1189
	for <lists+linux-wpan@lfdr.de>; Mon, 20 Oct 2025 11:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFC630103C;
	Mon, 20 Oct 2025 11:38:31 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC22FDC59
	for <linux-wpan@vger.kernel.org>; Mon, 20 Oct 2025 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960311; cv=none; b=Un5uKaJBGtcscwnqrGj/OnQwt7Ps5DMI19eK71iH1W7EPsRdab90tyGk5fRy/NY+c/mCdRXP5ohpR7e0cFXFjQZWsP+9FZFAkAmC7vHTSwx835s9gh+uFYKYbicWLDtUm/yCOJawxg1CvN4mvaKIYxxPtFt0nNcMYANKNsvU1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960311; c=relaxed/simple;
	bh=UZ/VKJ+pN2yig+GvLBIqSb6Ut6P9Eohn0TODs04PIH4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mp9AUBbOxCgXKeJ7eU/BjSOEIfPk4oHJY8uw7vYu0gPory0M2NsgLgZy162cEcUHz2p6yTl0SWE4gBaXeDjZMwXrd1FRBJVkXOqmrlgBm6kUt8YNZ0pIVFGRZv3tABoHVYbLvjAENeRdZAGyjeQbU+84A/RD7GdRFq4IZTaQPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-93e8d8d2617so169739339f.0
        for <linux-wpan@vger.kernel.org>; Mon, 20 Oct 2025 04:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960309; x=1761565109;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgb7OtlYnMQoM90V6NabwiO23RskwmJJ0h2MWLGQTV4=;
        b=xLixUtzItmCmbdCEvdbh5h8bEgpZ+3rnFuAdUlp3wtvlxlZm+daq0GPMs5G7YQ8DYd
         0hITUtmzdPah0w2voAzrCwYPeee+zeD5VpVwfq02TqIQwgGajgyTLXFB1mvUg+3kyPMr
         xJDCwd7ipec4IlnqALLJv4qIBgoPDYnXMiHTjy7raQNTtCt/jJoDCoSEMyiYCBb7imnv
         rJedz0QRwj6Etv/I7vC0VUUILsJVFY31SN++xMDo8M/wPost0o6YFzU/MgqZ2Ib3PPpG
         aYcIyiOq9WLh8NlfRNybapP8fUADEnq06BYZrkdilAPmIYUN29m4vNVOFtrpE4cFvx4r
         AtWw==
X-Forwarded-Encrypted: i=1; AJvYcCV9klrDaSMA2ohPM7EIOU3k8h8GrsOeJ0iXDqQpLrCdn5E/zVzbkbKpqZGh0vnag8Wu5fEy1B4wglyb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13OHzPszyDdOPkw7DSmCmnIT5V/djA7y0Ubb+1RJJ19nw/CIv
	Dt6HLuSbTgJZiOZM4Qyo34Ux02DbodRa2xGAnV3+PJ48Io4a5UDX0FnQEAfsqyinyeCjSsv3HJy
	AWmAAa1nV45MqQWRq4yXza7SKIYBMKuSrtaZMzr1xU96aKB4/BOy/MOjL2Mo=
X-Google-Smtp-Source: AGHT+IGNhxcWHTK2o061+zSJWgTbgedgGJQ7DlHF5OInK8gPKeca53b3HERWWsC4cASlO1Uxc3OLuvUzSLuQO4RTeyYNoL1bv51g
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27c5:b0:883:fc4a:ea55 with SMTP id
 ca18e2360f4ac-93e75321bc7mr2257904739f.3.1760960309088; Mon, 20 Oct 2025
 04:38:29 -0700 (PDT)
Date: Mon, 20 Oct 2025 04:38:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f61f35.a70a0220.205af.0031.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Oct 2025)
From: syzbot <syzbot+listefd84cff8486e6c23cb2@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 0 new issues were detected and 0 were fixed.
In total, 9 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 46      No    KASAN: global-out-of-bounds Read in mac802154_header_create (2)
                  https://syzkaller.appspot.com/bug?extid=844d670c418e0353c6a8
<2> 39      Yes   KMSAN: kernel-infoleak in move_addr_to_user (7)
                  https://syzkaller.appspot.com/bug?extid=346474e3bf0b26bd3090
<3> 35      Yes   WARNING in __dev_change_net_namespace (3)
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

