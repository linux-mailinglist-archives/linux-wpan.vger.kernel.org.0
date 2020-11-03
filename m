Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9692A4B03
	for <lists+linux-wpan@lfdr.de>; Tue,  3 Nov 2020 17:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgKCQTL (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 3 Nov 2020 11:19:11 -0500
Received: from proxima.lasnet.de ([78.47.171.185]:43654 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgKCQTK (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 3 Nov 2020 11:19:10 -0500
Received: from localhost.localdomain (p200300e9d729b09a69789643056dba7d.dip0.t-ipconnect.de [IPv6:2003:e9:d729:b09a:6978:9643:56d:ba7d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id D810AC3DB1;
        Tue,  3 Nov 2020 17:19:08 +0100 (CET)
Subject: Re: [PATCH 23/30] net: ieee802154: ca8210: Fix incorrectly named
 function param doc
To:     Lee Jones <lee.jones@linaro.org>, davem@davemloft.net
Cc:     Harry Morris <h.morris@cascoda.com>,
        Alexander Aring <alex.aring@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org
References: <20201102114512.1062724-1-lee.jones@linaro.org>
 <20201102114512.1062724-24-lee.jones@linaro.org>
From:   Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <d21d7c3c-66f8-bcdb-cc9f-bd87c5dbd6e7@datenfreihafen.org>
Date:   Tue, 3 Nov 2020 17:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102114512.1062724-24-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello.

On 02.11.20 12:45, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/net/ieee802154/ca8210.c:724: warning: Function parameter or member 'cas_ctl' not described in 'ca8210_rx_done'
>   drivers/net/ieee802154/ca8210.c:724: warning: Excess function parameter 'cas_ctrl' description in 'ca8210_rx_done'
> 
> Cc: Harry Morris <h.morris@cascoda.com>
> Cc: Alexander Aring <alex.aring@gmail.com>
> Cc: Stefan Schmidt <stefan@datenfreihafen.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: linux-wpan@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>


Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt

