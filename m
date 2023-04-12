Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A60A6DF53E
	for <lists+linux-wpan@lfdr.de>; Wed, 12 Apr 2023 14:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDLMaH (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 12 Apr 2023 08:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjDLMaD (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Apr 2023 08:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F637ED7
        for <linux-wpan@vger.kernel.org>; Wed, 12 Apr 2023 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681302537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=5FVpC581NkDfmYWpDRH3nTVPOQR2/syvKG58JcNVmQo=;
        b=D12KmZZizxw98zwot0iIdXbbszCtChqB5dWL6pPmNgF0v4uSHmtFNb79WN4MR7uLq109qH
        Vl9cBVwKSwwoftjqCpTjDtAgJ7SPPJhXbKZIpSwUrMyv0Z3gAYA9jvS1zsqrUz1XK5+zW7
        AxQEe2aE96LPMZWgl6kGc7XJHcxOBHY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-PqnPnxEiNdy75T9jANQ33w-1; Wed, 12 Apr 2023 08:28:55 -0400
X-MC-Unique: PqnPnxEiNdy75T9jANQ33w-1
Received: by mail-ed1-f70.google.com with SMTP id c64-20020a509fc6000000b004a26cc7f6cbso6425462edf.4
        for <linux-wpan@vger.kernel.org>; Wed, 12 Apr 2023 05:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302534; x=1683894534;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5FVpC581NkDfmYWpDRH3nTVPOQR2/syvKG58JcNVmQo=;
        b=v959ZVu8C0BCwm/0PeXu5YiAVj5HkAsk4mWbBwxXnHH1P8QXkkEsvGM0HnTmDNQgAh
         zrPni+tscrQHxt+TocM0loHGgmc+vDB2EQedZtqH/BEIKtTsNlXm+dNlSinRJn9RQnTi
         bRi4bi3HzlsXjFraDLsDDkI1yJzq6B/QYNlg2SpQ9MzDT110SNx/Yz1PYsK/GgJ8Eesw
         Vv+StcdB9T6WMv1SEAidqGCVY6olwo8jaFN1EkWqJBAYi0nfBujPPsLjWv1lH4MXYR4F
         EhaTrVAGXZ1hduQWORXhHJZBs3fgXl12S9XVwI/rbKgINWDGfjeV0m++QauRW7s/pdHH
         7ayA==
X-Gm-Message-State: AAQBX9eQGAkSXr7If1+cswmva6WgvjpdsCo2pUK/dj+R5zOiLOzBkfFx
        jsNylQpY2ITMOG2nGpXCp2LRdqNVshlCslGiQ429naZlJHD0bMGbgCduOovgo/4f8vUzHEdUo11
        FaqEmxPdDWaSTRvs4ZhgoCNLIn5h2iUq1k7lS+R+FVdj0CL0x
X-Received: by 2002:a17:907:60d0:b0:933:3a22:8513 with SMTP id hv16-20020a17090760d000b009333a228513mr16048258ejc.53.1681302534088;
        Wed, 12 Apr 2023 05:28:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350YbGtcUMbHzABOHQFX3bdDAKwzNCq+UNn4bVmmFuUESY4oFYN2YfgGf72fAsfV5WoAFh5tGl2wnOjP35dffj/g=
X-Received: by 2002:a17:907:60d0:b0:933:3a22:8513 with SMTP id
 hv16-20020a17090760d000b009333a228513mr16048239ejc.53.1681302533755; Wed, 12
 Apr 2023 05:28:53 -0700 (PDT)
MIME-Version: 1.0
From:   Alexander Aring <aahringo@redhat.com>
Date:   Wed, 12 Apr 2023 08:28:42 -0400
Message-ID: <CAK-6q+j8T0WFX0XSFk+=7R4=LHOYLo87AN0bHFy=nZc8YkbQ+A@mail.gmail.com>
Subject: ieee802154_hot_tx() and return value TX_BUSY/TX_OK
To:     linux-wpan - ML <linux-wpan@vger.kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

I am asking myself if we do the right return value in
ieee802154_hot_tx(). Currently we transmit and stop the queue as we
know the transceiver (currently only has one tx buffer (sometimes
tx/rx is the same buffer)) is busy. As:

ieee802154_hot_tx() - we transmit
ieee802154_hold_queue()
return NETDEV_TX_OK

but I think or I have the feeling it should be run like this:

ieee802154_hot_tx() - we transmit
return NETDEV_TX_OK
ieee802154_hot_tx() - we are busy
ieee802154_hold_queue()
return NETDEV_TX_BUSY

The side effects are probably how the qdisc implementation handles the
different return values. Some qdisc implementations are evaluating
this and need to know that it hits hardware limitation... Some qdiscs
don't evaluate this value.

This is just a brainstorming here to find if what we do is currently
correct or not correct... we can move this discussion to netdev to
clarify this... or we figure it out by ourselves? Somehow it bothers
me that there is an additional extra callback to detect it is busy and
I can't believe this is not optimized yet.

However we should keep that in mind that I think there is some
clarification needed.

btw: I also have some other things in my mind that currently could
make problems in the qdisc handling related to 802.15.4 (and may with
6LoWPAN on top).

- Alex

