Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE8F7BD505
	for <lists+linux-wpan@lfdr.de>; Mon,  9 Oct 2023 10:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbjJIIVE (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 9 Oct 2023 04:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbjJIIVD (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 9 Oct 2023 04:21:03 -0400
X-Greylist: delayed 315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 09 Oct 2023 01:21:00 PDT
Received: from mail.durme.pl (mail.durme.pl [217.182.69.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559B18F
        for <linux-wpan@vger.kernel.org>; Mon,  9 Oct 2023 01:21:00 -0700 (PDT)
Received: by mail.durme.pl (Postfix, from userid 1002)
        id F01C44C14D; Mon,  9 Oct 2023 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=durme.pl; s=mail;
        t=1696839343; bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
        h=Date:From:To:Subject:From;
        b=YitALw+j9AfG4pYtPYXnPGdTYHPvZvVP9qDv0YhUisDKPPzAwc1T0Tb6O7Dnzik2Q
         xLfn7oAVyIGuMTQpjY60zbExTUR579yYxsg8vT0rL934amRMJKSxRIYw+HItGYdpey
         WcKDRGbGBxQEJvo5jGE7Dnx16pxT4IbGeM00eURI+uzv0q1HfFlvR5dHPhC5Uzb7sf
         H5QMfrwBvVryTEqhm/ZRoEWh2t/ffkUpsQiLX2Kp6vKgaWkUJ0GbZsTrzfJ5v1gnpT
         fZ24CKsAXBcOXMSLecQuQHsdkWCj/IIyuld0blacnfDLB8cEjMWSjPQY3DaI32Dspu
         0JYzhVZrU/LQg==
Received: by mail.durme.pl for <linux-wpan@vger.kernel.org>; Mon,  9 Oct 2023 08:15:04 GMT
Message-ID: <20231009064501-0.1.4t.nm9n.0.198o17gbvc@durme.pl>
Date:   Mon,  9 Oct 2023 08:15:04 GMT
From:   "Krystian Wieczorek" <krystian.wieczorek@durme.pl>
To:     <linux-wpan@vger.kernel.org>
Subject: W sprawie samochodu
X-Mailer: mail.durme.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NIXSPAM_IXHASH,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
        *      [score: 0.0191]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [217.182.69.186 listed in zen.spamhaus.org]
        *  3.0 NIXSPAM_IXHASH http://www.nixspam.org/
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: durme.pl]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Dzie=C5=84 dobry,

chcieliby=C5=9Bmy zapewni=C4=87 Pa=C5=84stwu kompleksowe rozwi=C4=85zania=
, je=C5=9Bli chodzi o system monitoringu GPS.

Precyzyjne monitorowanie pojazd=C3=B3w na mapach cyfrowych, =C5=9Bledzeni=
e ich parametr=C3=B3w eksploatacyjnych w czasie rzeczywistym oraz kontrol=
a paliwa to kluczowe funkcjonalno=C5=9Bci naszego systemu.=20

Organizowanie pracy pracownik=C3=B3w jest dzi=C4=99ki temu prostsze i bar=
dziej efektywne, a oszcz=C4=99dno=C5=9Bci i optymalizacja w zakresie pono=
szonych koszt=C3=B3w, maj=C4=85 dla ka=C5=BCdego przedsi=C4=99biorcy ogro=
mne znaczenie.

Dopasujemy nasz=C4=85 ofert=C4=99 do Pa=C5=84stwa oczekiwa=C5=84 i potrze=
b organizacji. Czy mogliby=C5=9Bmy porozmawia=C4=87 o naszej propozycji?


Pozdrawiam
Krystian Wieczorek
