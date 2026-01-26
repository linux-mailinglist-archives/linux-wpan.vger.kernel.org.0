Return-Path: <linux-wpan+bounces-785-lists+linux-wpan=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-wpan@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAsfMOgTd2mHbwEAu9opvQ
	(envelope-from <linux-wpan+bounces-785-lists+linux-wpan=lfdr.de@vger.kernel.org>)
	for <lists+linux-wpan@lfdr.de>; Mon, 26 Jan 2026 08:12:40 +0100
X-Original-To: lists+linux-wpan@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223984B15
	for <lists+linux-wpan@lfdr.de>; Mon, 26 Jan 2026 08:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F2C0300E606
	for <lists+linux-wpan@lfdr.de>; Mon, 26 Jan 2026 07:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829B2296BDC;
	Mon, 26 Jan 2026 07:12:28 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CE28C2DD
	for <linux-wpan@vger.kernel.org>; Mon, 26 Jan 2026 07:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411548; cv=none; b=aV91Ka5NrSgCNV7lfyj9dGGwgGm2TWDEruVZ+U9WEBORU2Ju88vQ+VqMJYadFzJAFcED5pjwxrOS4GtJi0PwyM6CTOZQC4MUmt4gOS2fRQvVIhT13CRpHbH1cqfbTL+KvcVtNiguJJL3K8vHxgFLY/OTl+b2RPPL6b1akUEcKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411548; c=relaxed/simple;
	bh=b3PwR7PZHDFl7bFHeYlMJtw+smhcSG6Fx0pXGqGjQOA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ibnApJu//4cVvXINihyT2EeqrNwgCldPp7RTbXrGxVbmcU8CjJ0gzUFVLJt5ElC/d5EdGrxJ6V4vqgMIFs0h/ACR0RbRAbUR2s0Yo+Op58itcnbjNkd0gPbnqpwDVfHLbqFPTAkAg23pSGDP7ZZMh9Iq+isPpIAZC5CjPXR1VDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-662c1759118so10400292eaf.0
        for <linux-wpan@vger.kernel.org>; Sun, 25 Jan 2026 23:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769411546; x=1770016346;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6dMLiRQAKLWaXNSJ9qzlzVwL/ShJ+BkMJnyUWmKp5Y=;
        b=jfsawFBHITabYgGrnlw3QkSbOjJgks2B9I5HuOFWEld5NCzdz9tH/e3eVBVLOu3316
         +4yBbjRPZAbt78LC1WanCw++ioOEckyTIrV8aoF85IfzxhHjgSIqnN47TUbTbLa+kcW5
         kJm7SoV6w8sCA/AUOrCIYGGAe6ZJKBzyXAUSXB0gfbzvkFsra1aHhNd290Z21QNhbRBu
         dk8U99a4M5fNG2HCJdqsf+CUq5RJhV+EJPCkBlXuNqaJHXnzg+V5jsXc1op3kCMsbaTM
         K10Ca6Cc4ojl8IgN1WGMf4c4THUd8MaqK6dd89PqQGvBza08OGXbFd6e2dFHmhJNgASg
         ieWg==
X-Forwarded-Encrypted: i=1; AJvYcCVZq3JFGbcFE2lbcWywttc+SU9npA8lejpcogIZGrfXE3+hg6r9pd/dduZ+/SORyeDDQPq/KE8xTiRu@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqPHzzknfjhgtWH+01rRzR8zt5B36YcR2xD/UJDsNYADmWJfF
	+eklil8X9PXcDCP/am8Lzk97el+LkqeEd8kx2KX27+d1kTtYcRzKVxYn4O3ALnUoM0Qceqm1FTT
	4bLcxHt4MNvpw9JJYvhzzeX12qSBrmxTmHsuNMawEyVr3WXPwzOFpVk1YZ9g=
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:985:b0:65f:cda0:e00d with SMTP id
 006d021491bc7-662e0a2ad14mr1722709eaf.17.1769411545834; Sun, 25 Jan 2026
 23:12:25 -0800 (PST)
Date: Sun, 25 Jan 2026 23:12:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697713d9.050a0220.226181.0018.GAE@google.com>
Subject: [syzbot] Monthly wpan report (Jan 2026)
From: syzbot <syzbot+list7f6cf3fce3443642c016@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-785-lists,linux-wpan=lfdr.de,list7f6cf3fce3443642c016];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,bootlin.com,datenfreihafen.org,googlegroups.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-wpan@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-wpan];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,googlegroups.com:email,syzkaller.appspot.com:url,goo.gl:url]
X-Rspamd-Queue-Id: 4223984B15
X-Rspamd-Action: no action

Hello wpan maintainers/developers,

This is a 31-day syzbot report for the wpan subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wpan

During the period, 0 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 374     Yes   KMSAN: uninit-value in ieee802154_hdr_push (2)
                  https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
<2> 346     Yes   WARNING in lowpan_xmit (2)
                  https://syzkaller.appspot.com/bug?extid=5b74e0e96f12e3728ec8
<3> 43      Yes   KMSAN: kernel-infoleak in move_addr_to_user (7)
                  https://syzkaller.appspot.com/bug?extid=346474e3bf0b26bd3090
<4> 19      Yes   WARNING in cfg802154_switch_netns (3)
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

