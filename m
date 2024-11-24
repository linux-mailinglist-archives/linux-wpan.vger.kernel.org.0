Return-Path: <linux-wpan+bounces-446-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38E9D7516
	for <lists+linux-wpan@lfdr.de>; Sun, 24 Nov 2024 16:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CBF287F58
	for <lists+linux-wpan@lfdr.de>; Sun, 24 Nov 2024 15:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76B0240051;
	Sun, 24 Nov 2024 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRUEsKE4"
X-Original-To: linux-wpan@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F324004A;
	Sun, 24 Nov 2024 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732456646; cv=none; b=RZxjfRRf7RhyJtAMOYM7bHZ4AoJazL3InYB7f67mWX98av6YFAA2uPV1YKly5YSO0s0a1mwS1ZqkW9gS6FB9CS9upvChQOZe2N4a3H0o8LQJiT8BGObRzMj9XUjRmhcm4o/THahCk8w97e/yPnBiF2ZtCvWwmZsqTJruEE9l/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732456646; c=relaxed/simple;
	bh=iUxatIsJ1+icn4fDbOGAoKn4cA5UvvP8vDGzhiUM5Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsA5VudoCAj+2/kJKyr0e+4E6qkUEPYJC578gvPhE8EPttHoE7inFf/zwH/LPbvHP1eeJPHcfuyw/7BZBAnzSCNXcNH1x+ZLxtXN73twpDN0K9hCfXeUZqoxfp883L6jixmcR+7fyo0gMgiG2sT4baueVAXjRveqotzUNE7dUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRUEsKE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A38C4CED6;
	Sun, 24 Nov 2024 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732456646;
	bh=iUxatIsJ1+icn4fDbOGAoKn4cA5UvvP8vDGzhiUM5Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRUEsKE4BqflRVXU+IxzYBmgFRYOcjGRuZ3Fw3JCOsuuExWYbAMTXpu7XdjO/eCmQ
	 sL6yZh56bPOfCeTXfPFFTBLkfIqsrM+gHXO20M9tjMwVKl8WKSdQLJNV4JFwWKkdK5
	 v2QOam3AmWMjHBALOseOIqZPhhJQAvgicl9z6ADGPFMY9cbMWOrdMnU4CKOWEz5Yx2
	 PNj39/sxPg1IjaEHoik/BUVUmn708kTs3qNR8O3SX2v3G57zdZy8FWTtZZ9BD0YHzI
	 hmQweomX0oUgUGkfhHuPMfS78PZ+Eh3pxFEVy4Zad2At7egvEDv81w8Qsq1uM/PwKe
	 v5XQzKBw5I6Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ignat Korchagin <ignat@cloudflare.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 08/21] net: ieee802154: do not leave a dangling sk pointer in ieee802154_create()
Date: Sun, 24 Nov 2024 08:56:41 -0500
Message-ID: <20241124135709.3351371-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124135709.3351371-1-sashal@kernel.org>
References: <20241124135709.3351371-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.324
Content-Transfer-Encoding: 8bit

From: Ignat Korchagin <ignat@cloudflare.com>

[ Upstream commit b4fcd63f6ef79c73cafae8cf4a114def5fc3d80d ]

sock_init_data() attaches the allocated sk object to the provided sock
object. If ieee802154_create() fails later, the allocated sk object is
freed, but the dangling pointer remains in the provided sock object, which
may allow use-after-free.

Clear the sk pointer in the sock object on error.

Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
Link: https://patch.msgid.link/20241014153808.51894-6-ignat@cloudflare.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/ieee802154/socket.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/net/ieee802154/socket.c b/net/ieee802154/socket.c
index ee1536de5fca4..5dba3341e3f1f 100644
--- a/net/ieee802154/socket.c
+++ b/net/ieee802154/socket.c
@@ -1065,19 +1065,21 @@ static int ieee802154_create(struct net *net, struct socket *sock,
 
 	if (sk->sk_prot->hash) {
 		rc = sk->sk_prot->hash(sk);
-		if (rc) {
-			sk_common_release(sk);
-			goto out;
-		}
+		if (rc)
+			goto out_sk_release;
 	}
 
 	if (sk->sk_prot->init) {
 		rc = sk->sk_prot->init(sk);
 		if (rc)
-			sk_common_release(sk);
+			goto out_sk_release;
 	}
 out:
 	return rc;
+out_sk_release:
+	sk_common_release(sk);
+	sock->sk = NULL;
+	goto out;
 }
 
 static const struct net_proto_family ieee802154_family_ops = {
-- 
2.43.0


