Return-Path: <linux-wpan+bounces-878-lists+linux-wpan=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-wpan@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QFVfLrtjQGoUfQkAu9opvQ
	(envelope-from <linux-wpan+bounces-878-lists+linux-wpan=lfdr.de@vger.kernel.org>)
	for <lists+linux-wpan@lfdr.de>; Sun, 28 Jun 2026 01:58:51 +0200
X-Original-To: lists+linux-wpan@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E676D2D6B
	for <lists+linux-wpan@lfdr.de>; Sun, 28 Jun 2026 01:58:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ml71Fd3d;
	spf=pass (mail.lfdr.de: domain of "linux-wpan+bounces-878-lists+linux-wpan=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-wpan+bounces-878-lists+linux-wpan=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1DB23006938
	for <lists+linux-wpan@lfdr.de>; Sat, 27 Jun 2026 23:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1220237F8AD;
	Sat, 27 Jun 2026 23:58:46 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7A30D3F5
	for <linux-wpan@vger.kernel.org>; Sat, 27 Jun 2026 23:58:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782604726; cv=none; b=Ud73fvNXVCZCXbBRwtczjg82cYOHCYH39kTeFl05bU7XvUNHX4utCHbvyl0RgKZJOHwYLhgprVISjUEoRQL9827kO8+AqTBmxZrQPmzOhL8iD7iyBr3qciD0PpJvPxB0K5Dn8QLgetvrzYaeJBESXcGaOpQdcoK1gNh3oryr64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782604726; c=relaxed/simple;
	bh=t1c6ZkEqo/5nbeX5Y37JbyRiMyH/PLMuUEC6tLqOZMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSTALFV+XWSMBnZOD/uzVBsYjY4MN8zmUAu0lfwI/H2wR1rx94MZW/hWyL0nPA+a+rkvTEIz5QpTXP7eua1z6P1AwD+mEc856JGoAPXE7P1uK9nx0oDdU9MC2jo19wK25G199e6JnFYtPbmFgtg0RIJku8tocpx+mS+cXIe2jnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ml71Fd3d; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4704d652e9cso459569f8f.3
        for <linux-wpan@vger.kernel.org>; Sat, 27 Jun 2026 16:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782604723; x=1783209523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skDXyZAJq24/qIOZkzrlcPyP6eRzwfs+LL2sC9Z2FWs=;
        b=Ml71Fd3duV1vI6zM10YZHcg6HyOIuenZTSsfAoDutffzyyGHUyzVsdOt0W+RfAglBa
         E1ER2BeOLkAEVCG8I2p2hugupwPqVqYUjS8BrjTyMSL4Z60J+AsrlvzbqXHjS8nXrfcM
         ANF7zRqKWIUmfWi4SeH1AgjK9a0q1dGSgHn700ULmNSFaGU9zdWfhs3KLyZhaCgRct73
         6HNRqRoHtqytA5KixJOmpVlS3k5o8ZjjDVsJTABIPIayhJQ9y6dg1gPALi9JUDRqfNAb
         BW3zJPSCTC3RqQiJJ6Hb60p0symHMSP9KU12RyraBqRCaiUore1VE0f3TbepDuGqhBuH
         J+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782604723; x=1783209523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skDXyZAJq24/qIOZkzrlcPyP6eRzwfs+LL2sC9Z2FWs=;
        b=RZx/j+M7GZqEwHmuDg2DtPQ5E+YZSq/tI0tcRFhXwaqNACoPEz1qYu70bAHKNqyWHo
         MFGhNkgQjBfWAB/8WnSAP7JqkGdqko4F2RaKxCig5uTEB8jIzLTvYqRVEgK49I9Et9cr
         Puwg2DXEBoC0CZPvj/+2SnNQOvgjEaERfRDhHIPeBxUxVLjKZTxcyM5tBg+2+HfX1vNm
         1MpBtLK04+s7dfGDu0c/Jj+yNc5YwgqXMkSLp4pngjA41jBXJnjfkb7dV1NTWfq02iBK
         BCaTznR6lXaGtpzXvgMB+XIQC4KblldO5NaU0hxU72GMWxjnqCydDfMnox3SBlaGQuc6
         9Vuw==
X-Forwarded-Encrypted: i=1; AHgh+RqnVM6WJY+GpFwzdQSjnqv3BeX2nrwDjpxhOisSnhdszBKVIyoFekhnRh5nd50VeGni5XKEa5xRK0dw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9009B+NU686TJ0qALYBRHIvX/qvhNOQcE/VhShNpEiSwKOE/D
	oTh7jR3AnIAyrCNbFvSc5KoVc3WTaxAwwVQeR9SSN+4sTKc/miCOUoje
X-Gm-Gg: AfdE7clWYmpoRtuwtkeEljuE+Y+3Vv9z7IH4AVBDxaGdboZDhcTtE9/asYU1xkjcD6R
	SgtyA/MT6J9BV1I+ca4GLshP0y2JVoWzqEZkW2Go7MF9yaV4i/z3W6+BZlspQBxB68jOVcpKgSR
	YWoE+7m48niTREPrtlEZiDKGQvAAMjZpCsjeTFSKPWIl4FoW1WrRA3+2APxakBqcNCAC8LT0ajs
	yjyb2nWZLkImlTYCE7zVZ0myaIUz9E+ex5Pk3zb2XsW2vANaFNXhLRLgamIVG/4u3rSxCTgV/nt
	lI4xaw/4CMsV7QL6ZwcS2dKrZrXr6POb04NsqxCcb7LkFSXq+o8PaQly2CUov/eCi33GFQzHQse
	0lRGTFcgw6X4iI7jo3hpjNbyWDTfkuM4wfO7b9/s2Q2jC4xY3B56PgBkDHI+LbgHlnGD5J4eq0S
	v5ZEPlHK1/xq0q1YO5BI7LwD9PkqxKhf8DO0+K
X-Received: by 2002:a05:6000:470b:b0:46d:28a7:3ce7 with SMTP id ffacd0b85a97d-46dbed35effmr17819314f8f.7.1782604722940;
        Sat, 27 Jun 2026 16:58:42 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm8348957f8f.23.2026.06.27.16.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 16:58:41 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+4707bb8a43a42fca2b97@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH net] ieee802154: hwsim: free PIB after unregistering hardware
