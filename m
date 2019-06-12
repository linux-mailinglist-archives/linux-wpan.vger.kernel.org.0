Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4A742D55
	for <lists+linux-wpan@lfdr.de>; Wed, 12 Jun 2019 19:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbfFLRUe (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 12 Jun 2019 13:20:34 -0400
Received: from mail-it1-f172.google.com ([209.85.166.172]:54723 "EHLO
        mail-it1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFLRUe (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Jun 2019 13:20:34 -0400
Received: by mail-it1-f172.google.com with SMTP id m138so12083125ita.4
        for <linux-wpan@vger.kernel.org>; Wed, 12 Jun 2019 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J+b97ICD9a2j3wHLDsfUcCh16ENzLM3wOLfxcjOzYFQ=;
        b=zf0nA0LHcnewzqx/qJZ+7f9oDAQIa6iw3+tv6XQdwfcH7sJeq58IrVIbXK+TVDZls/
         V/Q6VtpakKzJFWcDMyThzkeXBLIPwQtH2jW8AXPlIIVVEiqyPnOA+fIuwyhT7qBCfapB
         Xz1xZKkNe6K1rSMY/UeYLf6JLUmJHLLGa6wIxH4bb48iSTLOb+x1u3LKaCiRGLAarCYc
         8/SI3uB3CfOGAgqQhHg9307uOlsDvxyOw0e7NzEro9QcZxfv7qNZTbJny61IiJ2TQi8B
         9NK8GNpTNNjuhthGX4EO0nfU2tx7S0BF7TtsqI7d1W89EOhb2xuKi6+luqule3eVsRjW
         fpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J+b97ICD9a2j3wHLDsfUcCh16ENzLM3wOLfxcjOzYFQ=;
        b=KpFG+UjJ1ggR24KhPxT9Yiff6vcGr0xEpYS9Nko0PwOmcey5LKOvwU7rb40S/fO3x6
         4yn9NHj39EdSb1sSCVIWRDVShFO23qU4HVB14ANdefh17lcLhdiGZapc8aHrib7B2Cum
         1CkX+6UT+EeKXWHBINAc442fj5fd2bICEddj8mpwbhk5SS4SnIAqTwGfC8z2FjyN0kIC
         BQ/dXCmwpR0HiSA8dKwbYOvsnavfFynXmr/2MwbaAS1nRVfMCw1anYOqjw5Du/fpbJel
         7A6Z6ELWVFHtHRsMJG6XPdMzDDD5j10UQ0rYPtRqRcUVDTdqorFE+B9T8KYafkHB8EuV
         y14w==
X-Gm-Message-State: APjAAAXOdCf+4mkXfmbdO2lh5WCv/rThKPJVutD9qjsPt+un7iBt6WEf
        2fb4HhwNahKI4vAO+EzAtcaOoA==
X-Google-Smtp-Source: APXvYqyoVtp9x/T6SKt7nYM9E8LzHhu6ATnKfLySKYLfsRWxufBckC4L63IeKWKy1TuU0yiPzW2QlA==
X-Received: by 2002:a24:7288:: with SMTP id x130mr138808itc.125.1560360033850;
        Wed, 12 Jun 2019 10:20:33 -0700 (PDT)
Received: from x220t ([64.26.149.125])
        by smtp.gmail.com with ESMTPSA id f14sm194353itb.31.2019.06.12.10.20.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 10:20:33 -0700 (PDT)
Date:   Wed, 12 Jun 2019 13:20:28 -0400
From:   Alexander Aring <aring@mojatatu.com>
To:     Ramon Fontes <ramonreisfontes@gmail.com>
Cc:     linux-wpan@vger.kernel.org
Subject: Re: Simulating 6lowpan with mac802154_hwsim
Message-ID: <20190612172028.2fxq6jsj5jsq5pca@x220t>
References: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
 <20190612141016.owy6csdatcugsgak@x220t>
 <CAK8U23ZW+4MXkTcmzR9VV=Kw__wfEoXqvphEbH7ZPSe7rGH2Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8U23ZW+4MXkTcmzR9VV=Kw__wfEoXqvphEbH7ZPSe7rGH2Gw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Wed, Jun 12, 2019 at 02:07:26PM -0300, Ramon Fontes wrote:
> One node (e.g. node1) can be connected simultaneously to multiple
> nodes  (e.g. node2 and node3) by using only one 6lowpan interface.
> That said, which node (2 or 3) will node1 taking into account? They
> can have different distances and only one interface in which we can
> use TC. Please correct me if I'm wrong. In my mind, the same is true
> for LQI.
> 

For TC it's true, then you need to match on different addresses e.g. mac
address/short address?

For LQI this is not true, because in mac802154_hwsim you say edges as a
set of vectors (which node can reach the other node) and specify the LQI
value which the receiving node will be get.

The main difference here is that TC works on interface layer whereas
mac802154_hwsim can work on phy layer. Maybe TC can even extended for
such purpose?

> This code (https://github.com/ramonfontes/mininet-iot/blob/master/examples/6LoWPan.py)
> produce such scenario. You can also try 6lowpan.py -m for mobility
> purposes.
> 

Need to test it when I have time.

- Alex
