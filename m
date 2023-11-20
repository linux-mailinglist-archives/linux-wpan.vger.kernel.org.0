Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D51D7F1118
	for <lists+linux-wpan@lfdr.de>; Mon, 20 Nov 2023 12:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjKTLAv (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 20 Nov 2023 06:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbjKTLAu (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 20 Nov 2023 06:00:50 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BB09D;
        Mon, 20 Nov 2023 03:00:43 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7029FF819;
        Mon, 20 Nov 2023 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1700478042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HY0cOjnTk0cP42r9GGzJwxyjVdJbgtLoifU4IuGCSd4=;
        b=E6QqkROAH3frSPYOanrFRDr7PxFSQc6zI+vfWtVxlyU+Xp4cpXRQFOVUss4lsvG/n4D24E
        Pngle3AOb5K90o7zIHBYy8t1zT4pThMKSM6vg9+YOmdozPEroRrwba9+poKntcdMElM90w
        0kHLId5bZMuc0ZYnT4jFhUa0PbWJybh+AO8DTS26TVhKVWrjSfM2KDfigRMpgQsRRBEFlp
        4yC5vP9kadMAjhsGHzPOpDsNzO34p1ldrK7bWaw1QUvGOu7Ltnur09HfDsll7eJRGCk2m9
        PxVkjmmYsLF5BZEm/gJqswPJqszyXF0nhDy0l0kMpfDqS5fu3Bwj1/V88TImxg==
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
Subject: Re: [PATCH wpan-next v5 06/11] mac802154: Handle disassociations
Date:   Mon, 20 Nov 2023 12:00:41 +0100
Message-Id: <20231120110041.3808118-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927181214.129346-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-wpan-patch-notification: thanks
X-linux-wpan-patch-commit: b'9860d9be89f420f3793fb798faadea11c723e08a'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Wed, 2023-09-27 at 18:12:09 UTC, Miquel Raynal wrote:
> Devices may decide to disassociate from their coordinator for different
> reasons (device turning off, coordinator signal strength too low, etc),
> the MAC layer just has to send a disassociation notification.
> 
> If the ack of the disassociation notification is not received, the
> device may consider itself disassociated anyway.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next.git staging.

Miquel
