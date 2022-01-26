Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C61949D45C
	for <lists+linux-wpan@lfdr.de>; Wed, 26 Jan 2022 22:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiAZVRY (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 26 Jan 2022 16:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiAZVRX (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 26 Jan 2022 16:17:23 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BF8C06161C
        for <linux-wpan@vger.kernel.org>; Wed, 26 Jan 2022 13:17:23 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id k17so2606008ybk.6
        for <linux-wpan@vger.kernel.org>; Wed, 26 Jan 2022 13:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=HeTNr01RtMT3y1jwaE5DwhIVcnFwpxWhUzqMArakIPa9fir0IEZO/BgW13/OBi1N0a
         YrEGhtDTlO4F9gL4q7viTBXUuj+PhllRCpGVB9DFuTWtVObLUUwafUlogMyFrJT+7n9J
         UaT+aiZTA7Cd/FWxMsBVzpRLNh8rq5denFgP5xrKFPlHQbJnaoaw8Qw7CXBGroOGbKIr
         isjbyPSRjdL/xPNGh/od79Qq3cPbg3DyO9EC71Fwr6teRHKk8D2gRMQpWqkPw8Rqsk0k
         E2Sh1eprmuR3v6KCt998J2c8nxfYivzKo7vH3cMjxO6u2bQ9sfw8TbOU/L8cEoDc8GYc
         REWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=c+LPfD/MQUIZWhQUPUhPQUvqVygfYX1dVBILBJN/jhP8c7NwioV/KcMfyYclSCNxhV
         oZ6niAFRaWqKrCZFaYIjKeRGpWy0l6XfJUJ4G1kTe30en3cfzlpmnTlmOj1/QIyk6w6s
         d8WKFmu/MmYW8JA/il/dQpdjyZqw1FNMlrZXuYCp2oMiyL3v3Eu3E199emIfUb42ESYX
         M9TheN6ai7H388KXxJpn9Wx14RDDRVRb+Kg22fZQTamxvemaYc5L+ls7DG2uO2Su9Zvx
         CFXXW2szNj2WFu9C3b+7mZXr6TdNAQnfEt3sZOxLUDLULazRrjXMCiQB9/SL2mvXo5UV
         46kg==
X-Gm-Message-State: AOAM533giTcM0DW0qukCUUECkR0HBrIDp4odGIlfMsPr4rbAVSI+1EQm
        C6r/wDFIjOjf4umdmy5LUaOOYGFgMKSd4YnumA==
X-Google-Smtp-Source: ABdhPJwzTSn8awA/m/Z8j+shhGFcdRgYltLxXFeuvmlWzJvfCJM6KDiT6KJ6gjFe0ysgEAzpz338Z+ie8K/z55R9okU=
X-Received: by 2002:a25:25d0:: with SMTP id l199mr1180595ybl.454.1643231842154;
 Wed, 26 Jan 2022 13:17:22 -0800 (PST)
MIME-Version: 1.0
Reply-To: martinahrivnakova@post.cz
Sender: compensattionoffice26@gmail.com
Received: by 2002:a05:7000:bd9e:0:0:0:0 with HTTP; Wed, 26 Jan 2022 13:17:21
 -0800 (PST)
From:   HANNIBAL SEHESTED <a.mboma0@gmail.com>
Date:   Wed, 26 Jan 2022 22:17:21 +0100
X-Google-Sender-Auth: StG8Sb3O3DPYacQ6mybFwfse4nI
Message-ID: <CAGyEYSSmU1rCSy33GwftRwh+DUprmb_6eABNuNMnAQ+mpG_6YA@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org


