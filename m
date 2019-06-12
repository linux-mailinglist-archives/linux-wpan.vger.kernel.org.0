Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EEF447E5
	for <lists+linux-wpan@lfdr.de>; Thu, 13 Jun 2019 19:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbfFMRCu (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 13 Jun 2019 13:02:50 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:45816 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729491AbfFLXDj (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Jun 2019 19:03:39 -0400
Received: by mail-io1-f43.google.com with SMTP id e3so14394214ioc.12
        for <linux-wpan@vger.kernel.org>; Wed, 12 Jun 2019 16:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5r78Bv/7zNoVxhjXNi9/OKEOfnCm2lLjsUvKY5fQMFs=;
        b=CKFQjAKquI8M5PrpMQurqOgO+Wh313YAHCcNIWHLd6kUTyyYOvRu0iLAMXwjhO6iui
         yLiSRlRsi8sXtCnFlkCcp/0F0FGjgrNu/iN+0Z/N6NVy9O2CjZCAKA3Qsv+eL8GywtCM
         WmkaUG1MSGfiO7DAddSQnpYVsYYExrx6Nblm6FI0nosVFB4Hektn37cXsUbqg7Uvq8K1
         xdZ6YS1OWbUBoYvjyi86wnF5R2o/7RVpFLQFAO3htOoRPjWkFXFFVdvm3BNSPNpa4aKO
         JF82rrccbYnGGi4FNqDn4AT2EKeOx1kFMtwoCYUXcdC0TAgXy7twGaI1XHeVK9F+qmu3
         sfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5r78Bv/7zNoVxhjXNi9/OKEOfnCm2lLjsUvKY5fQMFs=;
        b=ekhJLBXN81XDhUIP/UvFPXXfVadvY1I1aCE6ZYJk/7tSd2xPJ42n0ThEF9OcA6dMeP
         gK4SBTMEN11kKF2Z3zwM6hWGTzzqjsZsEW6MGm2ZLXLa44CtJ7f8RdRdGK0UDh/nFm+H
         nN6vOnVVJrFVjKvbAwaK96QCLoRr6sSjONzIXn/deigdbA7KcWF1h1VNf7g6i9X1SVTi
         50E+9lkfCW0pHN0o80XBEMHbiSwq4yQI+MkPVBw7oL4UPP7EwffsnJd586+M/S919rkN
         wfZuDaPAQYbGJ5InaVGm2m+lnP6Ex20cUaCHybXYf2L8xGBDBhnHaXOQqtZbWLhipQJV
         dhJg==
X-Gm-Message-State: APjAAAVbtXWJTfwfkXPNjcZzdS3Wx95/Y6vwNhWhPMxKn5M2NInaICnS
        eUtkovtu/FZVJTevu+mG13LHHIele/8=
X-Google-Smtp-Source: APXvYqxymLhhFBmE1HAa6aFBJH//CXem7aucJUadLlzHh7WpoLIuHarmLDkp1Kyin3uqcET3fAd0HA==
X-Received: by 2002:a5d:96d8:: with SMTP id r24mr9797818iol.269.1560380618575;
        Wed, 12 Jun 2019 16:03:38 -0700 (PDT)
Received: from x220t ([64.26.149.125])
        by smtp.gmail.com with ESMTPSA id h26sm571075itf.13.2019.06.12.16.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 16:03:38 -0700 (PDT)
Date:   Wed, 12 Jun 2019 19:03:33 -0400
From:   Alexander Aring <aring@mojatatu.com>
To:     Ramon Fontes <ramonreisfontes@gmail.com>
Cc:     linux-wpan@vger.kernel.org
Subject: Re: Simulating 6lowpan with mac802154_hwsim
Message-ID: <20190612230333.2vzlzdpn6yix6owg@x220t>
References: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
 <20190612141016.owy6csdatcugsgak@x220t>
 <CAK8U23ZW+4MXkTcmzR9VV=Kw__wfEoXqvphEbH7ZPSe7rGH2Gw@mail.gmail.com>
 <20190612172028.2fxq6jsj5jsq5pca@x220t>
 <20190612195958.ukblxedzxwr6hvdk@x220t>
 <CAK8U23bFrQ07gmTdWVM8FZm8Xhbe3041XzaKagti_mzxVRAUiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8U23bFrQ07gmTdWVM8FZm8Xhbe3041XzaKagti_mzxVRAUiQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

On Wed, Jun 12, 2019 at 07:52:15PM -0300, Ramon Fontes wrote:
> For LQI this is not true, because in mac802154_hwsim you say edges as a
> set of vectors (which node can reach the other node) and specify the LQI
> value which the receiving node will be get.
> 
> >> Ok! I just used wpan-hwsim and it seems to work fine. However, I have another question: How can I get the LQI value? I've created a monitor interface, but I couldn't observe the LQI value.
> 

As I told, it's mostly garbage right now. There exists some way to get
it on af802154 socket... There is currently no feature for it on
AF_PACKET or some kind of neighbor nodes database (at least upstream)
for the last one I have somehow dirty patches for it (without short
address handling which getting complex because I need kind of mapping
from other layers).

Somehow I didn't got your other message.

- Alex
