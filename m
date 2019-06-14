Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D649245D28
	for <lists+linux-wpan@lfdr.de>; Fri, 14 Jun 2019 14:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfFNMuB (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 14 Jun 2019 08:50:01 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:35876 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfFNMuB (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 14 Jun 2019 08:50:01 -0400
Received: by mail-wm1-f54.google.com with SMTP id u8so2221358wmm.1
        for <linux-wpan@vger.kernel.org>; Fri, 14 Jun 2019 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trendyol.com; s=google;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=5RVbxHWN2KgDN1fpoYOFchIWzOv4m52LNZb3ykWmNaM=;
        b=UgzrnA3W0rMMvBUabDR3a11G1kbVspb6iZWAsR96uiXBlYzUYdoeRe0qVgOwZjtz9S
         dyAyyMr7B5030V2aWJZ1idSbSZVE91385lOzRi+cEPQvEOI1rSpNqUdybERXk0TleWrp
         d9ExbT9UloFCvdiAp9L5qO0/ej9ORvWWJSBII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=5RVbxHWN2KgDN1fpoYOFchIWzOv4m52LNZb3ykWmNaM=;
        b=gNGkzw7GoYRt/MyIa2e22jwcBDFCoHoXElrBvoX3acwnkjVRjJxQmNCp0hzRnjig/k
         V22EBJleHimmbeJUi5UlxEGbJeKxrldUuOOS1Vtfc0CI98hS28V+KmKOcBnC224BcWct
         i94nXvF+Z27d9jay8ujTrH7+zU7uH/OPLGfP05BTkYYd5Ll/ewYqwSHYZwkMdmYRj774
         YK83YeO9381FlKoFpxrAJeAqoSEQRFvjWdyRODKHuzj8HH0wnIYYbcGvwVGN5EQb9997
         OVirfPWNkOJPuEPClq6xPdYJXR38bn3xw+dTpkueZro5c5ZzrtscermczYTP+9qQ1Os4
         0M4A==
X-Gm-Message-State: APjAAAVgWrakZrwYPnjWjIrTSGzH5KSqKPJ8qwE5iNJ5kyUFcs2QZPFz
        BBIizp2y4L31OtL7K2e/wjwzZd1p5Jg+fxbWA5M8N9u5sCXSSo+tYo6fUxDmEMMNTu0Vwa7a/u1
        sVnpAe5InfdZ9v30Q+yzJ7SZIBdoTZMKQRsXJNyZfBp7BTMxsicO7NeFKhovg+6H+DCeXpsdhPo
        aPwza2qh0msrIXew==
X-Google-Smtp-Source: APXvYqztMEszC0Ky5djm8uuwuR/II2Mb1+Fwyq/KRit0H7IqoGm+DFO48F4wpUT/KyXVhmxseUknyg==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr7786636wma.172.1560516598910;
        Fri, 14 Jun 2019 05:49:58 -0700 (PDT)
Received: from [10.10.176.11] ([82.222.188.130])
        by smtp.gmail.com with ESMTPSA id j123sm5387879wmb.32.2019.06.14.05.49.58
        for <linux-wpan@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 05:49:58 -0700 (PDT)
From:   =?utf-8?B?TXVyYXQgS2F0xLFyY8Sxb8SfbHU=?= 
        <murat.katircioglu@trendyol.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: wpan-ping not working for an initial setup of Openlabs 802.15.4
 modules connected to rpi 3 B+
Message-Id: <1564A594-A50D-4FA2-9007-38C38522259A@trendyol.com>
Date:   Fri, 14 Jun 2019 15:49:57 +0300
To:     linux-wpan@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi All;

I am trying to set up a 6lowpan network with the openlabs 802.15.4 =
module and the rassperry pi 3 B +.=20
The kernel was before 4.19. after 4.17 kernel downgfrade although I =
could not install. Where could I have done wrong?

Thanks a lot.=
