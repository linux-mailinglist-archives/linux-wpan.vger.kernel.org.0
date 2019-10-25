Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBDA7E5684
	for <lists+linux-wpan@lfdr.de>; Sat, 26 Oct 2019 00:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfJYWeH (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 25 Oct 2019 18:34:07 -0400
Received: from titan.ufpe.br ([150.161.6.80]:48519 "EHLO canit.ufpe.br"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbfJYWeH (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Fri, 25 Oct 2019 18:34:07 -0400
X-Greylist: delayed 849 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Oct 2019 18:34:05 EDT
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by canit.ufpe.br (8.14.4/8.14.4/Debian-4) with ESMTP id x9PMJsFY035849
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-wpan@vger.kernel.org>; Fri, 25 Oct 2019 19:19:54 -0300
Received: from localhost (localhost [127.0.0.1])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 6DBCB16300262
        for <linux-wpan@vger.kernel.org>; Fri, 25 Oct 2019 19:20:10 -0300 (-03)
X-Virus-Scanned: amavisd-new at ufpe.br
Received: from zimbraufpe.ufpe.br ([127.0.0.1])
        by localhost (zimbraufpe.ufpe.br [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id AE4xS-oA6LvI for <linux-wpan@vger.kernel.org>;
        Fri, 25 Oct 2019 19:20:10 -0300 (-03)
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 52534420BE8
        for <linux-wpan@vger.kernel.org>; Fri, 25 Oct 2019 19:20:10 -0300 (-03)
Date:   Fri, 25 Oct 2019 19:20:09 -0300 (BRT)
From:   Victhor Foster <victhor.foster@ufpe.br>
To:     linux-wpan@vger.kernel.org
Message-ID: <547191739.3620092.1572042009933.JavaMail.zimbra@ufpe.br>
Subject: Interfacing mac802154 stack with userspace applications
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [179.235.209.15]
X-Mailer: Zimbra 8.8.7_GA_1964 (ZimbraWebClient - GC77 (Linux)/8.8.7_GA_1964)
Thread-Index: b9saUzwtkxB8sUR2kSSFV/9SxR/s4g==
Thread-Topic: Interfacing mac802154 stack with userspace applications
X-Bayes-Prob: 0.5 (Score 0: No Bayes scoring rules defined, tokens from: SAIDA)
X-Spam-Score: 0.00 () [Hold at 10.00] 
X-CanIt-Incident-Id: 011hWjS1M
X-CanIt-Geo: ip=150.161.6.73; country=BR; region=Pernambuco; city=Recife; latitude=-8.05; longitude=-34.9000; http://maps.google.com/maps?q=-8.05,-34.9000&z=6
X-CanItPRO-Stream: SAIDA
X-Canit-Stats-ID: 011hWjS1M - 8140bf2b47a8 - 20191025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ufpe.br; h=date:from:to
        :message-id:subject:mime-version:content-type
        :content-transfer-encoding; s=ufpe201801; bh=WMCOpjDsbX8LA3+6314
        rVNiAxztldQE47ZW6FLRkNno=; b=Tw9YbuXDYoaM0tbRF66OfQR1WRe4gp2ZT9z
        avlBIlwRKZUXFo+3KeIlOhRAsApAcRlK3LWzXizxukVBOj1iu8x3rj9CZ9bd4HwD
        5Ujv0zM+o81Vm3ATW1UpXFFteqvy+OX24cVAdqyaBlHTos2N4y5V+4qhegXjbJjr
        YTdyMeA0CrB1qX+RkZ2UEker0j5hDB55iS5Qqg6p5OMms3BLQdystr3m8GM2r6QH
        tzUhXJSX3i1zjv73oi2cJ1FuvcE1IpWoxYa6TQr2y9NOlDbuKReeBUu1zFlpj4NZ
        drjPG3kIZ+yatC8ZqG2vhchMivtwJTrt1NqmgAXi+YRIKw78Org==
X-Scanned-By: CanIt (www . roaringpenguin . com) on 150.161.6.80
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello,

I'm working on a project to implement a 6LoWPAN network using software defined radios. I'm trying to interface the kernel's 802.15.4/6LoWPAN stacks to my physical layer implemented in GNU Radio, instead of using a userspace stack, but this isn't working very well.

The reason why I'm doing this is, while the GNU Radio plugin I'm using (gr-ieee802-15-4 from Bastian Bloessl) implements its own 802.15.4 MAC layer, I'd like to get around its limitations (such as not being able to change destination addresses at runtime) using the Linux kernel stack.

The way this is being done is I have socat piping between a mac802154_hwsim interface and GNU Radio, using the following arguments: INTERFACE:wpan0 UDP4-DATAGRAM:127.0.0.1:<port>
GNU Radio is running a UDP server at <port> that transmits and receives PDUs to/from the software defined PHY, which then goes out to a software defined radio device (a USRP N210, in this case). So the PDUs are sent via the socat pipe to the hwsim network interface and vice-versa. The 802.15.4 MAC block is removed.

While 802.15.4 packets are sent and received by both hosts, it seems these packets aren't getting through to the 6LoWPAN stack.

During testing, I had packet capture set up on both the 802.15.4 ("wpan0") and the 6LoWPAN ("lowpan0") interfaces. The wpan0 interface was receiving packets from the other host (and also from itself, as the radio is full duplex), as expected. However, I could not get wpan-ping to work (timeout) and ping6, netcat, etc. wouldn't get a response from the other host. 
On the lowpan0 interface, I could see the packets originating from applications would appear on the packet capture log, but those that should be coming from the wpan0 interface wouldn't, even those originating from the host itself (due to the full duplex nature of the radio).

I also noticed the following message on the kernel log: ieee802154 phy0 wpan0: encryption failed: -22
I haven't touched the link encryption settings, so the traffic is unencrypted.

What could be done to get the 6LoWPAN stack to accept packets injected into the 802.15.4 interface by socat? I realize this is a very unusual situation, but I'm not familiar with the Linux 802.15.4 stack.
