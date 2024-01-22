Return-Path: <linux-wpan+bounces-74-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617383702B
	for <lists+linux-wpan@lfdr.de>; Mon, 22 Jan 2024 19:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A671C28F8F
	for <lists+linux-wpan@lfdr.de>; Mon, 22 Jan 2024 18:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86115FBB9;
	Mon, 22 Jan 2024 18:08:25 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C145FF06
	for <linux-wpan@vger.kernel.org>; Mon, 22 Jan 2024 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705946905; cv=none; b=Zf8tNhP4bMFGItH2h1f/Ncj09eKJd9VyRsV1KUg+MFLFcfXLjPxE7Zzh94oBDQxiPta7kdS2NCV5VLx1UoPL+t/kyt6kGxewdub+zxWC6O+zWMxdkz/OZ2dElvQK+FVUtHBFOhuvCAGJSNC4HJ9cTWPkK8yPXWY7vXFT7ugcyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705946905; c=relaxed/simple;
	bh=F9z6aShlF2QVCfyIAngRvio0THfTtO+tvcHMyVGuSz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n8myQFPDj6iEdm6FWnxqajaZj/uhhdfRx73g2WDxwui/VLak7e72ZyWoxAXgftpVNML5aX0uumxL9lXvwpbNZmHQMHYaD+Ozu7wIphhY/d3JGrtdpoXzpysXrGGw4OeVOl0km3q5dN0oW2CzoWaTaDPwoBVuoniDE7RFkgDzzrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiV-0001lS-9L; Mon, 22 Jan 2024 19:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiT-001ePK-1S; Mon, 22 Jan 2024 19:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiS-005Zwr-35;
	Mon, 22 Jan 2024 19:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH v2 02/33] ieee802154: ca8210: Follow renaming of SPI "master" to "controller"
Date: Mon, 22 Jan 2024 19:06:57 +0100
Message-ID:  <145fba5c430e40114ab861229e52efd3ff941e42.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=F9z6aShlF2QVCfyIAngRvio0THfTtO+tvcHMyVGuSz0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7FVmfdtureI6sxPVMY6mRDi6HC1bOGCaYo8 G3mpHn9EKWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6uxQAKCRCPgPtYfRL+ TtWhB/9+7G/MH1SST//skhGiMv8T5+wus+BYEukTNVSQ8eXV++0yK/07/nbUrG6IA+XvuhzXEN1 kJorilUWP6IuTYOdgH8hCrJx2HRm9kvraRtQmk+/vwv7FF1NOowH6iXoMy09hXSF6oFCUDIaEan rrOp8pWvpTsWtzkmYd69k0TmERigqR7aOMuWNah37vGbu/9A9jU00PazBmRi288M/EdW0a0NwCr NzDj70SfJj/2Atr/ox7BDC+/OE8nTuleefMTyID21jU2n3JH2LdOXrl/HhFAjyANoKekhKDYbOU 5JprN0QYTepsJ9gpOY8VGmi76W17yj0jyU9H+cVBrz7DyqS+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-wpan@vger.kernel.org

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Reviewed-by: Simon Horman <horms@kernel.org>
Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ieee802154/ca8210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 4ec0dab38872..f732c150462b 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -2956,7 +2956,7 @@ static int ca8210_test_interface_init(struct ca8210_priv *priv)
 		node_name,
 		sizeof(node_name),
 		"ca8210@%d_%d",
-		priv->spi->master->bus_num,
+		priv->spi->controller->bus_num,
 		spi_get_chipselect(priv->spi, 0)
 	);
 
-- 
2.43.0


