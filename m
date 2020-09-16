Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAAE26CF3A
	for <lists+linux-wpan@lfdr.de>; Thu, 17 Sep 2020 01:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgIPXFf (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 16 Sep 2020 19:05:35 -0400
Received: from tuna.sandelman.ca ([209.87.249.19]:58916 "EHLO
        tuna.sandelman.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgIPXFf (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 16 Sep 2020 19:05:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by tuna.sandelman.ca (Postfix) with ESMTP id 54401389B0;
        Wed, 16 Sep 2020 18:44:14 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id QEFVffnTI8c2; Wed, 16 Sep 2020 18:44:13 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
        by tuna.sandelman.ca (Postfix) with ESMTP id 05F5438980;
        Wed, 16 Sep 2020 18:44:13 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
        by sandelman.ca (Postfix) with ESMTP id 0E5ED1F9;
        Wed, 16 Sep 2020 19:05:30 -0400 (EDT)
From:   Michael Richardson <mcr@sandelman.ca>
To:     Achim Kraus <achimkraus@gmx.net>
cc:     Alexander Aring <alex.aring@gmail.com>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>
Subject: Re: 6lowpan Support for Raspberry PI 3B+ - CYW43455
In-Reply-To: <43281eee-af0c-f050-79e4-9f02eda4be49@gmx.net>
References: <f1acad10-2fb3-a402-df58-907c2580c5ab@gmx.net> <21010.1600201310@localhost> <CAB_54W6S3+kf1Uowt9Y+nJVNOG4SS8GFwdd7F+6WJ8=W4Pbahg@mail.gmail.com> <a9280f74-54f0-917f-22a7-8907afd33c95@gmx.net> <10921.1600275993@localhost> <43281eee-af0c-f050-79e4-9f02eda4be49@gmx.net>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Date:   Wed, 16 Sep 2020 19:05:30 -0400
Message-ID: <29090.1600297530@localhost>
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

--=-=-=
Content-Type: text/plain


Achim Kraus <achimkraus@gmx.net> wrote:
    > Am 16.09.20 um 19:06 schrieb Michael Richardson:
    >>
    >> Achim Kraus <achimkraus@gmx.net> wrote:
    >> >>> for any BT device.  I would love to be wrong!!
    >>
    >> > Hi Michael,
    >>
    >> > The current Raspi OS (based on Debian, kernel 5.4) contains a
    >> > bluetooth_6lowpan module. With that it's possible to connect the
    >> > nrf52840 using a "plain raspi 3b+" (without extra rf module).
    >>
    >> So, USB connection to this multi-radio device?

    > No, the raspberry PI on it's own is using bluetooth_6lowpan.
    > No USB to the nrf52840!

    > The nrf52840 is a separate peer, which communicates over
    > bluetooth_6lowpan with that raspberry PI.

Ah okay. My bad.  There are a number of nrf52480 devices available that
connect via USB, have some firmware on them, and do "something" with the host
to enable the host to have BTLE.

But, you mean using the built-in BTLE chip on the RPI you were able to do
6lowpan over BTLE to this nrf device.
I expect that this did not involve any kind BT pairing first?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl9imjkACgkQgItw+93Q
3WVbhwgAuwWlDQgZaM9m33T8uxW892w85/iz1MWssdGKVbCS86LRPnUbWBZF5aKK
CBbm8D/6YfhXrDUUNna4NqT7zuzdPIslYHp/sUgbTu3RM2S3g/CUZZOLsP5mqW5M
J7muY7bPGuynuOSSYBkgruEYKb5AQaojqHxvynFA0av7xOoWikcH9UIUjYNhelMh
OlpLRXCGQEur9h9SgnXnEnLh9UNLFXTR4XAqkT7zDXQGIscz1hxO51d6X1VNIY1n
VvVoEX0EII+LnAl24Zi2Erma+2ka7MuOyUKzw8dr72poQ/hpS3K+kOmCnRM9fu7h
SNmaJxqY9L71eZFaHam+tYgKsliF8Q==
=N7bS
-----END PGP SIGNATURE-----
--=-=-=--
