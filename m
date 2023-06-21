Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1374D737FCF
	for <lists+linux-wpan@lfdr.de>; Wed, 21 Jun 2023 13:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjFUKvh (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 21 Jun 2023 06:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFUKuu (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 21 Jun 2023 06:50:50 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411F319B7
        for <linux-wpan@vger.kernel.org>; Wed, 21 Jun 2023 03:50:02 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f900cd3f96so45663675e9.2
        for <linux-wpan@vger.kernel.org>; Wed, 21 Jun 2023 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687344601; x=1689936601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSRkwHLFq+2I9Xiyi/hU6wMpRwozZdsPaoeIOTE25yg=;
        b=LHG91j66hqNxVU1IFJCH4yk0EAAT3k1ZxSKj+2yVzA0yRH5cjUml+CDtYdbeaAYCNz
         v1rcXtMnalkSBNzwEV1iWPZSbeaKXBPH+lieZ9P0TqKKbIrOiGwU9v6xzYDq3yUJ1za+
         NxZBmR0t8gBFeL6E612NUBX29cRxaNHz6ojGLHaQUgnYXOFH4BcYau6DqdhiuC1tq+cz
         ntBzUdOswctXaUFi6lT3gId8WP2sFT5Ah06Uv3Ny9Gf59HN+05OTyjoqCrK4VSWDqjFp
         WBrzhxVtabcNXa5TSF4JJOvUFJ93yEc+XUhXIRmFkEszE+enGtamSNNw8bfWLSBmigdh
         2ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687344601; x=1689936601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSRkwHLFq+2I9Xiyi/hU6wMpRwozZdsPaoeIOTE25yg=;
        b=A5b1+4cQwheqsEdQSYoSQpIx2PxW7RCaRQe5b5Jv02C5e/SUzbnsVypdsakgNxA82U
         CzkzkMfDGAl345JJC2n3aPQDI8Z2YOZBh0waAstj0fwuukRp5Oe1YR2/OFVcH23FEwOj
         CSeqXCFgbEh7y2U90yYNwp9XUymvJpXNaQ22/w+l35S8eiPZRSv+DtGL4CnjqZLeJUGH
         lAU5jnj5TRnYMTLTIyA76wBC7chz1wr/89x2oCNRDfpZiNIX2rm/jSQQDL/0pVn0BfJw
         pvWKwk0c6tcNHDglVkQCXW60qgovr7VYLGE+sgKdZZr/NpABxhmnkPLifG1xikoRfL2A
         N/9Q==
X-Gm-Message-State: AC+VfDwrd0+6z31GiYpJalWUwfn7XqH2goO2fBK0yWt60JyXo8dUt6Nf
        My2yT8zV6EAMLLKIlPgRHcy1mg==
X-Google-Smtp-Source: ACHHUZ4kGH8qImQSxaCquFokOidLojUiduGNeN6yC7xlAN8t9enaJAidhtFzyKegekb0YEbNp5wSRg==
X-Received: by 2002:a05:600c:a39f:b0:3f9:8da:bb4b with SMTP id hn31-20020a05600ca39f00b003f908dabb4bmr8183476wmb.37.1687344600642;
        Wed, 21 Jun 2023 03:50:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0ac900b003f7eeec829asm4670229wmr.10.2023.06.21.03.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:49:58 -0700 (PDT)
Date:   Wed, 21 Jun 2023 13:49:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Joel Granados <j.granados@samsung.com>
Cc:     mcgrof@kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        David Ahern <dsahern@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Joerg Reuter <jreuter@yaina.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        Roopa Prabhu <roopa@nvidia.com>,
        Nikolay Aleksandrov <razor@blackwall.org>,
        Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        Mat Martineau <martineau@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Julian Anastasov <ja@ssi.bg>,
        Remi Denis-Courmont <courmisch@gmail.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        David Howells <dhowells@redhat.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        Xin Long <lucien.xin@gmail.com>,
        Karsten Graul <kgraul@linux.ibm.com>,
        Wenjia Zhang <wenjia@linux.ibm.com>,
        Jan Karcher <jaka@linux.ibm.com>,
        Jon Maloy <jmaloy@redhat.com>,
        Ying Xue <ying.xue@windriver.com>,
        Martin Schiller <ms@dev.tdt.de>, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-hams@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, bridge@lists.linux-foundation.org,
        dccp@vger.kernel.org, linux-wpan@vger.kernel.org,
        mptcp@lists.linux.dev, lvs-devel@vger.kernel.org,
        rds-devel@oss.oracle.com, linux-afs@lists.infradead.org,
        linux-sctp@vger.kernel.org, linux-s390@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net, linux-x25@vger.kernel.org
Subject: Re: [PATCH 06/11] sysctl: Add size to register_net_sysctl function
Message-ID: <f95b7489-8654-435c-bc74-da1eac479fba@kadam.mountain>
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621091022eucas1p1c097da50842b23e902e1a674e117e1aa@eucas1p1.samsung.com>
 <20230621091000.424843-7-j.granados@samsung.com>
 <dab06c20-f8b0-4e34-b885-f3537e442d54@kadam.mountain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZFMDZBc9cnLbyP1u"
Content-Disposition: inline
In-Reply-To: <dab06c20-f8b0-4e34-b885-f3537e442d54@kadam.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org


--ZFMDZBc9cnLbyP1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 12:47:30PM +0300, Dan Carpenter wrote:
> The patchset doesn't include the actual interesting changes, just a
> bunch of mechanical prep work.
> 

I was wrong here, the patchset just hadn't all hit the mailing lists.
I can't apply this patchset to anything.  I tried linux-next, net, and
net-next.  So it's hard to review.

It looks like ensure_safe_net_sysctl() never got update to use
table_size...

You could easily write a static checker test to print a warning any time
that ->procname is checked for NULL.  I have attached a Smatch check.
You would need to added to check_list.h and recompile.

net/sysctl_net.c:130 ensure_safe_net_sysctl() warn: checking ->procname 'ent->procname'

regards,
dan carpenter


--ZFMDZBc9cnLbyP1u
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_checking_procname.c"

#include "smatch.h"
#include "smatch_slist.h"

static int my_id;

static void match_condition(struct expression *expr)
{
	char *member_name;

	if (expr->type == EXPR_COMPARE)
		return;

	member_name = get_member_name(expr);
	if (!member_name)
		return;

	if (strcmp(member_name, "(struct ctl_table)->procname") == 0)
		sm_warning("checking ->procname '%s'", expr_to_str(expr));
}

void check_checking_procname(int id)
{
	my_id = id;

	add_hook(&match_condition, CONDITION_HOOK);
}

--ZFMDZBc9cnLbyP1u--
