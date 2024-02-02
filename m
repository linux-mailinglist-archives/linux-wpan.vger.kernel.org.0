Return-Path: <linux-wpan+bounces-93-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF254846877
	for <lists+linux-wpan@lfdr.de>; Fri,  2 Feb 2024 07:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1DE1C2542D
	for <lists+linux-wpan@lfdr.de>; Fri,  2 Feb 2024 06:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5821537144;
	Fri,  2 Feb 2024 06:45:30 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47623F8DA;
	Fri,  2 Feb 2024 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706856330; cv=none; b=VUOh54d9qz0oKV3lM03KuvkbIMWXp9OXtT5GMyfkELliPORipl5r1Lbe/Xc8Gvnq3ggYjLw/6DKI7qZ0hmTvdv/6MiH44rg92Nni79Zzaf+hgXsnjlfOvcsoxmyovNFD4fX2vA9RcEUagz6Ngt8j/uFRY2+ha1GPGxYgSjFd5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706856330; c=relaxed/simple;
	bh=fmnyRu7Ipc3UYUVl8ETKxQiY9bfbLiiGG4Vcth7QSt8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UVEJ3JD4eofASVmSEjpmssb7tWv5lhrSW7/oPEwcoTrUrXPH3vsnwKnvUvJjOoBwBRHouCZVwxMLZjoaafHDGSSZVzA1uZhVGz2znJDhs5p8LXeCwoEBwth2BN3mrr/bqeXzlr2oQne3Uugm6tjrRm9LvEOgxA1fkVD5utuoYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id YYV00016;
        Fri, 02 Feb 2024 14:45:16 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.34; Fri, 2 Feb 2024 14:45:15 +0800
From: Bo Liu <liubo03@inspur.com>
To: <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<miquel.raynal@bootlin.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>
CC: <linux-wpan@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH] net: ieee802154: at86rf230: convert to use maple tree register cache
Date: Fri, 2 Feb 2024 01:45:12 -0500
Message-ID: <20240202064512.39259-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
tUid: 2024202144516f4e2eedd30cd5fdc985ec7023f45e466
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/net/ieee802154/at86rf230.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/at86rf230.c b/drivers/net/ieee802154/at86rf230.c
index 164c7f605af5..6212164ffb36 100644
--- a/drivers/net/ieee802154/at86rf230.c
+++ b/drivers/net/ieee802154/at86rf230.c
@@ -316,7 +316,7 @@ static const struct regmap_config at86rf230_regmap_spi_config = {
 	.val_bits = 8,
 	.write_flag_mask = CMD_REG | CMD_WRITE,
 	.read_flag_mask = CMD_REG,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = AT86RF2XX_NUMREGS,
 	.writeable_reg = at86rf230_reg_writeable,
 	.readable_reg = at86rf230_reg_readable,
-- 
2.31.1


