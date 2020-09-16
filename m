Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9629526BBDF
	for <lists+linux-wpan@lfdr.de>; Wed, 16 Sep 2020 07:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgIPFiv (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 16 Sep 2020 01:38:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:35405 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbgIPFis (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Wed, 16 Sep 2020 01:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1600234713;
        bh=vpaJiw52rKw9t3qneU6SdCpCgBD3ifLRk8prHghAJsM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TglAqnsyUNTVFm7PKDXir/fCpHZtjYYc2uRzvsRe5X6iwAJ12wRYfn9p0sOrjdVQe
         xjUZ0KYT7GoEhiD82/nVMhyztGrmvvRAFhQRv6G+8ooWb3MzvTLpsrEINyyOzyPOBZ
         s3QJoxhJbwZh8t0tZEiLTAl/+iDVL+idIq7Qr1xA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.45] ([178.10.252.75]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lcJ-1kIhOk0yjj-000pt0; Wed, 16
 Sep 2020 07:38:33 +0200
Subject: Re: 6lowpan Support for Raspberry PI 3B+ - CYW43455
To:     Alexander Aring <alex.aring@gmail.com>,
        Michael Richardson <mcr@sandelman.ca>
Cc:     linux-wpan - ML <linux-wpan@vger.kernel.org>
References: <f1acad10-2fb3-a402-df58-907c2580c5ab@gmx.net>
 <21010.1600201310@localhost>
 <CAB_54W6S3+kf1Uowt9Y+nJVNOG4SS8GFwdd7F+6WJ8=W4Pbahg@mail.gmail.com>
From:   Achim Kraus <achimkraus@gmx.net>
Message-ID: <a9280f74-54f0-917f-22a7-8907afd33c95@gmx.net>
Date:   Wed, 16 Sep 2020 07:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAB_54W6S3+kf1Uowt9Y+nJVNOG4SS8GFwdd7F+6WJ8=W4Pbahg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QPm+hvKTlKu672kpPrFNsxMZulfjXC6qfnbfChnMqeJD5nHd2k9
 wyZUJEKCNbURXh5xu2w2JiWIilBeyC1dAIKKsRj7ocxtKXfdVotqv1vkAXNv/FeTnBv4eQJ
 VJaUnwkQ71wstDgs6NS1iqV20HG9mz6hVk8xuMriKFW9mpyaciwjw90ybkrARqeP/YRBbme
 e3Io1g3O1eFaG0KnaZiag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xMeUWPg1fAk=:6h5FZrL8Q/7jyCLkAGZCGb
 n4A9rSowLcYYeHn8k0flug1AdWu/QxYtkoR1khUrkpAHB/cdgV5uXdktIX/ZKB3pTKmiRqAPA
 lctYSw5caAg7vwU2eAhqWe40seTimnkeFbiQTsXxWA9zzxX91vZU8IGouPKIy5Ogp7mTU3FgW
 TFq+b6Lt8onoRWwtQzi0Z+lfx5VB2NalfAB2SDssHfX9IfXbl8v7/e4lXmrKgpXYDewXp6otw
 QHKBTXoHYUYZALd9YZVrpuR0BVJusnAsOJDIF/1nMb+/3TOvTrJo+NPtQFXZuqYWwnxCRD4Gw
 hGccwTOCUdB3WqP3PRscH7BoIuyZCLaTdW0Rgk0Z1eoBlDBKHWPnR4NDRrRtW7YxhLetx4etj
 Vv4MNQKU+Jc/OycXa36V7SBJLkERe5il7slF/dLAyXb7EQYm9neQIwet4RQns9D4J7dAb1DKo
 r2E945mXuvZPp8kI+J0HnKc6oiL4TNyfw4GkN6IAInr3mfOKPiDdmTpckXP4QYfHfa/j+Dbdw
 0hDAJPRLkbpR3DdSoiAIxfXrk+lPeCj44HmEOYOIx/f4OCePMblyPhFcToo4vGmFhmEXIZVuf
 nSoIpOdpEWAMJqGkhMbZ6vvQgXndacVoii1tKV9zlBitNzpBcC/LDkEpCf6uhRNZcKQWUgVum
 vy1bF1AQlC537SvoaxEj6N7AI4i/Lv6oyO/oQJo95oISBvMcgt9JKVZGAufpTl6cnufRwW+7y
 QtPviqkVcGB6RQM5aHVl0sG+aU8OukacOB4QdaFtdw9i9GxWol8eHus9clpm82SE4aeHf05H1
 NPUdyVVHAuTQhx2HzGSXmUh2dqG8ZdvVnkrMGiaahXjzmrvmejj8UfV1WSL5yod8EKT4+qO4T
 l/ZnnYMg0MKiPf1j/a4Xb3DM1E8gDqQlg+LEqJWlef4t970dz/xRq/ku2ee6YaazlSBT9jinq
 XN+MtVcWrInnZYCPTTi+NX2FEEIBJ/GIaujCrQu9NqgTfvEiryA0mfagCDOhKk93aOQ3Zc5zw
 CnIZKtIFqT5dbJlo9Z/pKCZ6gTRRZ8ZJB0eHTla9LsYmTpRkPIh526wbJG+JAxXEvohsn3IWU
 J70Ojl3ZvykMlNYl780+3+a63RijNpTc4I+CKU4CNNEd1l2W4Drr8RPa0IcAM8nL8vGjvdwgG
 kVmoZaPnyRfJ7KPYMhN+kOzg7MoSNI8/K2fm2lnsRUSr5mXdKFBMgvKwiSIPhooELLPTrpVwz
 w5OtOFpgOJzl/C4oEKOcYuRPdV5EgAoCGnDL/SA==
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi Alex,

> I tried to use BT 6LoWPAN and experienced a lot of races there, sadly
> nobody is fixing it. I sent a RFC some years ago to tackle these
> issues, also that the link-layer address is reconstructed by L3
> address and not by a ndisc lookup is very weird. I don't know if this
> is fixed or not.  However it was nothing related to the new BT mesh
> stuff.

"a lot of races", recently? Or some time ago?

>
>> for any BT device.  I would love to be wrong!!
>>

Hi Michael,

The current Raspi OS (based on Debian, kernel 5.4) contains a
bluetooth_6lowpan module. With that it's possible to connect the
nrf52840 using a "plain raspi 3b+" (without extra rf module).

Unfortunately, nordic decided to provide precompile examples with the
old, deprecated address mapping and so I need to spend some time in
compile these examples before I can report, if it works at all, and the
experienced stability.

best regards
Achim

P.S.: though linux-wpan is not bluetooth, I hope the misuse of this list
is still OK ;-). But I guess, moving it to the right list will alos have
advantages. Does anyone know, which would be the proper list for that?
