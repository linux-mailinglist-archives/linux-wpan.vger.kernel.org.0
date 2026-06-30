Return-Path: <linux-wpan+bounces-881-lists+linux-wpan=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-wpan@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FTOZFtE5RGpEqwoAu9opvQ
	(envelope-from <linux-wpan+bounces-881-lists+linux-wpan=lfdr.de@vger.kernel.org>)
	for <lists+linux-wpan@lfdr.de>; Tue, 30 Jun 2026 23:49:05 +0200
X-Original-To: lists+linux-wpan@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FB6E8371
	for <lists+linux-wpan@lfdr.de>; Tue, 30 Jun 2026 23:49:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=qpHHIqfc;
	spf=pass (mail.lfdr.de: domain of "linux-wpan+bounces-881-lists+linux-wpan=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-wpan+bounces-881-lists+linux-wpan=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB7DF308C0DD
	for <lists+linux-wpan@lfdr.de>; Tue, 30 Jun 2026 21:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A972727F3;
	Tue, 30 Jun 2026 21:47:40 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E078313E00
	for <linux-wpan@vger.kernel.org>; Tue, 30 Jun 2026 21:47:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782856060; cv=none; b=ipI63IyUPfdSCPfFeZHhn7krs6jgqxZvDgkl9veNht39YzVKD2UYoowXSY/Sqr3VQbGiz6JPJ9RmyDjhPKOZT2OmQ8CIwqO86fs5WG4SJHET+C/9+o/9KTR2NXPpcpMej5zOsSDLdHmYC+ij8qmxjSdtxumSvlN8IVEU62usnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782856060; c=relaxed/simple;
	bh=XNuW0ZGgez20bbhsopijtlTxIIjZ0NWgC3k/4NIZV7E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IU0vmuqIQIZ2m4T0EM/Pey9yk2I3F9zCMh8sWByxGwONH1WiM1f/iXXpNeKCMkAvJCUdqiHfJHu5yxkDSImWj5eDqIQDHaYM0LJ6crDYpESGZcJU8ceKTN9dmJirmX8sJiu09FTL1G45J21AgpCzecdQmi9yh7QNm29mp7Az8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpHHIqfc; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ca0481106cso198125ad.0
        for <linux-wpan@vger.kernel.org>; Tue, 30 Jun 2026 14:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782856059; x=1783460859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGyt18YI9hlTzlAe3erqu3CT7ClGjgWwoVlpkDOVAt4=;
        b=qpHHIqfcSNEinfm7KVwJprsvDu+ajuHpxQwwRFzA6r+zC3W3Ss9FHoaBEP26uGotXP
         qxSjoErmaVxIqSw+7VPYdTrDS9zM6mlVZRnmM/yZdR9fl7VXEl3S1A60Ab+F4TU0zqK9
         Zrk5k8/jPz850tIN9hFVSF6sf/uXmB7BX6MWqwgzT+Hih4QuPjC25TbN+O2ejuixCcxl
         f7dDul9PQEaOQnN8Yin6ifuBsyryLvEraM7iXLUhVKtmYklNxaqGrDoz0qhMQAVWwdQ4
         J8ZjszCioScnOMdTIXXUqvkcYJ31H0/+CyqafSjyTn2Q8lFmSlyLYjHeY2KQyU48scoy
         8tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782856059; x=1783460859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGyt18YI9hlTzlAe3erqu3CT7ClGjgWwoVlpkDOVAt4=;
        b=oqGsL5MbhBAAaFjnMIjMEISUnJkbx76JT4zTkw5AZeiT6VISzKx/4sxF0hvSibdWBK
         YGEUI5j+x6+FjK5Q6fIvDSrPmWCY6VFUN/UYPXYpfSTdOoR5/WQOHS/lgO+EqQhk6N+T
         95fYPJYB1es5NavdUwyStstBw2bWWWURDDNrlenMHufeIU26yVQpte+qmxY6zgPtUXL8
         F0vt0miIhph7r/tXqSSJuvOzWDJLnZK1xaUa0cFd34tTO5Ul8KaQgy54CPgGZau9clnT
         nH0iQxdqnOLsKpRou2kqKy8bGtnDQs9b2hmbRDX7rR0ePoQjr0wSJg288ZyShRgqy0I/
         g6Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoxQThCAyRxVO2ErltwGEk5Gw93yWaD0w66p0v5RKCKohC4tOMA4A4SrZG2Pdqvzxz4NgC1JjS/r5YG@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfjlpM5VXD6uhQhQ0rXv5mMJSk1ZZhZ8VQ8hoC+1AH/BWxJUc
	RfOqXGaXHIe7QHpgjNDr9bdIBrTVjnFpy5lyEOabTPJp2xg4mMSfxjc6yMhkd1TajnPlmALRqPi
	kAxs+HQ==
X-Received: from plkp12.prod.google.com ([2002:a17:902:6b8c:b0:2c6:be9a:d6c2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b6d:b0:2c9:f44e:9942
 with SMTP id d9443c01a7336-2ca2d547e03mr43220105ad.13.1782856058393; Tue, 30
 Jun 2026 14:47:38 -0700 (PDT)
Date: Tue, 30 Jun 2026 21:46:38 +0000
In-Reply-To: <20260630211808.50440-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260630211808.50440-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630214737.3387996-1-kuniyu@google.com>
Subject: Re: [PATCH net] mac802154: wait for RCU readers when removing interfaces
From: Kuniyuki Iwashima <kuniyu@google.com>
To: alhouseenyousef@gmail.com
Cc: alex.aring@gmail.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, marcel@holtmann.org, miquel.raynal@bootlin.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@vger.kernel.org, 
	stefan@datenfreihafen.org, 
	syzbot+36256deb69a588e9290e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-881-lists,linux-wpan=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuniyu@google.com,linux-wpan@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:alex.aring@gmail.com,m:davem@davemloft.net,m:edumazet@google.com,m:horms@kernel.org,m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wpan@vger.kernel.org,m:marcel@holtmann.org,m:miquel.raynal@bootlin.com,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:stable@vger.kernel.org,m:stefan@datenfreihafen.org,m:syzbot+36256deb69a588e9290e@syzkaller.appspotmail.com,m:alexaring@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,linux-wpan@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,vger.kernel.org,holtmann.org,bootlin.com,redhat.com,datenfreihafen.org,syzkaller.appspotmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-wpan,36256deb69a588e9290e];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,syzkaller.appspot.com:url,appspotmail.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A45FB6E8371

From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Tue, 30 Jun 2026 23:18:08 +0200
> Queue wake, stop, and disable paths walk local->interfaces under RCU.
> The bulk hardware teardown path removes entries with list_del() and

The problematic part is list_del(), not unregister_netdevice().


> immediately unregisters their netdevices, so an asynchronous transmit

not immediately, unregister_netdevice() waits inflight RCU readers.
So, synchronize_rcu() should be unnecessary.

(Same remark for ieee802154_if_remove())

> completion can follow a poisoned list node in ieee802154_wake_queue().
> 
> Match ieee802154_if_remove(): use list_del_rcu() and wait for existing
> readers before unregistering each interface.
> 
> Fixes: 592dfbfc72f5 ("mac820154: move interface unregistration into iface")
> Reported-by: syzbot+36256deb69a588e9290e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=36256deb69a588e9290e
> Cc: stable@vger.kernel.org
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  net/mac802154/iface.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
> index 000be60d9580..73d82a015184 100644
> --- a/net/mac802154/iface.c
> +++ b/net/mac802154/iface.c
> @@ -703,7 +703,8 @@ void ieee802154_remove_interfaces(struct ieee802154_local *local)
>  
>  	mutex_lock(&local->iflist_mtx);
>  	list_for_each_entry_safe(sdata, tmp, &local->interfaces, list) {
> -		list_del(&sdata->list);
> +		list_del_rcu(&sdata->list);
> +		synchronize_rcu();
>  
>  		unregister_netdevice(sdata->dev);
>  	}
> -- 

