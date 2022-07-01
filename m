Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872EC5635D7
	for <lists+linux-wpan@lfdr.de>; Fri,  1 Jul 2022 16:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbiGAOiV (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 1 Jul 2022 10:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbiGAOh5 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 1 Jul 2022 10:37:57 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D51A3DA5C
        for <linux-wpan@vger.kernel.org>; Fri,  1 Jul 2022 07:34:42 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EBB79200004;
        Fri,  1 Jul 2022 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656686081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lEaI1Ym2paejQwXNvmzOV2cHFz6vGMqUYVMWC/hHsjg=;
        b=Rmm4Th8fJBD5DEIalvVMekYfZTJ48t2Aj7cI8N7iqs/if+io2y30/8G5zaSaZPf5Mjejn3
        tCkapO55Y2kuuz5XvuFToA65kX0D3knSH3bRtx2ibmySCh/Qayx5uadLqfg52d8gHaWYWa
        Xuhi+c9izLB9AEC7o8nKQaMjReTV72mYT+aAUXaN8mKQyb+SlEHEZpTkdgGKay+hnKK0Er
        iqXjShNyeTsgSYqnUdX/oMYP/0yVeNXGsI4XEKaYdRJHdbSVLTDAXi3/xKa0CsKdfpFcjb
        iFLPHlXEaBCcJQzT8CM4IfBwJRN7Vh9YnPJerbMinW6sagtVJBDDEJxt1NPTtQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH wpan-tools 4/7] iwpan: Remove duplicated SECTION
Date:   Fri,  1 Jul 2022 16:34:31 +0200
Message-Id: <20220701143434.1267864-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701143434.1267864-1-miquel.raynal@bootlin.com>
References: <20220701143434.1267864-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

From: David Girault <david.girault@qorvo.com>

This section has been duplicated, drop one.

Signed-off-by: David Girault <david.girault@qorvo.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 src/iwpan.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/src/iwpan.h b/src/iwpan.h
index 9d265c6..406940a 100644
--- a/src/iwpan.h
+++ b/src/iwpan.h
@@ -90,12 +90,6 @@ struct cmd {
 		.handler = (_handler),					\
 		.help = (_help),					\
 	 }
-#define SECTION(_name)							\
-	struct cmd __section ## _ ## _name				\
-	__attribute__((used)) __attribute__((section("__cmd"))) = {	\
-		.name = (#_name),					\
-		.hidden = 1,						\
-	}
 
 #define SECTION(_name)							\
 	struct cmd __section ## _ ## _name				\
-- 
2.34.1

