Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 311DB73CD5C
	for <lists+linux-wpan@lfdr.de>; Sun, 25 Jun 2023 00:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjFXW7w (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sat, 24 Jun 2023 18:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjFXW7u (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Sat, 24 Jun 2023 18:59:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D231710
        for <linux-wpan@vger.kernel.org>; Sat, 24 Jun 2023 15:59:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7900860ACC
        for <linux-wpan@vger.kernel.org>; Sat, 24 Jun 2023 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B90BC433C8;
        Sat, 24 Jun 2023 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687647588;
        bh=V+gNb2uNPHlmhZbm6qx0eti88OFU//vFkN1Kk1bGWBw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=luFD2AG045S3VLKuq/PvQt5WeHmja152ItWptSxTg1Yj18qs1lKXc8KG8BfQX1IYA
         UsoBD6RzX+CpV75w2KldA5hJqomMkwPW6XA4k7gBp+G/6Vh08bddU3NCssBgurW3KQ
         QoTB7T8OeKrF8nLSuRTVyE0jOxdiiAjuc2l2PtdrZBEwFRtyFB7OrW9/MOqp3M1RNh
         15Nojc7vdi/u6RW/cvlUi5bbcHMwe5GJFggDiu3mqhutlZZ2dBEQiamnqBsOUVjoRC
         JdyoSHvTqO79P8PPEtNf4fO0Wlk4fG5CFre8YZnK/wHZ4E59Ci8uizSjXTdhNTqKfT
         vAELM7gvaVtIA==
Date:   Sat, 24 Jun 2023 15:59:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     davem@davemloft.net, pabeni@redhat.com, alex.aring@gmail.com,
        stefan@datenfreihafen.org, netdev@vger.kernel.org,
        linux-wpan@vger.kernel.org
Subject: Re: pull-request: ieee802154 for net-next 2023-06-23
Message-ID: <20230624155947.1b94903e@kernel.org>
In-Reply-To: <20230623195506.40b87b5f@xps-13>
References: <20230623195506.40b87b5f@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Fri, 23 Jun 2023 19:55:06 +0200 Miquel Raynal wrote:
> As you know, we are trying to build a wpan maintainers group so here is
> my first ieee802154 pull-request for your *net-next* tree.

Pulled thanks!

In the future, please try to avoid merging in tags from Linus's tree
directly. You can send a PR to net-next and fast forward, that results
in a more straightforward shape of the history, and avoids getting 
the back-merging wrong (Linus said a couple of times that any cross-
-merge must have an explanation in the commit message, for example).
