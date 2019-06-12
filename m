Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8469B430A2
	for <lists+linux-wpan@lfdr.de>; Wed, 12 Jun 2019 22:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390558AbfFLUAE (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 12 Jun 2019 16:00:04 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:34798 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389772AbfFLUAD (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Jun 2019 16:00:03 -0400
Received: by mail-io1-f51.google.com with SMTP id k8so14052837iot.1
        for <linux-wpan@vger.kernel.org>; Wed, 12 Jun 2019 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rqUBYSCRb00Di9ubg5ZKYp90TEGpF0EwvBWDIKUhR2g=;
        b=d8NSXcDouhuzQFDg/JUG839WzbVacpBWlOeRcAWKjijtfZeJ4Kpyk/hmjHdcxoSJTB
         zifyiDPfbfXgy81M/NNh3sFb9SlOsSaqzKolwgcpDHG5VYI9ozlo7GLG1XDZajJP0prX
         WAG8w7vJYFS+Inkx7VfAPdT4fSnlf2IJ8Vi+P5tUMth3HP+zTVI9is6IDMRD+3e1oUY/
         E95cLP4fi1LkL8RRgObCwjV+o6EunIINO+cquoJ0uPqgihC3MJbExPZ5GQTj56xBGjL8
         TRw97ow2FNj/eAHX6uFMUTxhnXuPbl+1qHFis+mUEM/N9g8aTjRQ46iGqm02x6v8fgTo
         /r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rqUBYSCRb00Di9ubg5ZKYp90TEGpF0EwvBWDIKUhR2g=;
        b=JyIfMJr4svb5sVBAyoCLxN9VE85sNrrFUYx/pwo93Qb98jpU6VeOJ/+qC6sMY22mvj
         hrsiz5puiW3mD4FOoF3zEuTKZ6Bp7pWbKZGHiDLAjjtqHd0uZVRjijdFrEn+5Hq2Srtf
         JTkoSwzFIlXGbmQ9xrRXHiO+1Czasdf7hIUiz/d7znKg8xxDuw+05N8iFClS6LZI1qi+
         dokDQmF2tAvL9K+fznTTyoDQV1TM1sJeKu4wIEKUx8+/JXGtH5AN1h7xzAyxjxBuKroP
         +9soeP8Ais/qNFSz46Azu24SqQkWAfMhE/3TPXjmb8oyLsObfse549AYSm912czruSrp
         P77g==
X-Gm-Message-State: APjAAAWRBKmH4f0rCCkFEFJhERLNP4wdbJauGj+EwxBYDKcSkN8HR6Xu
        +XpVGXeVPB/kBPF9CRISMhevWQ==
X-Google-Smtp-Source: APXvYqxlFxNoQVD3BDMG1EEXdSfd/1rfb8HADJ80W+k5YgiKXokPPlVDmwWA5EvG4MrDGTn/LUolUQ==
X-Received: by 2002:a6b:4107:: with SMTP id n7mr8738027ioa.12.1560369602994;
        Wed, 12 Jun 2019 13:00:02 -0700 (PDT)
Received: from x220t ([64.26.149.125])
        by smtp.gmail.com with ESMTPSA id v13sm292825ioq.13.2019.06.12.13.00.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 13:00:02 -0700 (PDT)
Date:   Wed, 12 Jun 2019 15:59:58 -0400
From:   Alexander Aring <aring@mojatatu.com>
To:     Ramon Fontes <ramonreisfontes@gmail.com>
Cc:     linux-wpan@vger.kernel.org
Subject: Re: Simulating 6lowpan with mac802154_hwsim
Message-ID: <20190612195958.ukblxedzxwr6hvdk@x220t>
References: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
 <20190612141016.owy6csdatcugsgak@x220t>
 <CAK8U23ZW+4MXkTcmzR9VV=Kw__wfEoXqvphEbH7ZPSe7rGH2Gw@mail.gmail.com>
 <20190612172028.2fxq6jsj5jsq5pca@x220t>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190612172028.2fxq6jsj5jsq5pca@x220t>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Wed, Jun 12, 2019 at 01:20:28PM -0400, Alexander Aring wrote:
> Hi,
> 
> On Wed, Jun 12, 2019 at 02:07:26PM -0300, Ramon Fontes wrote:
> > One node (e.g. node1) can be connected simultaneously to multiple
> > nodes  (e.g. node2 and node3) by using only one 6lowpan interface.
> > That said, which node (2 or 3) will node1 taking into account? They
> > can have different distances and only one interface in which we can
> > use TC. Please correct me if I'm wrong. In my mind, the same is true
> > for LQI.
> > 
> 
> For TC it's true, then you need to match on different addresses e.g. mac
> address/short address?

After talking with the TC maintainer, he told me it's implemented as
qdisc and not as action where you probably could do something to use
netem features per neighbor as run on specifc patterns...

- Alex
