Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6947EBEA3
	for <lists+linux-wpan@lfdr.de>; Wed, 15 Nov 2023 09:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234675AbjKOIhf (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 15 Nov 2023 03:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbjKOIhf (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 15 Nov 2023 03:37:35 -0500
Received: from mail.tradestry.pl (mail.tradestry.pl [141.94.250.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B95E10D
        for <linux-wpan@vger.kernel.org>; Wed, 15 Nov 2023 00:37:32 -0800 (PST)
Received: by mail.tradestry.pl (Postfix, from userid 1002)
        id CC0C7A373C; Wed, 15 Nov 2023 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradestry.pl; s=mail;
        t=1700037450; bh=Y0HnXqH+26AP5Uq6M8BQXaj1HIAPQY/WndV9tkpAHHU=;
        h=Date:From:To:Subject:From;
        b=JEped5wBA0CroRLfx7U9PM5DoJg9SSS12dE5Vs9yb8OTKl1/z2OyK7B0IQUhFMdnq
         /440hPtXmo04r0tSuW4wrlfZEExaNHH8inWlfOceE9DZ4ySqSXFRNB6vGpoQ2AhPsh
         RZHP6dz7Px5zL6r05mLdeyaFDK+M5aXnwgxDFF9ch6BCZ1lcnGTqGAQKj7Gv1g2sCt
         EkuHuGuhQOVGNYxsqFRj+cJcSSPaRYsHYr7//bTk/nHkoKpQkzK08e8d+tiSnVy82G
         mWnUQ+CHDcEfuzGlvt5muRiVyQHNxHVQJzjSjqPoOHYBUs0NoDH8oJakP10C9sX+0N
         dZyPHUjPmAxAQ==
Received: by mail.tradestry.pl for <linux-wpan@vger.kernel.org>; Wed, 15 Nov 2023 08:36:04 GMT
Message-ID: <20231115074501-0.1.dp.1keef.0.sd0g873pne@tradestry.pl>
Date:   Wed, 15 Nov 2023 08:36:04 GMT
From:   "Damian Cichocki" <damian.cichocki@tradestry.pl>
To:     <linux-wpan@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.tradestry.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_ABUSE_SURBL,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: tradestry.pl]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: tradestry.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [141.94.250.68 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: tradestry.pl]
        * -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
        *      [score: 0.0114]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [141.94.250.68 listed in bl.score.senderscore.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Damian Cichocki
