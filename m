Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8033838120
	for <lists+linux-wpan@lfdr.de>; Fri,  7 Jun 2019 00:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfFFWoM (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 6 Jun 2019 18:44:12 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:44157 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfFFWoL (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 6 Jun 2019 18:44:11 -0400
Received: by mail-lj1-f178.google.com with SMTP id k18so33155ljc.11
        for <linux-wpan@vger.kernel.org>; Thu, 06 Jun 2019 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=k+mXCXyDhMgo3tN/rz7nOgRy3110TgiJCfBnMtqTsms=;
        b=MRaHIX0I8i70z1kpqeE+dqjaJh79l4c0Y2ZWC+xLYq68SuvHlR5lCB5JzrKaDpai9q
         hXeTI4PrR4IMP76BEd9X/1H5BPgb20xU0oYYV/UBYirbqEqArnLlQzjTG0rqsX6qJaa9
         2YRlN2V+9Rxjyjo5B+T/K5gbyssNIbvwUa+hW4uDRFk0gDe38u9tc+dDQet/aL5QUqzp
         0cN5SKw0VZKEeZFFwvT9U5Xkdn+5MbyWVtAg75/XAJOsW54ZveQ0x4NjO9Ab7OPhFZMU
         lrk45osvPwuRLKNGmTpQUPO+YJmqAGj06pEiXw5OsdbnLrbGtbEybE3uTTo/n6T2eDp8
         /tbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=k+mXCXyDhMgo3tN/rz7nOgRy3110TgiJCfBnMtqTsms=;
        b=VvQmcArhqPInHapB2IywZ3ET7BoXS30x79sWBYdi7/UMFOWf/6nMbJbV+4FXFlNWUD
         pdy6vqHVzh6M/H0BBW+CBpU3XUO+UEGWsEfKhkEsTOnKiLZdl8yMWLc8jR1iZb7/HgyK
         YOoqgYgUtn6gSvFqOXSrbEf5ta2+2TfMEgy5pJSh653diePNfpEtArhREzTs2joZ6ytO
         NEkltgXggcCm51TZL4HEQLIOguxz32NKVD5pv51isMPvLT3I33VS3kbZWYQA+AWipAB/
         T2cBf44/qHLk25zLZ6s0f03d7ZxlDUxJZVjGw8Gzww1gC3R1zqCGG7knt9WgnMqDXYbD
         f9dA==
X-Gm-Message-State: APjAAAXOL6bfBmLBzw0nwyG7S+zfkPJeB/EnXv+SiwE4UrDzmu8XK0p8
        3CuVUakkBIDxPin95zCSyUdT8DLoUIElNJ+ZbNtVbFO0O3A=
X-Google-Smtp-Source: APXvYqzGtdZtf9oTjDn2o4pSP8lFrv2oGjC7w3V3QY7j9s/x8j+RoHKVkB0AuyfPgJMaKx2/lezfsM9tgs0j2Pn8E2U=
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr2268157ljl.21.1559861049752;
 Thu, 06 Jun 2019 15:44:09 -0700 (PDT)
MIME-Version: 1.0
From:   Ramon Fontes <ramonreisfontes@gmail.com>
Date:   Thu, 6 Jun 2019 19:43:58 -0300
Message-ID: <CAK8U23aMxHqVw7=vKdaLxQSC=n2pCLehbgoB4wCcft7Ui7Wm8A@mail.gmail.com>
Subject: Simulating 6lowpan with mac802154_hwsim
To:     linux-wpan@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello all,

I've developed a wireless network emulator for IoT
(https://github.com/ramonfontes/mininet-iot) in which I'm using
mac802154_hwsim. Mininet-IoT extends Mininet-WiFi
(https://github.com/intrig-unicamp/mininet-wifi) by simulating WiFi
through mac80211_hwsim. Mininet-WiFi already supports 6lowpan with
fakelb and I moving everything to mac802154_hwsim. Since I'm using
iwpan with mac802154_hwsim and given the expertise of this community,
I was wondering whether there is any work in which simulate the data
rate based on the distance/rssi with 6lowpan. If the answer is no,
what would be the best way to do so? I was thinking of doing this with
TC, but TC wouldn't work well with multiple hops. Should I develop a
wmediumd-like simulator (https://github.com/bcopeland/wmediumd) for
mac802154_hwsim?

Best regards,
Ramon Fontes
