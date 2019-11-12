Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F16F8B4E
	for <lists+linux-wpan@lfdr.de>; Tue, 12 Nov 2019 10:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfKLJDh (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 12 Nov 2019 04:03:37 -0500
Received: from titan.ufpe.br ([150.161.6.80]:40471 "EHLO canit.ufpe.br"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727321AbfKLJDh (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Tue, 12 Nov 2019 04:03:37 -0500
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by canit.ufpe.br (8.14.4/8.14.4/Debian-4) with ESMTP id xAC93TD2084855
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Nov 2019 06:03:29 -0300
Received: from localhost (localhost [127.0.0.1])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 882CC163637C8;
        Tue, 12 Nov 2019 06:03:27 -0300 (-03)
X-Virus-Scanned: amavisd-new at ufpe.br
Received: from zimbraufpe.ufpe.br ([127.0.0.1])
        by localhost (zimbraufpe.ufpe.br [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id MBDNBHj8Am1d; Tue, 12 Nov 2019 06:03:27 -0300 (-03)
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 6AD08163637C1;
        Tue, 12 Nov 2019 06:03:27 -0300 (-03)
Date:   Tue, 12 Nov 2019 06:03:27 -0300 (BRT)
From:   Victhor Foster <victhor.foster@ufpe.br>
To:     Alexander Aring <alex.aring@gmail.com>
Cc:     linux-wpan <linux-wpan@vger.kernel.org>
Message-ID: <2006988758.2143768.1573549407203.JavaMail.zimbra@ufpe.br>
In-Reply-To: <CAB_54W5B+bjAHQU-JYbg34=F5c0HMV9q30uPPtopHqNhNChO8A@mail.gmail.com>
References: <547191739.3620092.1572042009933.JavaMail.zimbra@ufpe.br> <CAB_54W5B+bjAHQU-JYbg34=F5c0HMV9q30uPPtopHqNhNChO8A@mail.gmail.com>
Subject: Re: Interfacing mac802154 stack with userspace applications
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [179.235.209.15]
X-Mailer: Zimbra 8.8.7_GA_1964 (ZimbraWebClient - GC77 (Linux)/8.8.7_GA_1964)
Thread-Topic: Interfacing mac802154 stack with userspace applications
Thread-Index: oOXlLZmZz5ktW44CUGICFR1dOSz5Bw==
X-Bayes-Prob: 0.5 (Score 0: No Bayes scoring rules defined, tokens from: SAIDA)
X-Spam-Score: 0.00 () [Hold at 10.00] 
X-CanIt-Incident-Id: 011oV3tpO
X-CanIt-Geo: ip=150.161.6.73; country=BR; region=Pernambuco; city=Recife; latitude=-8.05; longitude=-34.9000; http://maps.google.com/maps?q=-8.05,-34.9000&z=6
X-CanItPRO-Stream: SAIDA
X-Canit-Stats-ID: 011oV3tpO - a99b6f8d2d32 - 20191112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ufpe.br; h=date:from:to
        :cc:message-id:in-reply-to:references:subject:mime-version
        :content-type:content-transfer-encoding; s=ufpe201801; bh=YVgJB8
        nm0uI3ISEbodZoR85Q3Rx4eGfCZ1jXrT011W0=; b=FBn+jKyAjKA+6L0C1W0Pru
        N63odtrvuuHg2T31oKMv8lsYZUjsPtFsJGsS4DC1HL/9aJZjdnoHf6iLhK/MoObQ
        oTlEA+3oa+LV41jyoIrr8z3a1zPEkSWnKo7jEShwRewQcxlZRAwIl3uoDFyeVzOw
        uM4A1uvJGdUz92D/yRJjj5U6ozMwQ475CqOnhiJ4/XZhiNeW9NPpjN2bWIgoYAf7
        5RrVE+YdFuaDDeR0mwYhtQQLxhNFPLOwbyPk5DPJg03W00W7l4rTpxqsWbJF665w
        IzeAFqwjkp3sR5bM2LsPhmo593K+kAb9mgHAcstrGmUWYaiY5pX9Sr4HrJlNJKag
        ==
X-Scanned-By: CanIt (www . roaringpenguin . com) on 150.161.6.80
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi Alexander,

> Hi Victhor,
>
> On Fri, Oct 25, 2019 at 6:39 PM Victhor Foster <victhor.foster@ufpe.br> wrote:
>>
>> Hello,
>>
>> I'm working on a project to implement a 6LoWPAN network using software defined
>> radios. I'm trying to interface the kernel's 802.15.4/6LoWPAN stacks to my
>> physical layer implemented in GNU Radio, instead of using a userspace stack,
>> but this isn't working very well.
>>
>> The reason why I'm doing this is, while the GNU Radio plugin I'm using
>> (gr-ieee802-15-4 from Bastian Bloessl) implements its own 802.15.4 MAC layer,
>> I'd like to get around its limitations (such as not being able to change
>> destination addresses at runtime) using the Linux kernel stack.
>>
>
> It's possible to change the destination address. Do you use af802154?
>
I was referring to the MAC built into the GNU Radio plug-in. It doesn't use af802154, and there seems to be no way to change addresses at runtime on this plugin, from what I can tell.

>> The way this is being done is I have socat piping between a mac802154_hwsim
>> interface and GNU Radio, using the following arguments: INTERFACE:wpan0
>> UDP4-DATAGRAM:127.0.0.1:<port>
>> GNU Radio is running a UDP server at <port> that transmits and receives PDUs
>> to/from the software defined PHY, which then goes out to a software defined
>> radio device (a USRP N210, in this case). So the PDUs are sent via the socat
>> pipe to the hwsim network interface and vice-versa. The 802.15.4 MAC block is
>> removed.
>>
>> While 802.15.4 packets are sent and received by both hosts, it seems these
>> packets aren't getting through to the 6LoWPAN stack.
>>
> Mhh, do you can provide more information about the setup so I can test
> it on my own? Do you took care about channel/page and panid settings?
>
I have a GNU Radio flowgraph that is based on one of the gr-ieee802-15-4 examples. The PHY block's data input/output are connected to a "socket PDU" block that listens on a UDP port, and is able to send and receive data on this UDP port. The PHY block has signal input/output that is connected to the transmitter and receiver blocks for the SDR.
To set up the hwsim interfaces, I made a script that runs the following commands on the host:

wpan-hwsim del 1
ip link set down dev wpan0
ip link set mtu 127 dev wpan0
ip link add link wpan0 name lowpan0 type lowpan
iwpan dev wpan0 set pan_id 0xabcd
ip link set up dev wpan0
ip link set up dev lowpan0

(ieee802154_socket and mac802154_hwsim modules are already loaded)

Then I launch GNU Radio and connect that to the hwsim interface using: socat UDP:127.0.0.1:<port on "socket PDU" block> INTERFACE:wpan0
I have 2 hosts for testing, and these procedures are repeated on the other host (so they both have the same pan_id).
lowpan* interfaces on both hosts are assigned a link-local address by the OS, which I don't change.
Both hosts are running Ubuntu 18.04 with kernel package 5.0.0-29-generic from the repository.
I have them set to the same channel/page and pan_id, but the channel/page doesn't matter as GNU Radio doesn't use these settings, it has its own frequency selection and both devices are operating on the same channel.

Hopefully this is a clear explanation of my setup.

>> During testing, I had packet capture set up on both the 802.15.4 ("wpan0") and
>> the 6LoWPAN ("lowpan0") interfaces. The wpan0 interface was receiving packets
>> from the other host (and also from itself, as the radio is full duplex), as
>> expected. However, I could not get wpan-ping to work (timeout) and ping6,
>> netcat, etc. wouldn't get a response from the other host.
>> On the lowpan0 interface, I could see the packets originating from applications
>> would appear on the packet capture log, but those that should be coming from
>> the wpan0 interface wouldn't, even those originating from the host itself (due
>> to the full duplex nature of the radio).
>>
>
> No idea, this is now your gnuradio device?

Yes. GNU Radio is connected to the wpan0 device via the socat bridge.

>> I also noticed the following message on the kernel log: ieee802154 phy0 wpan0:
>> encryption failed: -22
>> I haven't touched the link encryption settings, so the traffic is unencrypted.
>
> This looks that you receive encrypted frames, it might be only the
> frame control field is misleading and security is enabled, can you
> check?
>
CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not enabled on this kernel, so link layer security is not available, I presume?
>>
>> What could be done to get the 6LoWPAN stack to accept packets injected into the
>> 802.15.4 interface by socat? I realize this is a very unusual situation, but
>> I'm not familiar with the Linux 802.15.4 stack.
>
> No idea, sorry for my late reply. Can you provide more information?
>
Sorry about my late reply as well, I needed access to the lab machine I was working on and I could only get it last Thursday, I tried to send this email with the GNU Radio file I used attached, and that got rejected, so I'm sending it again with this attachment removed.
What I meant to say is, I want the stack to accept the packets from GNU Radio, so layer 3 and above will work i.e. the packets that are correctly decoded by the PHY are sent to the MAC, where they can be processed and sent to the layers above, so I can run applications over this link, thus allowing this system to be used to link multiple nodes together.

I had done another test a few days ago, but this time I eliminated the radios, instead I configured a loopback between the PHY input and output. I also set up another hwsim interface and had the edges set up so they could both communicate with each other.
When I pinged one interface from the other, I could see a duplicated response, which came about a second or so later. This means GNU Radio adds significant latency, which was already known, but I wasn't accounting for this when I tested originally, I left the timeouts as default. I didn't expect the latency to be so significant. I might have to test this later using higher timeout settings.
This setup was used to communicate with a Contiki node running their old Rime stack, as this is one of the examples included in the gr-ieee802-15-4 project, which is why I didn't expect latency to be such a problem.


Victhor