Date: Sun, 28 Jun 2026 01:58:05 +0200
Message-ID: <20260627235805.17310-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-878-lists,linux-wpan=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,datenfreihafen.org];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-wpan@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:miquel.raynal@bootlin.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:syzbot+4707bb8a43a42fca2b97@syzkaller.appspotmail.com,m:alhouseenyousef@gmail.com,m:alexaring@gmail.com,m:andrew@lunn.ch,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-wpan@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-wpan,netdev,4707bb8a43a42fca2b97];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,syzkaller.appspot.com:url,appspotmail.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8E676D2D6B

hwsim_del() queues the currently published PIB for RCU freeing before
unregistering the hardware. The unregister path can still invoke driver
callbacks, including set_promiscuous_mode(), after that grace period has
started. A callback can consequently dereference the freed PIB.

Unregister the hardware first, then fetch and free the final PIB. This also
handles a PIB replacement performed by a callback during unregister.

Fixes: 1c9f4a3fce77 ("ieee802154: hwsim: fix rcu handling")
Reported-by: syzbot+4707bb8a43a42fca2b97@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4707bb8a43a42fca2b97
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/net/ieee802154/mac802154_hwsim.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
index 6daa0f198..2a2d8a9eb 100644
--- a/drivers/net/ieee802154/mac802154_hwsim.c
+++ b/drivers/net/ieee802154/mac802154_hwsim.c
@@ -1004,12 +1004,11 @@ static void hwsim_del(struct hwsim_phy *phy)
 		list_del_rcu(&e->list);
 		hwsim_free_edge(e);
 	}
-	pib = rcu_dereference(phy->pib);
 	rcu_read_unlock();
 
-	kfree_rcu(pib, rcu);
-
 	ieee802154_unregister_hw(phy->hw);
+	pib = rcu_dereference_protected(phy->pib, 1);
+	kfree_rcu(pib, rcu);
 	ieee802154_free_hw(phy->hw);
 }
 
-- 
2.54.0


