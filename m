Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3417A5A52EF
	for <lists+linux-wpan@lfdr.de>; Mon, 29 Aug 2022 19:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiH2RQM (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 29 Aug 2022 13:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbiH2RQJ (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 29 Aug 2022 13:16:09 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0FC78BCD
        for <linux-wpan@vger.kernel.org>; Mon, 29 Aug 2022 10:16:07 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-324ec5a9e97so212284617b3.7
        for <linux-wpan@vger.kernel.org>; Mon, 29 Aug 2022 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Gx2HQD0tpQBbdWem1ACm9Xo5vyJERkm6qbJN/TC6ltY=;
        b=B7Tf35tRw6Fx3gjD21CLlEspBY/2Z8HSGoqTK8Tg9huokbrUtPaH6Z/cspLcFc2SNf
         3/3ARPjswphIwIvNvWYPPjCkREnm7BJPdfPKcyMIzqQDeD5Rt58E2HCCC6O5CdcJw7fx
         3nVMdy7zdOP5tqdQ11duqwxnvNcgy4sMU6BEuaR9pH2DBqSd4YA5yPcZ5+k5aIeHuba3
         /xYlUKvo8dzzt8BAFRJvUBh3ps/CzBBtVypB1yGWGzJniKIxqdbvZE2ma4XLkS1PBNGz
         KPsAAwDHZFdr4fz3sWKY0C3m9nsSfdJOVcMi6nTm0ONhvfELwFicDBEENKmeoDNhs7+I
         dMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Gx2HQD0tpQBbdWem1ACm9Xo5vyJERkm6qbJN/TC6ltY=;
        b=qM6bNcoUxNGaS1R817rgJHQl/pWYm8I+6WivL/02a5Y8rOkWp3JhwyUUgmB4mGp1ND
         S7BZh/xAA8nMt3f2oG78/3K2eeOsHsuvvssJFYK0NQIp2xxe0LvYPbVCdbuv/Zkp4e+S
         S+0azQU5p7Iv0bpQSN3eeejfw1FTiuc9oTIopq62dtLDFz20jNnqcYUwLSobzdy1AXtl
         Mta0yrMNSs67/G2WWoM8QwI3shJPmGcknS2GR2kiRUFZAYpclhgVTENydSDa9mnAb+ba
         tRWte+HGY8Au4cMfM7rjjPyP2jWyG4CSNqR29EqzfHedgmflNNOSXalHZzTXjqwWPqgX
         WKbQ==
X-Gm-Message-State: ACgBeo2hoZ5o3WJyIYUskBRnUahACU4mNhsARFvJYK445SDELQ98C4uU
        GZe8hxvq9m8oU4yP56Kgityt2eUUwt1FtSDabjZs+A==
X-Google-Smtp-Source: AA6agR4s3M6fT1YIBYTzPwf5QgHCTKfc8Go4cV5CsmWe7M8dZfI4OnqvJFUMFUCnQ0aNZD5HzxPJuzguDe5979zEuYc=
X-Received: by 2002:a0d:c681:0:b0:33c:2e21:4756 with SMTP id
 i123-20020a0dc681000000b0033c2e214756mr10499738ywd.467.1661793366537; Mon, 29
 Aug 2022 10:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220829114739.GA2436@debian>
In-Reply-To: <20220829114739.GA2436@debian>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 29 Aug 2022 10:15:55 -0700
Message-ID: <CANn89iL0hCwDKGquYyGvriPEc+GXSzf+UuZG4vb0Ah-NaVL7cA@mail.gmail.com>
Subject: Re: [PATCH 4/4] net-next: frags: dynamic timeout under load
To:     Richard Gobert <richardbgobert@gmail.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        Martin KaFai Lau <kafai@fb.com>,
        netdev <netdev@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-wpan@vger.kernel.org,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Mon, Aug 29, 2022 at 4:49 AM Richard Gobert <richardbgobert@gmail.com> wrote:
>
> Calculate a dynamic fragment reassembly timeout, taking into
> consideration the current fqdir load and the load introduced by
> the peer. Reintroduce low_thresh, which now acts as a knob for
> adjusting per-peer memory limits.
>
> Signed-off-by: Richard Gobert <richardbgobert@gmail.com>
> ---
>  Documentation/networking/ip-sysctl.rst |  3 +++
>  include/net/inet_frag.h                |  1 +
>  net/ipv4/inet_fragment.c               | 30 +++++++++++++++++++++++++-
>  net/ipv4/ip_fragment.c                 |  2 +-
>  4 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index 56cd4ea059b2..fb25aa6e22a2 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -247,6 +247,9 @@ ipfrag_low_thresh - LONG INTEGER
>         begins to remove incomplete fragment queues to free up resources.
>         The kernel still accepts new fragments for defragmentation.
>
> +       (Since linux-6.1)
> +       Maximum memory used to reassemble IP fragments sent by a single peer.
> +
>  ipfrag_time - INTEGER
>         Time in seconds to keep an IP fragment in memory.
>
> diff --git a/include/net/inet_frag.h b/include/net/inet_frag.h
> index 077a0ec78a58..595a6db57a0e 100644
> --- a/include/net/inet_frag.h
> +++ b/include/net/inet_frag.h
> @@ -99,6 +99,7 @@ struct inet_frag_queue {
>         u16                     max_size;
>         struct fqdir            *fqdir;
>         struct inet_peer        *peer;
> +       u64                     timeout;

Why u64 ?

This is not what the timer interface uses (look at mod_timer(), it
uses "unsigned long")

>         struct rcu_head         rcu;
>  };
>
> diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
> index 8b8d77d548d4..34c5ebba4951 100644
> --- a/net/ipv4/inet_fragment.c
> +++ b/net/ipv4/inet_fragment.c
> @@ -314,6 +314,30 @@ void inet_frag_free(struct inet_frag_queue *q)
>         call_rcu(&q->rcu, inet_frag_destroy_rcu);
>  }
>
> +static int inet_frag_update_timeout(struct inet_frag_queue *q)
> +{
> +       u64 peer_timeout, inet_timeout;
> +       long peer_mem, inet_mem;
> +       long high_thresh = READ_ONCE(q->fqdir->high_thresh);
> +       long low_thresh  = READ_ONCE(q->fqdir->low_thresh);
> +       u64 base_timeout = READ_ONCE(q->fqdir->timeout);
> +
> +       peer_mem = low_thresh - peer_mem_limit(q);
> +       inet_mem = high_thresh - frag_mem_limit(q->fqdir);
> +
> +       if (peer_mem <= 0 || inet_mem <= 0)
> +               return -ENOMEM;
> +
> +       /* Timeout changes linearly with respect to the amount of free memory.
> +        * Choose the more permissive of the two timeouts, to avoid limiting
> +        * the system while there is still enough memory.
> +        */
> +       peer_timeout = div64_long(base_timeout * peer_mem, low_thresh);
> +       inet_timeout = div64_long(base_timeout * inet_mem, high_thresh);
> +       q->timeout = max_t(u64, peer_timeout, inet_timeout);

If/when under load, timeout is close to zero,
we would fire many timers (increased system load) and make impossible
for datagrams to complete.

In contrast, a reasonable timer and probabilistic drops of new datagrams
when the queue is full lets some datagrams to complete.

Make sure to test your change under a real DDOS, not only non malicious netperf

> +       return 0;
> +}
> +
>  void inet_frag_destroy(struct inet_frag_queue *q)
>  {
>         struct fqdir *fqdir;
> @@ -346,6 +370,10 @@ static struct inet_frag_queue *inet_frag_alloc(struct fqdir *fqdir,
>
>         q->fqdir = fqdir;
>         f->constructor(q, arg);
> +       if (inet_frag_update_timeout(q)) {
> +               inet_frag_free(q);
> +               return NULL;
> +       }
>         add_frag_mem_limit(q, f->qsize);
>
>         timer_setup(&q->timer, f->frag_expire, 0);
> @@ -367,7 +395,7 @@ static struct inet_frag_queue *inet_frag_create(struct fqdir *fqdir,
>                 *prev = ERR_PTR(-ENOMEM);
>                 return NULL;
>         }
> -       mod_timer(&q->timer, jiffies + fqdir->timeout);
> +       mod_timer(&q->timer, jiffies + q->timeout);
>
>         *prev = rhashtable_lookup_get_insert_key(&fqdir->rhashtable, &q->key,
>                                                  &q->node, f->rhash_params);
> diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
> index e35061f6aadb..88a99242d721 100644
> --- a/net/ipv4/ip_fragment.c
> +++ b/net/ipv4/ip_fragment.c
> @@ -236,7 +236,7 @@ static int ip_frag_reinit(struct ipq *qp)
>  {
>         unsigned int sum_truesize = 0;
>
> -       if (!mod_timer(&qp->q.timer, jiffies + qp->q.fqdir->timeout)) {
> +       if (!mod_timer(&qp->q.timer, jiffies + qp->q.timeout)) {
>                 refcount_inc(&qp->q.refcnt);
>                 return -ETIMEDOUT;
>         }
> --
> 2.36.1
>
