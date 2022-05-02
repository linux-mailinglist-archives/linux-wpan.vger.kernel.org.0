Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13EA51777B
	for <lists+linux-wpan@lfdr.de>; Mon,  2 May 2022 21:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbiEBTkf (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 2 May 2022 15:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiEBTke (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 2 May 2022 15:40:34 -0400
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27CE65CF
        for <linux-wpan@vger.kernel.org>; Mon,  2 May 2022 12:37:03 -0700 (PDT)
Received: from [IPV6:2003:e9:d724:5eaf:7962:46e1:bce5:9013] (p200300e9d7245eaf796246e1bce59013.dip0.t-ipconnect.de [IPv6:2003:e9:d724:5eaf:7962:46e1:bce5:9013])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 1FAB8C0E5B;
        Mon,  2 May 2022 21:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
        s=2021; t=1651520222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ysKrDhbT0bF23lXTbZXxFN0Vq2Dwg8xLnY6Q8KZVEW4=;
        b=M0T11H/RrZ9N51oOQak3jkaO2aGufc+JU0cjj/OBQ6UC7XHC/LRAK2w4x+qQLhMnhN+Jq6
        LOZnOod2K3PCKIbNkKlIyOeHBF8HGwno04Wti313cCSutQqIhQIMT0gUzxpZNQ53RoFeds
        GnNkNqc7aQUt2zS9grwoBeOzZSV/KL/BgEByfTFpyowggfn106UgpSPbwX4ZwnLfGns0z8
        ZP7NCakz+MlqJuWbk55o+6FOeQt9EEVQQgru2VRuNUxcr4sExjDA7nYyMUUZGeJp+6swJb
        kS6tLVBQew0TEamxDAePw/+xyzLSeT+pUzS+0dClNpFD9u1Slr1no6Rs/Z8Ijw==
Message-ID: <5bf3530d-da2e-61e5-83ed-8f50ecb647ad@datenfreihafen.org>
Date:   Mon, 2 May 2022 21:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH bluetooth-next 2/3] net: 6lowpan: use array for find nhc
 id
Content-Language: en-US
To:     Alexander Aring <aahringo@redhat.com>,
        jukka.rissanen@linux.intel.com
Cc:     linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org,
        torvalds@linuxfoundation.org
References: <20220428030534.3220410-1-aahringo@redhat.com>
 <20220428030534.3220410-3-aahringo@redhat.com>
From:   Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20220428030534.3220410-3-aahringo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello.

On 28.04.22 05:05, Alexander Aring wrote:
> This patch will remove the complete overengineered and overthinking rb data
> structure for looking up the nhc by nhcid. Instead we using the existing
> nhc next header array and iterate over it. It works now for 1 byte values
> only. However there are only 1 byte nhc id values currently
> supported and IANA also does not specify large than 1 byte values yet.
> If there are 2 byte values for nhc ids specified we can revisit this
> data structure and add support for it.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>   net/6lowpan/nhc.c               | 91 +++++----------------------------
>   net/6lowpan/nhc.h               | 28 ++++------
>   net/6lowpan/nhc_dest.c          |  9 +---
>   net/6lowpan/nhc_fragment.c      |  9 +---
>   net/6lowpan/nhc_ghc_ext_dest.c  |  9 +---
>   net/6lowpan/nhc_ghc_ext_frag.c  | 11 +---
>   net/6lowpan/nhc_ghc_ext_hop.c   |  9 +---
>   net/6lowpan/nhc_ghc_ext_route.c |  9 +---
>   net/6lowpan/nhc_ghc_icmpv6.c    |  9 +---
>   net/6lowpan/nhc_ghc_udp.c       |  9 +---
>   net/6lowpan/nhc_hop.c           |  9 +---
>   net/6lowpan/nhc_ipv6.c          | 11 +---
>   net/6lowpan/nhc_mobility.c      |  9 +---
>   net/6lowpan/nhc_routing.c       |  9 +---
>   net/6lowpan/nhc_udp.c           |  9 +---
>   15 files changed, 37 insertions(+), 203 deletions(-)
> 
> diff --git a/net/6lowpan/nhc.c b/net/6lowpan/nhc.c
> index d6bbbd4ab38b..019f121b2449 100644
> --- a/net/6lowpan/nhc.c
> +++ b/net/6lowpan/nhc.c
> @@ -12,77 +12,26 @@
>   
>   #include "nhc.h"
>   
> -static struct rb_root rb_root = RB_ROOT;
>   static struct lowpan_nhc *lowpan_nexthdr_nhcs[NEXTHDR_MAX + 1];
>   static DEFINE_SPINLOCK(lowpan_nhc_lock);
>   
> -static int lowpan_nhc_insert(struct lowpan_nhc *nhc)
> +static struct lowpan_nhc *lowpan_nhc_by_nhcid(struct sk_buff *skb)
>   {
> -	struct rb_node **new = &rb_root.rb_node, *parent = NULL;
> -
> -	/* Figure out where to put new node */
> -	while (*new) {
> -		struct lowpan_nhc *this = rb_entry(*new, struct lowpan_nhc,
> -						   node);
> -		int result, len_dif, len;
> -
> -		len_dif = nhc->idlen - this->idlen;
> -
> -		if (nhc->idlen < this->idlen)
> -			len = nhc->idlen;
> -		else
> -			len = this->idlen;
> -
> -		result = memcmp(nhc->id, this->id, len);
> -		if (!result)
> -			result = len_dif;
> -
> -		parent = *new;
> -		if (result < 0)
> -			new = &((*new)->rb_left);
> -		else if (result > 0)
> -			new = &((*new)->rb_right);
> -		else
> -			return -EEXIST;
> -	}
> +	struct lowpan_nhc *nhc;
> +	int i;
> +	u8 id;
>   
> -	/* Add new node and rebalance tree. */
> -	rb_link_node(&nhc->node, parent, new);
> -	rb_insert_color(&nhc->node, &rb_root);
> +	if (!pskb_may_pull(skb, 1))
> +		return NULL;
>   
> -	return 0;
> -}
> +	id = *skb->data;
>   
> -static void lowpan_nhc_remove(struct lowpan_nhc *nhc)
> -{
> -	rb_erase(&nhc->node, &rb_root);
> -}
> +	for (i = 0; i < NEXTHDR_MAX + 1; i++) {
> +		nhc = lowpan_nexthdr_nhcs[i];
> +		if (!nhc)
> +			continue;
>   
> -static struct lowpan_nhc *lowpan_nhc_by_nhcid(const struct sk_buff *skb)
> -{
> -	struct rb_node *node = rb_root.rb_node;
> -	const u8 *nhcid_skb_ptr = skb->data;
> -
> -	while (node) {
> -		struct lowpan_nhc *nhc = rb_entry(node, struct lowpan_nhc,
> -						  node);
> -		u8 nhcid_skb_ptr_masked[LOWPAN_NHC_MAX_ID_LEN];
> -		int result, i;
> -
> -		if (nhcid_skb_ptr + nhc->idlen > skb->data + skb->len)
> -			return NULL;
> -
> -		/* copy and mask afterwards the nhid value from skb */
> -		memcpy(nhcid_skb_ptr_masked, nhcid_skb_ptr, nhc->idlen);
> -		for (i = 0; i < nhc->idlen; i++)
> -			nhcid_skb_ptr_masked[i] &= nhc->idmask[i];
> -
> -		result = memcmp(nhcid_skb_ptr_masked, nhc->id, nhc->idlen);
> -		if (result < 0)
> -			node = node->rb_left;
> -		else if (result > 0)
> -			node = node->rb_right;
> -		else
> +		if ((id & nhc->idmask) == nhc->id)
>   			return nhc;
>   	}
>   
> @@ -191,16 +140,7 @@ int lowpan_nhc_do_uncompression(struct sk_buff *skb,
>   
>   int lowpan_nhc_add(struct lowpan_nhc *nhc)
>   {
> -	int ret;
> -
> -	if (!nhc->idlen || !nhc->idsetup)
> -		return -EINVAL;
> -
> -	WARN_ONCE(nhc->idlen > LOWPAN_NHC_MAX_ID_LEN,
> -		  "LOWPAN_NHC_MAX_ID_LEN should be updated to %zd.\n",
> -		  nhc->idlen);
> -
> -	nhc->idsetup(nhc);
> +	int ret = 0;
>   
>   	spin_lock_bh(&lowpan_nhc_lock);
>   
> @@ -209,10 +149,6 @@ int lowpan_nhc_add(struct lowpan_nhc *nhc)
>   		goto out;
>   	}
>   
> -	ret = lowpan_nhc_insert(nhc);
> -	if (ret < 0)
> -		goto out;
> -
>   	lowpan_nexthdr_nhcs[nhc->nexthdr] = nhc;
>   out:
>   	spin_unlock_bh(&lowpan_nhc_lock);
> @@ -224,7 +160,6 @@ void lowpan_nhc_del(struct lowpan_nhc *nhc)
>   {
>   	spin_lock_bh(&lowpan_nhc_lock);
>   
> -	lowpan_nhc_remove(nhc);
>   	lowpan_nexthdr_nhcs[nhc->nexthdr] = NULL;
>   
>   	spin_unlock_bh(&lowpan_nhc_lock);
> diff --git a/net/6lowpan/nhc.h b/net/6lowpan/nhc.h
> index 2ac7da388c4d..9df602a632bd 100644
> --- a/net/6lowpan/nhc.h
> +++ b/net/6lowpan/nhc.h
> @@ -16,24 +16,20 @@
>    * @_name: const char * of common header compression name.
>    * @_nexthdr: ipv6 nexthdr field for the header compression.
>    * @_nexthdrlen: ipv6 nexthdr len for the reserved space.
> - * @_idsetup: callback to setup id and mask values.
> - * @_idlen: len for the next header id and mask, should be always the same.
> + * @_id: one byte nhc id value.
> + * @_idmask: one byte nhc id mask value.
>    * @_uncompress: callback for uncompression call.
>    * @_compress: callback for compression call.
>    */
>   #define LOWPAN_NHC(__nhc, _name, _nexthdr,	\
> -		   _hdrlen, _idsetup, _idlen,	\
> +		   _hdrlen, _id, _idmask,	\
>   		   _uncompress, _compress)	\
> -static u8 __nhc##_val[_idlen];			\
> -static u8 __nhc##_mask[_idlen];			\
>   static struct lowpan_nhc __nhc = {		\
>   	.name		= _name,		\
>   	.nexthdr	= _nexthdr,		\
>   	.nexthdrlen	= _hdrlen,		\
> -	.id		= __nhc##_val,		\
> -	.idmask		= __nhc##_mask,		\
> -	.idlen		= _idlen,		\
> -	.idsetup	= _idsetup,		\
> +	.id		= _id,			\
> +	.idmask		= _idmask,		\
>   	.uncompress	= _uncompress,		\
>   	.compress	= _compress,		\
>   }
> @@ -53,27 +49,21 @@ module_exit(__nhc##_exit);
>   /**
>    * struct lowpan_nhc - hold 6lowpan next hdr compression ifnformation
>    *
> - * @node: holder for the rbtree.
>    * @name: name of the specific next header compression
>    * @nexthdr: next header value of the protocol which should be compressed.
>    * @nexthdrlen: ipv6 nexthdr len for the reserved space.
> - * @id: array for nhc id. Note this need to be in network byteorder.
> - * @mask: array for nhc id mask. Note this need to be in network byteorder.
> - * @len: the length of the next header id and mask.
> - * @setup: callback to setup fill the next header id value and mask.
> + * @id: one byte nhc id value.
> + * @idmask: one byte nhc id mask value.
>    * @compress: callback to do the header compression.
>    * @uncompress: callback to do the header uncompression.
>    */
>   struct lowpan_nhc {
> -	struct rb_node	node;
>   	const char	*name;
>   	u8		nexthdr;
>   	size_t		nexthdrlen;
> -	u8		*id;
> -	u8		*idmask;
> -	size_t		idlen;
> +	u8		id;
> +	u8		idmask;
>   
> -	void		(*idsetup)(struct lowpan_nhc *nhc);
>   	int		(*uncompress)(struct sk_buff *skb, size_t needed);
>   	int		(*compress)(struct sk_buff *skb, u8 **hc_ptr);
>   };
> diff --git a/net/6lowpan/nhc_dest.c b/net/6lowpan/nhc_dest.c
> index 4768a9459212..0cbcc7806469 100644
> --- a/net/6lowpan/nhc_dest.c
> +++ b/net/6lowpan/nhc_dest.c
> @@ -6,18 +6,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_NHC_DEST_IDLEN	1
>   #define LOWPAN_NHC_DEST_ID_0	0xe6
>   #define LOWPAN_NHC_DEST_MASK_0	0xfe
>   
> -static void dest_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_DEST_ID_0;
> -	nhc->idmask[0] = LOWPAN_NHC_DEST_MASK_0;
> -}
> -
>   LOWPAN_NHC(nhc_dest, "RFC6282 Destination Options", NEXTHDR_DEST, 0,
> -	   dest_nhid_setup, LOWPAN_NHC_DEST_IDLEN, NULL, NULL);
> +	   LOWPAN_NHC_DEST_ID_0, LOWPAN_NHC_DEST_MASK_0,  NULL, NULL);
>   
>   module_lowpan_nhc(nhc_dest);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 Destination Options compression");
> diff --git a/net/6lowpan/nhc_fragment.c b/net/6lowpan/nhc_fragment.c
> index be85f07715bd..9414552df0ac 100644
> --- a/net/6lowpan/nhc_fragment.c
> +++ b/net/6lowpan/nhc_fragment.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_NHC_FRAGMENT_IDLEN	1
>   #define LOWPAN_NHC_FRAGMENT_ID_0	0xe4
>   #define LOWPAN_NHC_FRAGMENT_MASK_0	0xfe
>   
> -static void fragment_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_FRAGMENT_ID_0;
> -	nhc->idmask[0] = LOWPAN_NHC_FRAGMENT_MASK_0;
> -}
> -
>   LOWPAN_NHC(nhc_fragment, "RFC6282 Fragment", NEXTHDR_FRAGMENT, 0,
> -	   fragment_nhid_setup, LOWPAN_NHC_FRAGMENT_IDLEN, NULL, NULL);
> +	   LOWPAN_NHC_FRAGMENT_ID_0, LOWPAN_NHC_FRAGMENT_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(nhc_fragment);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 Fragment compression");
> diff --git a/net/6lowpan/nhc_ghc_ext_dest.c b/net/6lowpan/nhc_ghc_ext_dest.c
> index a9137f1733be..e4745ddd10a8 100644
> --- a/net/6lowpan/nhc_ghc_ext_dest.c
> +++ b/net/6lowpan/nhc_ghc_ext_dest.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_GHC_EXT_DEST_IDLEN	1
>   #define LOWPAN_GHC_EXT_DEST_ID_0	0xb6
>   #define LOWPAN_GHC_EXT_DEST_MASK_0	0xfe
>   
> -static void dest_ghid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_GHC_EXT_DEST_ID_0;
> -	nhc->idmask[0] = LOWPAN_GHC_EXT_DEST_MASK_0;
> -}
> -
>   LOWPAN_NHC(ghc_ext_dest, "RFC7400 Destination Extension Header", NEXTHDR_DEST,
> -	   0, dest_ghid_setup, LOWPAN_GHC_EXT_DEST_IDLEN, NULL, NULL);
> +	   0, LOWPAN_GHC_EXT_DEST_ID_0, LOWPAN_GHC_EXT_DEST_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(ghc_ext_dest);
>   MODULE_DESCRIPTION("6LoWPAN generic header destination extension compression");
> diff --git a/net/6lowpan/nhc_ghc_ext_frag.c b/net/6lowpan/nhc_ghc_ext_frag.c
> index d49b745918e0..220e5abfa946 100644
> --- a/net/6lowpan/nhc_ghc_ext_frag.c
> +++ b/net/6lowpan/nhc_ghc_ext_frag.c
> @@ -5,19 +5,12 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_GHC_EXT_FRAG_IDLEN	1
>   #define LOWPAN_GHC_EXT_FRAG_ID_0	0xb4
>   #define LOWPAN_GHC_EXT_FRAG_MASK_0	0xfe
>   
> -static void frag_ghid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_GHC_EXT_FRAG_ID_0;
> -	nhc->idmask[0] = LOWPAN_GHC_EXT_FRAG_MASK_0;
> -}
> -
>   LOWPAN_NHC(ghc_ext_frag, "RFC7400 Fragmentation Extension Header",
> -	   NEXTHDR_FRAGMENT, 0, frag_ghid_setup,
> -	   LOWPAN_GHC_EXT_FRAG_IDLEN, NULL, NULL);
> +	   NEXTHDR_FRAGMENT, 0, LOWPAN_GHC_EXT_FRAG_ID_0,
> +	   LOWPAN_GHC_EXT_FRAG_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(ghc_ext_frag);
>   MODULE_DESCRIPTION("6LoWPAN generic header fragmentation extension compression");
> diff --git a/net/6lowpan/nhc_ghc_ext_hop.c b/net/6lowpan/nhc_ghc_ext_hop.c
> index 3beedf5140a3..9b0de4da7379 100644
> --- a/net/6lowpan/nhc_ghc_ext_hop.c
> +++ b/net/6lowpan/nhc_ghc_ext_hop.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_GHC_EXT_HOP_IDLEN	1
>   #define LOWPAN_GHC_EXT_HOP_ID_0		0xb0
>   #define LOWPAN_GHC_EXT_HOP_MASK_0	0xfe
>   
> -static void hop_ghid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_GHC_EXT_HOP_ID_0;
> -	nhc->idmask[0] = LOWPAN_GHC_EXT_HOP_MASK_0;
> -}
> -
>   LOWPAN_NHC(ghc_ext_hop, "RFC7400 Hop-by-Hop Extension Header", NEXTHDR_HOP, 0,
> -	   hop_ghid_setup, LOWPAN_GHC_EXT_HOP_IDLEN, NULL, NULL);
> +	   LOWPAN_GHC_EXT_HOP_ID_0, LOWPAN_GHC_EXT_HOP_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(ghc_ext_hop);
>   MODULE_DESCRIPTION("6LoWPAN generic header hop-by-hop extension compression");
> diff --git a/net/6lowpan/nhc_ghc_ext_route.c b/net/6lowpan/nhc_ghc_ext_route.c
> index 70dc0ea3cf66..3e86faec59c9 100644
> --- a/net/6lowpan/nhc_ghc_ext_route.c
> +++ b/net/6lowpan/nhc_ghc_ext_route.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_GHC_EXT_ROUTE_IDLEN	1
>   #define LOWPAN_GHC_EXT_ROUTE_ID_0	0xb2
>   #define LOWPAN_GHC_EXT_ROUTE_MASK_0	0xfe
>   
> -static void route_ghid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_GHC_EXT_ROUTE_ID_0;
> -	nhc->idmask[0] = LOWPAN_GHC_EXT_ROUTE_MASK_0;
> -}
> -
>   LOWPAN_NHC(ghc_ext_route, "RFC7400 Routing Extension Header", NEXTHDR_ROUTING,
> -	   0, route_ghid_setup, LOWPAN_GHC_EXT_ROUTE_IDLEN, NULL, NULL);
> +	   0, LOWPAN_GHC_EXT_ROUTE_ID_0, LOWPAN_GHC_EXT_ROUTE_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(ghc_ext_route);
>   MODULE_DESCRIPTION("6LoWPAN generic header routing extension compression");
> diff --git a/net/6lowpan/nhc_ghc_icmpv6.c b/net/6lowpan/nhc_ghc_icmpv6.c
> index 339ceffc25a9..1634f3eb0be8 100644
> --- a/net/6lowpan/nhc_ghc_icmpv6.c
> +++ b/net/6lowpan/nhc_ghc_icmpv6.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_GHC_ICMPV6_IDLEN		1
>   #define LOWPAN_GHC_ICMPV6_ID_0		0xdf
>   #define LOWPAN_GHC_ICMPV6_MASK_0	0xff
>   
> -static void icmpv6_ghid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_GHC_ICMPV6_ID_0;
> -	nhc->idmask[0] = LOWPAN_GHC_ICMPV6_MASK_0;
> -}
> -
>   LOWPAN_NHC(ghc_icmpv6, "RFC7400 ICMPv6", NEXTHDR_ICMP, 0,
> -	   icmpv6_ghid_setup, LOWPAN_GHC_ICMPV6_IDLEN, NULL, NULL);
> +	   LOWPAN_GHC_ICMPV6_ID_0, LOWPAN_GHC_ICMPV6_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(ghc_icmpv6);
>   MODULE_DESCRIPTION("6LoWPAN generic header ICMPv6 compression");
> diff --git a/net/6lowpan/nhc_ghc_udp.c b/net/6lowpan/nhc_ghc_udp.c
> index f47fec601e73..4ac4813b77ad 100644
> --- a/net/6lowpan/nhc_ghc_udp.c
> +++ b/net/6lowpan/nhc_ghc_udp.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_GHC_UDP_IDLEN	1
>   #define LOWPAN_GHC_UDP_ID_0	0xd0
>   #define LOWPAN_GHC_UDP_MASK_0	0xf8
>   
> -static void udp_ghid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_GHC_UDP_ID_0;
> -	nhc->idmask[0] = LOWPAN_GHC_UDP_MASK_0;
> -}
> -
>   LOWPAN_NHC(ghc_udp, "RFC7400 UDP", NEXTHDR_UDP, 0,
> -	   udp_ghid_setup, LOWPAN_GHC_UDP_IDLEN, NULL, NULL);
> +	   LOWPAN_GHC_UDP_ID_0, LOWPAN_GHC_UDP_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(ghc_udp);
>   MODULE_DESCRIPTION("6LoWPAN generic header UDP compression");
> diff --git a/net/6lowpan/nhc_hop.c b/net/6lowpan/nhc_hop.c
> index 158fc1906327..182087dfd09d 100644
> --- a/net/6lowpan/nhc_hop.c
> +++ b/net/6lowpan/nhc_hop.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_NHC_HOP_IDLEN	1
>   #define LOWPAN_NHC_HOP_ID_0	0xe0
>   #define LOWPAN_NHC_HOP_MASK_0	0xfe
>   
> -static void hop_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_HOP_ID_0;
> -	nhc->idmask[0] = LOWPAN_NHC_HOP_MASK_0;
> -}
> -
>   LOWPAN_NHC(nhc_hop, "RFC6282 Hop-by-Hop Options", NEXTHDR_HOP, 0,
> -	   hop_nhid_setup, LOWPAN_NHC_HOP_IDLEN, NULL, NULL);
> +	   LOWPAN_NHC_HOP_ID_0, LOWPAN_NHC_HOP_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(nhc_hop);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 Hop-by-Hop Options compression");
> diff --git a/net/6lowpan/nhc_ipv6.c b/net/6lowpan/nhc_ipv6.c
> index 08b7589e5b38..20242360b1d4 100644
> --- a/net/6lowpan/nhc_ipv6.c
> +++ b/net/6lowpan/nhc_ipv6.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_NHC_IPV6_IDLEN	1
>   #define LOWPAN_NHC_IPV6_ID_0	0xee
>   #define LOWPAN_NHC_IPV6_MASK_0	0xfe
>   
> -static void ipv6_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_IPV6_ID_0;
> -	nhc->idmask[0] = LOWPAN_NHC_IPV6_MASK_0;
> -}
> -
> -LOWPAN_NHC(nhc_ipv6, "RFC6282 IPv6", NEXTHDR_IPV6, 0, ipv6_nhid_setup,
> -	   LOWPAN_NHC_IPV6_IDLEN, NULL, NULL);
> +LOWPAN_NHC(nhc_ipv6, "RFC6282 IPv6", NEXTHDR_IPV6, 0, LOWPAN_NHC_IPV6_ID_0,
> +	   LOWPAN_NHC_IPV6_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(nhc_ipv6);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 IPv6 compression");
> diff --git a/net/6lowpan/nhc_mobility.c b/net/6lowpan/nhc_mobility.c
> index ac8fca689828..1c31d872c804 100644
> --- a/net/6lowpan/nhc_mobility.c
> +++ b/net/6lowpan/nhc_mobility.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_NHC_MOBILITY_IDLEN	1
>   #define LOWPAN_NHC_MOBILITY_ID_0	0xe8
>   #define LOWPAN_NHC_MOBILITY_MASK_0	0xfe
>   
> -static void mobility_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_MOBILITY_ID_0;
> -	nhc->idmask[0] = LOWPAN_NHC_MOBILITY_MASK_0;
> -}
> -
>   LOWPAN_NHC(nhc_mobility, "RFC6282 Mobility", NEXTHDR_MOBILITY, 0,
> -	   mobility_nhid_setup, LOWPAN_NHC_MOBILITY_IDLEN, NULL, NULL);
> +	   LOWPAN_NHC_MOBILITY_ID_0, LOWPAN_NHC_MOBILITY_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(nhc_mobility);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 Mobility compression");
> diff --git a/net/6lowpan/nhc_routing.c b/net/6lowpan/nhc_routing.c
> index 1c174023de42..dae03ebf7021 100644
> --- a/net/6lowpan/nhc_routing.c
> +++ b/net/6lowpan/nhc_routing.c
> @@ -5,18 +5,11 @@
>   
>   #include "nhc.h"
>   
> -#define LOWPAN_NHC_ROUTING_IDLEN	1
>   #define LOWPAN_NHC_ROUTING_ID_0		0xe2
>   #define LOWPAN_NHC_ROUTING_MASK_0	0xfe
>   
> -static void routing_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_ROUTING_ID_0;
> -	nhc->idmask[0] = LOWPAN_NHC_ROUTING_MASK_0;
> -}
> -
>   LOWPAN_NHC(nhc_routing, "RFC6282 Routing", NEXTHDR_ROUTING, 0,
> -	   routing_nhid_setup, LOWPAN_NHC_ROUTING_IDLEN, NULL, NULL);
> +	   LOWPAN_NHC_ROUTING_ID_0, LOWPAN_NHC_ROUTING_MASK_0, NULL, NULL);
>   
>   module_lowpan_nhc(nhc_routing);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 Routing compression");
> diff --git a/net/6lowpan/nhc_udp.c b/net/6lowpan/nhc_udp.c
> index 33f17bd8cda7..0a506c77283d 100644
> --- a/net/6lowpan/nhc_udp.c
> +++ b/net/6lowpan/nhc_udp.c
> @@ -14,7 +14,6 @@
>   
>   #define LOWPAN_NHC_UDP_MASK		0xF8
>   #define LOWPAN_NHC_UDP_ID		0xF0
> -#define LOWPAN_NHC_UDP_IDLEN		1
>   
>   #define LOWPAN_NHC_UDP_4BIT_PORT	0xF0B0
>   #define LOWPAN_NHC_UDP_4BIT_MASK	0xFFF0
> @@ -169,14 +168,8 @@ static int udp_compress(struct sk_buff *skb, u8 **hc_ptr)
>   	return 0;
>   }
>   
> -static void udp_nhid_setup(struct lowpan_nhc *nhc)
> -{
> -	nhc->id[0] = LOWPAN_NHC_UDP_ID;
> -	nhc->idmask[0] = LOWPAN_NHC_UDP_MASK;
> -}
> -
>   LOWPAN_NHC(nhc_udp, "RFC6282 UDP", NEXTHDR_UDP, sizeof(struct udphdr),
> -	   udp_nhid_setup, LOWPAN_NHC_UDP_IDLEN, udp_uncompress, udp_compress);
> +	   LOWPAN_NHC_UDP_ID, LOWPAN_NHC_UDP_MASK, udp_uncompress, udp_compress);
>   
>   module_lowpan_nhc(nhc_udp);
>   MODULE_DESCRIPTION("6LoWPAN next header RFC6282 UDP compression");

Reviewed-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt
