Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09143527AA3
	for <lists+linux-wpan@lfdr.de>; Mon, 16 May 2022 00:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234701AbiEOWT5 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sun, 15 May 2022 18:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiEOWT4 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Sun, 15 May 2022 18:19:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614B72DAB5;
        Sun, 15 May 2022 15:19:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq30so22965300lfb.3;
        Sun, 15 May 2022 15:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgP1MYr+k314tyxZ+Miu+BvN5aCbPVl/XLbdbcCVtP8=;
        b=EUQWLGp50WMZr8+BDt7271Vik52+4/Rtv1XgFW3uNnRmYEBNnHpFFtFhxaZ2pkVxbc
         EndZaSoDHFbDDtwJX3WdZWLvsBBnPW/ybuSQcOse4n2vFpXn2kaaYoD6cbky/AW7UZ+e
         d/mGKMjVRnBAOKzUEhFI7g7ubaxw0eeLvKfQkjuaPPfcx6o9aamsKgYEdiMeBdpUypJf
         mVU8baYrFc+tW/sD5ayPHDTuo0AmtfYDp1/s9hGZibIGnxCOyxBbAz5s9idTnYK1cOiF
         J6ca3jX+jMRqwlZVblLZVpwzIFQMI3lozZChW3yXBjBKp74CelbAYJrFIW70nZSn/zU2
         6owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgP1MYr+k314tyxZ+Miu+BvN5aCbPVl/XLbdbcCVtP8=;
        b=O3dbWYN8lfnnCs9GLy2pNgNfYKWL3VZ9KBc3lWFE+e4g1DJY3UmDLSfSKwyQmgBnMl
         3X1XygFhonAWWpgloL9ygA65UpO/4NSwoBqtYPwJcB+rtleQ1a8hGle4hdMUp372hLWc
         4M31hsxVe+4JU37LoFDiLNMRGH3pyu9goIaeCBLRm7/XnbMn4f9GFM28xa3Wb78qzl2N
         skbqbf9JrQQ4duOSu0GCoGQjyG2mhYs+zkPJSicOjUoebJVD99wYPl78PX3LlL7gKUS+
         sRTKxlIP3PYrwt58qYhbYVLQw6UKiOZXXan38WSeWwSRdAmt8jiClxCTnGPCDMiLhuZZ
         R0oA==
X-Gm-Message-State: AOAM532huK0B2ArizbrlTW6hsiVcqt2Y5cH68eyN1Zzkxh5jVdqplt4O
        ccS52ObKta0MCKvR6p7iv3m2UAlzthHKyldTrnE=
X-Google-Smtp-Source: ABdhPJyrtzNNvfjlutqduLMivEyd4jbefqoGtIoSRfdcxtZrfsnkeap843sLInC5QJO8OTuP5UsOG88Mtj/qVxsU7RQ=
X-Received: by 2002:a05:6512:332d:b0:472:9a2:6e27 with SMTP id
 l13-20020a056512332d00b0047209a26e27mr11104790lfe.611.1652653190504; Sun, 15
 May 2022 15:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220512143314.235604-1-miquel.raynal@bootlin.com> <20220512143314.235604-6-miquel.raynal@bootlin.com>
In-Reply-To: <20220512143314.235604-6-miquel.raynal@bootlin.com>
From:   Alexander Aring <alex.aring@gmail.com>
Date:   Sun, 15 May 2022 18:19:39 -0400
Message-ID: <CAB_54W605SGbkNHhOLG5WEKsvccUvJ=rBnHErcyrte8_H=rY+g@mail.gmail.com>
Subject: Re: [PATCH wpan-next v2 05/11] net: mac802154: Bring the hability to
 hold the transmit queue
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Thu, May 12, 2022 at 10:33 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Create a hold_txs atomic variable and increment/decrement it when
> relevant, ie. when we want to hold the queue or release it: currently
> all the "stopped" situations are suitable, but very soon we will more
> extensively use this feature for MLME purposes.
>
> Upon release, the atomic counter is decremented and checked. If it is
> back to 0, then the netif queue gets woken up. This makes the whole
> process fully transparent, provided that all the users of
> ieee802154_wake/stop_queue() now call ieee802154_hold/release_queue()
> instead.
>
> In no situation individual drivers should call any of these helpers
> manually in order to avoid messing with the counters. There are other
> functions more suited for this purpose which have been introduced, such
> as the _xmit_complete() and _xmit_error() helpers which will handle all
> that for them.
>
> One advantage is that, as no more drivers call the stop/wake helpers
> directly, we can safely stop exporting them and only declare the
> hold/release ones in a header only accessible to the core.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/net/cfg802154.h      |  4 ++-
>  include/net/mac802154.h      | 27 --------------------
>  net/ieee802154/core.c        |  2 ++
>  net/mac802154/cfg.c          |  4 +--
>  net/mac802154/ieee802154_i.h | 19 ++++++++++++++
>  net/mac802154/tx.c           |  6 ++---
>  net/mac802154/util.c         | 48 ++++++++++++++++++++++++++++++------
>  7 files changed, 70 insertions(+), 40 deletions(-)
>
> diff --git a/include/net/cfg802154.h b/include/net/cfg802154.h
> index 473ebcb9b155..ad3f438e4583 100644
> --- a/include/net/cfg802154.h
> +++ b/include/net/cfg802154.h
> @@ -214,8 +214,10 @@ struct wpan_phy {
>         /* the network namespace this phy lives in currently */
>         possible_net_t _net;
>
> -       /* Transmission monitoring */
> +       /* Transmission monitoring and control */
> +       struct mutex queue_lock;
>         atomic_t ongoing_txs;
> +       atomic_t hold_txs;
>
>         char priv[] __aligned(NETDEV_ALIGN);
>  };
> diff --git a/include/net/mac802154.h b/include/net/mac802154.h
> index bdac0ddbdcdb..357d25ef627a 100644
> --- a/include/net/mac802154.h
> +++ b/include/net/mac802154.h
> @@ -460,33 +460,6 @@ void ieee802154_unregister_hw(struct ieee802154_hw *hw);
>   */
>  void ieee802154_rx_irqsafe(struct ieee802154_hw *hw, struct sk_buff *skb,
>                            u8 lqi);
> -/**
> - * ieee802154_wake_queue - wake ieee802154 queue
> - * @hw: pointer as obtained from ieee802154_alloc_hw().
> - *
> - * Tranceivers usually have either one transmit framebuffer or one framebuffer
> - * for both transmitting and receiving. Hence, the core currently only handles
> - * one frame at a time for each phy, which means we had to stop the queue to
> - * avoid new skb to come during the transmission. The queue then needs to be
> - * woken up after the operation.
> - *
> - * Drivers should use this function instead of netif_wake_queue.
> - */
> -void ieee802154_wake_queue(struct ieee802154_hw *hw);
> -
> -/**
> - * ieee802154_stop_queue - stop ieee802154 queue
> - * @hw: pointer as obtained from ieee802154_alloc_hw().
> - *
> - * Tranceivers usually have either one transmit framebuffer or one framebuffer
> - * for both transmitting and receiving. Hence, the core currently only handles
> - * one frame at a time for each phy, which means we need to tell upper layers to
> - * stop giving us new skbs while we are busy with the transmitted one. The queue
> - * must then be stopped before transmitting.
> - *
> - * Drivers should use this function instead of netif_stop_queue.
> - */
> -void ieee802154_stop_queue(struct ieee802154_hw *hw);
>
>  /**
>   * ieee802154_xmit_complete - frame transmission complete
> diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
> index de259b5170ab..d81b7301e013 100644
> --- a/net/ieee802154/core.c
> +++ b/net/ieee802154/core.c
> @@ -130,6 +130,8 @@ wpan_phy_new(const struct cfg802154_ops *ops, size_t priv_size)
>
>         init_waitqueue_head(&rdev->dev_wait);
>
> +       mutex_init(&rdev->wpan_phy.queue_lock);
> +
>         return &rdev->wpan_phy;
>  }
>  EXPORT_SYMBOL(wpan_phy_new);
> diff --git a/net/mac802154/cfg.c b/net/mac802154/cfg.c
> index 1e4a9f74ed43..b51100fd9e3f 100644
> --- a/net/mac802154/cfg.c
> +++ b/net/mac802154/cfg.c
> @@ -46,7 +46,7 @@ static int ieee802154_suspend(struct wpan_phy *wpan_phy)
>         if (!local->open_count)
>                 goto suspend;
>
> -       ieee802154_stop_queue(&local->hw);
> +       ieee802154_hold_queue(local);
>         synchronize_net();
>
>         /* stop hardware - this must stop RX */
> @@ -72,7 +72,7 @@ static int ieee802154_resume(struct wpan_phy *wpan_phy)
>                 return ret;
>
>  wake_up:
> -       ieee802154_wake_queue(&local->hw);
> +       ieee802154_release_queue(local);
>         local->suspended = false;
>         return 0;
>  }
> diff --git a/net/mac802154/ieee802154_i.h b/net/mac802154/ieee802154_i.h
> index a8b7b9049f14..0c7ff9e0b632 100644
> --- a/net/mac802154/ieee802154_i.h
> +++ b/net/mac802154/ieee802154_i.h
> @@ -130,6 +130,25 @@ netdev_tx_t
>  ieee802154_subif_start_xmit(struct sk_buff *skb, struct net_device *dev);
>  enum hrtimer_restart ieee802154_xmit_ifs_timer(struct hrtimer *timer);
>
> +/**
> + * ieee802154_hold_queue - hold ieee802154 queue
> + * @local: main mac object
> + *
> + * Hold a queue by incrementing an atomic counter and requesting the netif
> + * queues to be stopped. The queues cannot be woken up while the counter has not
> + * been reset with as any ieee802154_release_queue() calls as needed.
> + */
> +void ieee802154_hold_queue(struct ieee802154_local *local);
> +
> +/**
> + * ieee802154_release_queue - release ieee802154 queue
> + * @local: main mac object
> + *
> + * Release a queue which is held by decrementing an atomic counter and wake it
> + * up only if the counter reaches 0.
> + */
> +void ieee802154_release_queue(struct ieee802154_local *local);
> +
>  /* MIB callbacks */
>  void mac802154_dev_set_page_channel(struct net_device *dev, u8 page, u8 chan);
>
> diff --git a/net/mac802154/tx.c b/net/mac802154/tx.c
> index 33f64ecd96c7..6a53c83cf039 100644
> --- a/net/mac802154/tx.c
> +++ b/net/mac802154/tx.c
> @@ -43,7 +43,7 @@ void ieee802154_xmit_sync_worker(struct work_struct *work)
>
>  err_tx:
>         /* Restart the netif queue on each sub_if_data object. */
> -       ieee802154_wake_queue(&local->hw);
> +       ieee802154_release_queue(local);
>         atomic_dec(&local->phy->ongoing_txs);
>         kfree_skb(skb);
>         netdev_dbg(dev, "transmission failed\n");
> @@ -75,7 +75,7 @@ ieee802154_tx(struct ieee802154_local *local, struct sk_buff *skb)
>         }
>
>         /* Stop the netif queue on each sub_if_data object. */
> -       ieee802154_stop_queue(&local->hw);
> +       ieee802154_hold_queue(local);
>         atomic_inc(&local->phy->ongoing_txs);
>
>         /* Drivers should preferably implement the async callback. In some rare
> @@ -99,7 +99,7 @@ ieee802154_tx(struct ieee802154_local *local, struct sk_buff *skb)
>         return NETDEV_TX_OK;
>
>  err_wake_netif_queue:
> -       ieee802154_wake_queue(&local->hw);
> +       ieee802154_release_queue(local);
>         atomic_dec(&local->phy->ongoing_txs);
>  err_free_skb:
>         kfree_skb(skb);
> diff --git a/net/mac802154/util.c b/net/mac802154/util.c
> index 76dc663e2af4..b629c94cfd1b 100644
> --- a/net/mac802154/util.c
> +++ b/net/mac802154/util.c
> @@ -13,7 +13,17 @@
>  /* privid for wpan_phys to determine whether they belong to us or not */
>  const void *const mac802154_wpan_phy_privid = &mac802154_wpan_phy_privid;
>
> -void ieee802154_wake_queue(struct ieee802154_hw *hw)
> +/**
> + * ieee802154_wake_queue - wake ieee802154 queue
> + * @local: main mac object
> + *
> + * Tranceivers usually have either one transmit framebuffer or one framebuffer
> + * for both transmitting and receiving. Hence, the core currently only handles
> + * one frame at a time for each phy, which means we had to stop the queue to
> + * avoid new skb to come during the transmission. The queue then needs to be
> + * woken up after the operation.
> + */
> +static void ieee802154_wake_queue(struct ieee802154_hw *hw)
>  {
>         struct ieee802154_local *local = hw_to_local(hw);
>         struct ieee802154_sub_if_data *sdata;
> @@ -27,9 +37,18 @@ void ieee802154_wake_queue(struct ieee802154_hw *hw)
>         }
>         rcu_read_unlock();
>  }
> -EXPORT_SYMBOL(ieee802154_wake_queue);
>
> -void ieee802154_stop_queue(struct ieee802154_hw *hw)
> +/**
> + * ieee802154_stop_queue - stop ieee802154 queue
> + * @local: main mac object
> + *
> + * Tranceivers usually have either one transmit framebuffer or one framebuffer
> + * for both transmitting and receiving. Hence, the core currently only handles
> + * one frame at a time for each phy, which means we need to tell upper layers to
> + * stop giving us new skbs while we are busy with the transmitted one. The queue
> + * must then be stopped before transmitting.
> + */
> +static void ieee802154_stop_queue(struct ieee802154_hw *hw)
>  {
>         struct ieee802154_local *local = hw_to_local(hw);
>         struct ieee802154_sub_if_data *sdata;
> @@ -43,14 +62,29 @@ void ieee802154_stop_queue(struct ieee802154_hw *hw)
>         }
>         rcu_read_unlock();
>  }
> -EXPORT_SYMBOL(ieee802154_stop_queue);
> +
> +void ieee802154_hold_queue(struct ieee802154_local *local)
> +{
> +       mutex_lock(&local->phy->queue_lock);
> +       ieee802154_stop_queue(&local->hw);
> +       atomic_inc(&local->phy->hold_txs);
> +       mutex_unlock(&local->phy->queue_lock);
> +}
> +
> +void ieee802154_release_queue(struct ieee802154_local *local)
> +{
> +       mutex_lock(&local->phy->queue_lock);
> +       if (!atomic_dec_and_test(&local->phy->hold_txs))
> +               ieee802154_wake_queue(&local->hw);
> +       mutex_unlock(&local->phy->queue_lock);
> +}
>
>  enum hrtimer_restart ieee802154_xmit_ifs_timer(struct hrtimer *timer)
>  {
>         struct ieee802154_local *local =
>                 container_of(timer, struct ieee802154_local, ifs_timer);
>
> -       ieee802154_wake_queue(&local->hw);
> +       ieee802154_release_queue(local);
>
>         return HRTIMER_NORESTART;
>  }
> @@ -84,7 +118,7 @@ void ieee802154_xmit_complete(struct ieee802154_hw *hw, struct sk_buff *skb,
>                                       hw->phy->sifs_period * NSEC_PER_USEC,
>                                       HRTIMER_MODE_REL);
>         } else {
> -               ieee802154_wake_queue(hw);
> +               ieee802154_release_queue(local);
>         }
>
>         dev_consume_skb_any(skb);
> @@ -98,7 +132,7 @@ void ieee802154_xmit_error(struct ieee802154_hw *hw, struct sk_buff *skb,
>         struct ieee802154_local *local = hw_to_local(hw);
>
>         local->tx_result = reason;
> -       ieee802154_wake_queue(hw);
> +       ieee802154_release_queue(local);
>         dev_kfree_skb_any(skb);
>         atomic_dec(&hw->phy->ongoing_txs);

I am pretty sure that will end in a scheduling while atomic warning
with hwsim. If you don't hit it you have the wrong config, you need to
enable such warnings and have the right preemption model setting.
These calls xmit complete/error should even be allowed to be called
from a hardware irq context, however I _think_ we don't have a driver
which currently does that, but the mutex will break stuff here in the
xmit_do() callback of netdev which hwsim is calling it from.

Please check again...

- Alex
