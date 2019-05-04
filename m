Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B577113BD6
	for <lists+linux-wpan@lfdr.de>; Sat,  4 May 2019 20:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfEDSr4 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sat, 4 May 2019 14:47:56 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:34984 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfEDSr4 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Sat, 4 May 2019 14:47:56 -0400
Received: from localhost.localdomain (p200300E9D72A97CBC0C08D086B5F8945.dip0.t-ipconnect.de [IPv6:2003:e9:d72a:97cb:c0c0:8d08:6b5f:8945])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 25ECBCAB77;
        Sat,  4 May 2019 20:47:53 +0200 (CEST)
Subject: Re: [PATCH] ieee802154: hwsim: unregister hw while
 hwsim_subscribe_all_others fails
To:     Yue Haibing <yuehaibing@huawei.com>, alex.aring@gmail.com,
        davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wpan@vger.kernel.org
References: <20190428154810.40052-1-yuehaibing@huawei.com>
From:   Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <0747fdf8-1adf-d6f7-81ee-33cfe5519e00@datenfreihafen.org>
Date:   Sat, 4 May 2019 20:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190428154810.40052-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello.

On 28.04.19 17:48, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> KASAN report this:
> 
> kernel BUG at net/mac802154/main.c:130!
> invalid opcode: 0000 [#1] PREEMPT SMP
> CPU: 0 PID: 19932 Comm: modprobe Not tainted 5.1.0-rc6+ #22
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.3-0-ge2fc41e-prebuilt.qemu-project.org 04/01/2014
> RIP: 0010:ieee802154_free_hw+0x2a/0x30 [mac802154]
> Code: 55 48 8d 57 38 48 89 e5 53 48 89 fb 48 8b 47 38 48 39 c2 75 15 48 8d 7f 48 e8 82 85 16 e1 48 8b 7b 28 e8 f9 ef 83 e2 5b 5d c3 <0f> 0b 0f 1f 40 00 55 48 89 e5 53 48 89 fb 0f b6 86 80 00 00 00 88
> RSP: 0018:ffffc90001c7b9f0 EFLAGS: 00010206
> RAX: ffff88822df3aa80 RBX: ffff88823143d5c0 RCX: 0000000000000002
> RDX: ffff88823143d5f8 RSI: ffff88822b1fabc0 RDI: ffff88823143d5c0
> RBP: ffffc90001c7b9f8 R08: 0000000000000000 R09: 0000000000000001
> R10: 0000000000000000 R11: 0000000000000000 R12: 00000000fffffff4
> R13: ffff88822dea4f50 R14: ffff88823143d7c0 R15: 00000000fffffff4
> FS: 00007ff52e999540(0000) GS:ffff888237a00000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fdc06dba768 CR3: 000000023160a000 CR4: 00000000000006f0
> Call Trace:
>  hwsim_add_one+0x2dd/0x540 [mac802154_hwsim]
>  hwsim_probe+0x2f/0xb0 [mac802154_hwsim]
>  platform_drv_probe+0x3a/0x90
>  ? driver_sysfs_add+0x79/0xb0
>  really_probe+0x1d4/0x2d0
>  driver_probe_device+0x50/0xf0
>  device_driver_attach+0x54/0x60
>  __driver_attach+0x7e/0xd0
>  ? device_driver_attach+0x60/0x60
>  bus_for_each_dev+0x68/0xc0
>  driver_attach+0x19/0x20
>  bus_add_driver+0x15e/0x200
>  driver_register+0x5b/0xf0
>  __platform_driver_register+0x31/0x40
>  hwsim_init_module+0x74/0x1000 [mac802154_hwsim]
>  ? 0xffffffffa00e9000
>  do_one_initcall+0x6c/0x3cc
>  ? kmem_cache_alloc_trace+0x248/0x3b0
>  do_init_module+0x5b/0x1f1
>  load_module+0x1db1/0x2690
>  ? m_show+0x1d0/0x1d0
>  __do_sys_finit_module+0xc5/0xd0
>  __x64_sys_finit_module+0x15/0x20
>  do_syscall_64+0x6b/0x1d0
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7ff52e4a2839
> Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1f f6 2c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffffa7b3c08 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 00005647560a2a00 RCX: 00007ff52e4a2839
> RDX: 0000000000000000 RSI: 00005647547f3c2e RDI: 0000000000000003
> RBP: 00005647547f3c2e R08: 0000000000000000 R09: 00005647560a2a00
> R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
> R13: 00005647560a2c10 R14: 0000000000040000 R15: 00005647560a2a00
> Modules linked in: mac802154_hwsim(+) mac802154 [last unloaded: mac802154_hwsim]
> 
> In hwsim_add_one, if hwsim_subscribe_all_others fails, we
> should call ieee802154_unregister_hw to free resources.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ieee802154/mac802154_hwsim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
> index c2b6ffb..3d9ffd2 100644
> --- a/drivers/net/ieee802154/mac802154_hwsim.c
> +++ b/drivers/net/ieee802154/mac802154_hwsim.c
> @@ -813,7 +813,7 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
>  		err = hwsim_subscribe_all_others(phy);
>  		if (err < 0) {
>  			mutex_unlock(&hwsim_phys_lock);
> -			goto err_reg;
> +			goto err_subscribe;
>  		}
>  	}
>  	list_add_tail(&phy->list, &hwsim_phys);
> @@ -823,6 +823,8 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
>  
>  	return idx;
>  
> +err_subscribe:
> +	ieee802154_unregister_hw(phy->hw);
>  err_reg:
>  	kfree(pib);
>  err_pib:
> 


This patch has been applied to the wpan tree and will be
part of the next pull request to net. Thanks!

regards
Stefan Schmidt
