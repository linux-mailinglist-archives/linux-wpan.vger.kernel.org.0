Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB2B35CBFD
	for <lists+linux-wpan@lfdr.de>; Mon, 12 Apr 2021 18:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244544AbhDLQ0a (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 12 Apr 2021 12:26:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:56938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243741AbhDLQYy (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Mon, 12 Apr 2021 12:24:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94677611AD;
        Mon, 12 Apr 2021 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618244672;
        bh=TM2eNXwdM8/2FBuHPPvrhSxBRj3u2wfaPPANwP0r8Hc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S5YVlDkDJcs+/gPTzMjqpBKgj6c9+ErwZPIMp4ZLwc1KJrswg94qqfKZszrDcK57l
         Y+WLlNMH7saR0n+MeJXGnJtn3wmwHicPHiZgHFpQUwPoksFHPuwy/VWjMdnRwYH7d5
         ABliaqnmcskzmVC66wXWCJlp7UJS3FkutJmEzE9DABgxDWvo9CeeRi/5ulKDkp0+Y3
         7zSfQHAq2G+Y3MtVE8XetItn+EhkqpgKq5ENEAxt4r2d/4PQlMvCEORGda2Fq1R3LH
         P4c+tSgs7O9epHYlWBrogVB7k4opWCxhmhQY2EQ980MSvZCagoHo17uMD3NYHJXy8e
         5QfjIPPD7yD+Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alexander Aring <aahringo@redhat.com>,
        syzbot+8b6719da8a04beeafcc3@syzkaller.appspotmail.com,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Sasha Levin <sashal@kernel.org>, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 24/46] net: ieee802154: forbid monitor for set llsec params
Date:   Mon, 12 Apr 2021 12:23:39 -0400
Message-Id: <20210412162401.314035-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162401.314035-1-sashal@kernel.org>
References: <20210412162401.314035-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 88c17855ac4291fb462e13a86b7516773b6c932e ]

This patch forbids to set llsec params for monitor interfaces which we
don't support yet.

Reported-by: syzbot+8b6719da8a04beeafcc3@syzkaller.appspotmail.com
Signed-off-by: Alexander Aring <aahringo@redhat.com>
Link: https://lore.kernel.org/r/20210405003054.256017-3-aahringo@redhat.com
Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/ieee802154/nl802154.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index e9e4652cd592..dd43aa03200e 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -1384,6 +1384,9 @@ static int nl802154_set_llsec_params(struct sk_buff *skb,
 	u32 changed = 0;
 	int ret;
 
+	if (wpan_dev->iftype == NL802154_IFTYPE_MONITOR)
+		return -EOPNOTSUPP;
+
 	if (info->attrs[NL802154_ATTR_SEC_ENABLED]) {
 		u8 enabled;
 
-- 
2.30.2

