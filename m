Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7738B1FA94C
	for <lists+linux-wpan@lfdr.de>; Tue, 16 Jun 2020 08:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgFPG6h (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 16 Jun 2020 02:58:37 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:41930 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgFPG6h (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 16 Jun 2020 02:58:37 -0400
Received: from localhost.localdomain.datenfreihafen.local (p200300e9d71c61de2d263da9f29fb60d.dip0.t-ipconnect.de [IPv6:2003:e9:d71c:61de:2d26:3da9:f29f:b60d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 42717C2016;
        Tue, 16 Jun 2020 08:58:34 +0200 (CEST)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
        alex.aring@gmail.com, Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH 2/2] MAINTAINERS: update ieee802154 project website URL
Date:   Tue, 16 Jun 2020 08:58:14 +0200
Message-Id: <20200616065814.816248-2-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200616065814.816248-1-stefan@datenfreihafen.org>
References: <20200616065814.816248-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Update URL to our new home.

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d76976b..6cd52c922bfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8225,7 +8225,7 @@ M:	Alexander Aring <alex.aring@gmail.com>
 M:	Stefan Schmidt <stefan@datenfreihafen.org>
 L:	linux-wpan@vger.kernel.org
 S:	Maintained
-W:	http://wpan.cakelab.org/
+W:	https://linux-wpan.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.git
 F:	Documentation/networking/ieee802154.rst
-- 
2.25.4

