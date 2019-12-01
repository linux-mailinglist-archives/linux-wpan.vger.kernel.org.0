Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25D2510E2F5
	for <lists+linux-wpan@lfdr.de>; Sun,  1 Dec 2019 19:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfLASSp (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sun, 1 Dec 2019 13:18:45 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:8348 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbfLASSp (ORCPT <rfc822;linux-wpan@vger.kernel.org>);
        Sun, 1 Dec 2019 13:18:45 -0500
X-Greylist: delayed 6531 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:18:44 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217599; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=FImGvn3IrVkaDz/tDgNIkeyNQeCk5LQ9YhFplS9YRUid
        pKQmhNrzqA2beg1LZK1DjxiJ51FWvUxfGNvuk061xENWVZJjkA
        R53EagALxBEyFjLg2a/kcYTbJshki46HRSifknMM7tJMTQdBXn
        X8zSC+yWB/2HmIOs+XjiGcDlSqg=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 1dee_62e6_1cbec796_94fb_4c5d_92e0_45f1d43f5075;
        Sun, 01 Dec 2019 10:26:38 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 8CA531E29F4;
        Sun,  1 Dec 2019 10:18:18 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id loYPGdSBmxbi; Sun,  1 Dec 2019 10:18:18 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 910D51E29FB;
        Sun,  1 Dec 2019 10:13:06 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 910D51E29FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216786;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=jEO5tJJrol7E15is/Njx8uwhe19xmqWiL/wLFm5Z6LBQ2jFA3ZyUzndfL94dmvfWL
         MnizaGNWAR/J1ufou9ww+d+bkAdYbqdStS0IbSeRrlXEiWALGo5aLUIgGgAj5lFhjW
         Og7Rll5NHJXKmk63or2fE8TT3IeSs5DQHrr5TuU8=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lQRwNjSx4HlH; Sun,  1 Dec 2019 10:13:06 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id CA4001E3045;
        Sun,  1 Dec 2019 10:04:38 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:04:30 +0100
Message-Id: <20191201160438.CA4001E3045@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=aPKAkf1m c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: db9e3ed5.0.105116194.00-2305.176705956.s12p02m016.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949749>
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
