Return-Path: <linux-wpan+bounces-53-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B76827F7B
	for <lists+linux-wpan@lfdr.de>; Tue,  9 Jan 2024 08:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C2E61C240EF
	for <lists+linux-wpan@lfdr.de>; Tue,  9 Jan 2024 07:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF8B9455;
	Tue,  9 Jan 2024 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=datenfreihafen.org header.i=@datenfreihafen.org header.b="Oe5pkjpg"
X-Original-To: linux-wpan@vger.kernel.org
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45472CA7;
	Tue,  9 Jan 2024 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=datenfreihafen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=datenfreihafen.org
Received: from [192.168.2.51] (p4fe71516.dip0.t-ipconnect.de [79.231.21.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id AF4D2C0A59;
	Tue,  9 Jan 2024 08:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1704785122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNe9ZlBCrsGQDNGRO/EZYFgSAuSM/viVxnwrUNsgIog=;
	b=Oe5pkjpgoKtGNFVYkuPB99brMpJOImAsWBaA2eqU5WenfyHYMW/iExHsG3KdCmcR7asSQS
	Lg8VXIGL/72NQT5t8Njvky4asduboskvoh7LvGqo5QqAVFjCxJd1+bF51/6f4Nl6QpIPLd
	IOrKnZ5aTYyhcvr82Jr+4jiQTOI6FjJ5nVo8ZpVGs4Idyva6rViUn8vDD9qREyYB1ZCO2g
	eglJUHJXUIUFgZhKH7uaLmC/splfX5LkMwIYq46Du9Cfz6y8IFzlb5hA6nwP4GO4M9ATD2
	58aiPeK/8ESezJgCVfcTgc1kry/iiAbC6h67PC4hnYdiVW+rGJDySR+wlm2jmQ==
Message-ID: <45711bec-e0f3-43c2-b8f2-b9a55654710b@datenfreihafen.org>
Date: Tue, 9 Jan 2024 08:25:21 +0100
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 06/10] net: fill in MODULE_DESCRIPTION()s for
 ieee802154
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 Alexander Aring <alex.aring@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: netdev@vger.kernel.org,
 "open list:IEEE 802.15.4 SUBSYSTEM" <linux-wpan@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240108181610.2697017-1-leitao@debian.org>
 <20240108181610.2697017-7-leitao@debian.org>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20240108181610.2697017-7-leitao@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

On 08.01.24 19:16, Breno Leitao wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to ieee802154 modules.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>   net/ieee802154/6lowpan/core.c | 1 +
>   net/ieee802154/socket.c       | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/net/ieee802154/6lowpan/core.c b/net/ieee802154/6lowpan/core.c
> index 2c087b7f17c5..b88f6a96d961 100644
> --- a/net/ieee802154/6lowpan/core.c
> +++ b/net/ieee802154/6lowpan/core.c
> @@ -280,5 +280,6 @@ static void __exit lowpan_cleanup_module(void)
>   
>   module_init(lowpan_init_module);
>   module_exit(lowpan_cleanup_module);
> +MODULE_DESCRIPTION("IPv6 over Low power Wireless Personal Area Network IEEE802154.4 core");

If we want to nitpick you could write it as IEEE 802.15.4.

>   MODULE_LICENSE("GPL");
>   MODULE_ALIAS_RTNL_LINK("lowpan");
> diff --git a/net/ieee802154/socket.c b/net/ieee802154/socket.c
> index 00302e8b9615..db8df6e26159 100644
> --- a/net/ieee802154/socket.c
> +++ b/net/ieee802154/socket.c
> @@ -1137,4 +1137,5 @@ module_init(af_ieee802154_init);
>   module_exit(af_ieee802154_remove);
>   
>   MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("IEEE802154.4 socket interface");
>   MODULE_ALIAS_NETPROTO(PF_IEEE802154);

Same here.

Besides this:

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt

