Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38747F1112
	for <lists+linux-wpan@lfdr.de>; Mon, 20 Nov 2023 12:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjKTLAg (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 20 Nov 2023 06:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbjKTLAf (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 20 Nov 2023 06:00:35 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E999C;
        Mon, 20 Nov 2023 03:00:28 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5008FF812;
        Mon, 20 Nov 2023 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1700478026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pt4xcwjAMZycHGqUXwrPbI86jxXmr6eVAEyF7+vRdQ0=;
        b=BBIePwEdX7R+YqkU3zQspg6wbrvbAYlYTbwjP2sT2+vQ0aWe4WlN8I7Np10mSv8EFIR38t
        0nMkThZq0Sx4GR46wwuZVyPW1w2GwEb0an6JSp3ugym8z2/J6EKqycIGWcbVY0So139n5O
        zCDsK5uu/WWcYfr6VNc1az51/XTi79hx6gad+l0OH2zNjUrM2S6+5tuFGTbl21cR/Tlg5j
        8s4T7YF6ex5gNMrpulbkcItoDI3SKk/6KXzvwTte6N9fsktJFErqrRg61QEU+RA2oaPrm2
        EFxrFzTnl2lC1GHTYxUU8NfN27gbZuXKG5VC/tv3OWx07CeIHoGLQO88gAdDHQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Guilhem Imberton <guilhem.imberton@qorvo.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH wpan-next v5 10/11] mac802154: Handle disassociation notifications from peers
Date:   Mon, 20 Nov 2023 12:00:21 +0100
Message-Id: <20231120110021.3807974-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927181214.129346-11-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-wpan-patch-notification: thanks
X-linux-wpan-patch-commit: b'1e2a45f1f854ce63c114b42298ea686dce9ae4fd'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Wed, 2023-09-27 at 18:12:13 UTC, Miquel Raynal wrote:
> Peers may decided to disassociate from us, their coordinator, in this
> case they will send a disassociation notification which we must
> acknowledge. If we don't, the peer device considers itself disassociated
> anyway. We also need to drop the reference to this child from our
> internal structures.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next.git staging.

Miquel
