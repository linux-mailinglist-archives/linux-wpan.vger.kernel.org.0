Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1AA438138
	for <lists+linux-wpan@lfdr.de>; Fri,  7 Jun 2019 00:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfFFWtV (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 6 Jun 2019 18:49:21 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:37096 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbfFFWtV (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 6 Jun 2019 18:49:21 -0400
Received: by mail-lj1-f173.google.com with SMTP id 131so64642ljf.4
        for <linux-wpan@vger.kernel.org>; Thu, 06 Jun 2019 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=AEFiun9Z3KAf+z/PUwlqnKTlwDlQnx/hX+p463OEEjE=;
        b=IdYpK4rcsOEBrFi3S82xsNTxQveQ39cTFwTP8fe6CvP3fkMEJpLpY1ynKlEnxdPSKS
         xa4td6bI7hOe/luyhFeSjHS2fs3AVLkW2r06XJZU079yOGkY4Goo+1RLXUeTL7HT94vK
         CnIjE0zb3DeMhkS1wtTY1WCnPJVxKdBItH6HdtI88+1FucqXHZF934/+ynyfsZQW+MSM
         s/XOOzKO0K9dDcsrstv+xr51S67eHjEA3RAti97yrf5vQW6vibIpGqWKcv5hiuCkltGs
         4hvTqdelAsL9SANFnEaF3uaNvGemeIcDsUgKM2cB1GF3N2gi1asbHSWR+ZWv95RYr0uJ
         EVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AEFiun9Z3KAf+z/PUwlqnKTlwDlQnx/hX+p463OEEjE=;
        b=s1z6B51eb9ln9Ffei16ol2f15gw8QgO82A88xI03ynt04HZHkHJHMPOzTfE8hTWXdI
         AXHyBRG8lJajNgdaDtklQ8U75r8WM/jBcyXzfGHmNdglNV/qBjblpdJYcT1dhYCSjXAe
         JFv4Nw3FFFLsXc7NU9IBG8Au5P56pRgaMsvCTM7FWHTaXxM1AQbu9RRFAgGIvqjxuBPn
         LtNw8HpOuQi7MiVajGh7XGsiYyNPfQ/El/ygZJFzs3P4HOWIIjxR3ZLnkVbtc7Xbv4z7
         Rx7zm/biwA3LPokQMFHe0KasWS4uM438YPz3b21zzdltZ5AC0WnqhzdnxfGv8SDKOhRu
         b8xg==
X-Gm-Message-State: APjAAAVIDsoxgEdFzRaZgsRTlud/xk+5E1RlkWGepvuLMh4XoDZoxlcO
        P92lPgISF8DHiVoLlBpOtZZb9FSn1gmb7zgpvFQqyX4WpdU=
X-Google-Smtp-Source: APXvYqx6oZIZeTHQO+xwV89jrLV4Y2PBPfHDHbNPPHn0/mFE+3rztzCp51/A6VvE5CNHsYznu+R0NuozHn0F0/Ia0h0=
X-Received: by 2002:a2e:98d5:: with SMTP id s21mr8007915ljj.142.1559861358312;
 Thu, 06 Jun 2019 15:49:18 -0700 (PDT)
MIME-Version: 1.0
From:   Ramon Fontes <ramonreisfontes@gmail.com>
Date:   Thu, 6 Jun 2019 19:49:07 -0300
Message-ID: <CAK8U23aVH+O+4OWQrkG-Q+Kf2sD7DhvpDpO8+3C94Y9bE5k8ww@mail.gmail.com>
Subject: Simulating 6lowpan with mac802154_hwsim
To:     linux-wpan@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hello all,

I've been developed a wireless network emulator for IoT
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
