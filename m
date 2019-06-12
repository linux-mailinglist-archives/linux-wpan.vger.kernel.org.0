Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4D4447D7
	for <lists+linux-wpan@lfdr.de>; Thu, 13 Jun 2019 19:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfFMRCU (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 13 Jun 2019 13:02:20 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:36647 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729508AbfFLXIX (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 12 Jun 2019 19:08:23 -0400
Received: by mail-lj1-f179.google.com with SMTP id i21so16626613ljj.3
        for <linux-wpan@vger.kernel.org>; Wed, 12 Jun 2019 16:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nbc6F6mxdq6tuS2n+boS+GqEFJLni5sams2hC+f8DU4=;
        b=OQXSIf5pFsDgkLGinGr6ByNuXZ1bqwpeyTVhBpOWgYtR+S1ZGjkHJ86ItEytt3PPXP
         rtf8fa1V3UqXFqTG//zrKR9WHboA1sPrx4EWfM7c+k0JnsnW/qOFNjC6RPWOt74qSfSl
         CA0nKNy9V8Q6BYJZOxlnUG8EA/qygnHjO0pB9nCYdK68L/YSV/KUbVMcu4yvE/aVJZbx
         T+AysSgTipoNuA6ixayp5oncGsTU9tH+/5mlmHotFYpH0QI1Ft7mM1cm5TLSl/n6JmcF
         sDN7IrmIJ2kGuPf6WTHsJ1cKiwSriLciDw3Gc+AAy57EW0n8zM9agYaH7JRH+qknpuuT
         +pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nbc6F6mxdq6tuS2n+boS+GqEFJLni5sams2hC+f8DU4=;
        b=sM2zCcYULZTnQ/6VY4yZrSqW5sylyllbeeoGAKNJpvOPu6gr74UvKKkmxncij8OzhH
         IoTZicQ54KTGI6LZTrzGg9qC7IwUJoyOz6CNVwdd4eJpVg2q3rxAZVpKUhnTz9xXR5yR
         jben2y/cSkP9yaZRVaj9VDVIXq6XlBUMr/8dZOtySDnN+EmppC3wwNuBlw0JXBpcfTQK
         n3GljFVGOciZxm4elaofCv9JhBHgDnIeHB0w4QaU/EO23t7PoFA08On4uhthJX378ey6
         uSZTc/kSLYa4B0Vz8BVBPoHVPEAV6hBxWrLf3aJ7li0f4rfzufoed6nzkWRS8UeeB/hA
         okUg==
X-Gm-Message-State: APjAAAU6e41pBVmk1foOL+65CbMm2erWAHcWaxLJDY0T0s0Mx+uBNBKv
        znmEYPMmc2c4c8Mi7KKZ6g3wKUBlJkFEeog850o=
X-Google-Smtp-Source: APXvYqyd4pMdpfIq5W71BIz0qSeuvSOpIVqVckjIuGVp+7I0W2YyxjpqlEaFxtD5tBj9zsT1RrYrcd+qM0X49lS/jjw=
X-Received: by 2002:a2e:5bc8:: with SMTP id m69mr36011150lje.15.1560380900814;
 Wed, 12 Jun 2019 16:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
 <20190612141016.owy6csdatcugsgak@x220t> <CAK8U23ZW+4MXkTcmzR9VV=Kw__wfEoXqvphEbH7ZPSe7rGH2Gw@mail.gmail.com>
 <20190612172028.2fxq6jsj5jsq5pca@x220t> <20190612195958.ukblxedzxwr6hvdk@x220t>
 <CAK8U23bFrQ07gmTdWVM8FZm8Xhbe3041XzaKagti_mzxVRAUiQ@mail.gmail.com> <20190612230333.2vzlzdpn6yix6owg@x220t>
In-Reply-To: <20190612230333.2vzlzdpn6yix6owg@x220t>
From:   Ramon Fontes <ramonreisfontes@gmail.com>
Date:   Wed, 12 Jun 2019 20:08:09 -0300
Message-ID: <CAK8U23b5ThWFHvbU6SCj7H=fSY5sLWrNY9fJZimud8Q8Y1Ww3Q@mail.gmail.com>
Subject: Re: Simulating 6lowpan with mac802154_hwsim
To:     Alexander Aring <aring@mojatatu.com>
Cc:     linux-wpan@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

For TC it's true, then you need to match on different addresses e.g. mac
> address/short address?

After talking with the TC maintainer, he told me it's implemented as
qdisc and not as action where you probably could do something to use
netem features per neighbor as run on specifc patterns...

>> Which patterns do you mean? Can I try the mac address with TC?

Thanks a lot for your kind help.

Regards,
Ramon
On Wed, Jun 12, 2019 at 8:03 PM Alexander Aring <aring@mojatatu.com> wrote:
>
> On Wed, Jun 12, 2019 at 07:52:15PM -0300, Ramon Fontes wrote:
> > For LQI this is not true, because in mac802154_hwsim you say edges as a
> > set of vectors (which node can reach the other node) and specify the LQI
> > value which the receiving node will be get.
> >
> > >> Ok! I just used wpan-hwsim and it seems to work fine. However, I have another question: How can I get the LQI value? I've created a monitor interface, but I couldn't observe the LQI value.
> >
>
> As I told, it's mostly garbage right now. There exists some way to get
> it on af802154 socket... There is currently no feature for it on
> AF_PACKET or some kind of neighbor nodes database (at least upstream)
> for the last one I have somehow dirty patches for it (without short
> address handling which getting complex because I need kind of mapping
> from other layers).
>
> Somehow I didn't got your other message.
>
> - Alex
