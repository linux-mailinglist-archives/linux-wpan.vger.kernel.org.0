Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A972620E97
	for <lists+linux-wpan@lfdr.de>; Tue,  8 Nov 2022 12:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbiKHLUr (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 8 Nov 2022 06:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbiKHLUj (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 8 Nov 2022 06:20:39 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745B149B7D
        for <linux-wpan@vger.kernel.org>; Tue,  8 Nov 2022 03:20:37 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 63so16993661ybq.4
        for <linux-wpan@vger.kernel.org>; Tue, 08 Nov 2022 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=J4BNN7jKfVfT0aL+JmOkjuoB8t6+kSq+FK+qtmRP1DScVaKYSfpiIdvKdYE9swFUQY
         XtHjWaqnZFsSXqYA0o+q8CHye3arwTjr+hJBusI7mFqLyj6iQwnPEZnxpt7jEFXDv67C
         i1RnWN77TDRD4R5bcXZk31BtpxWQI5F6il/aa7D6YEvXraa0x5EmFHE7S5DfyEv8K6Mr
         sqvmxMR+LFYCNchTyksG6bgH4YMBdFO7Jyo5yt1Gfv8N5WpJHQg7liyYPj6Ln7TcsJ1M
         7IF7H63JmVDaojfGa4RBrUx2qi70wmC2uC2C6sS9nlgayiVSuogPYEW3OyiZYJzoef10
         VIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=MLeBXalJD6p2VeEB/UGij9eQnfL1MGC4fT9nz1W42OAjGGSR5a/lZtutPhQ7MR+IzH
         BLAUiXAIlOfcCf2DuDSKj6dH3Z24f72kOYirbFT1nkXE4iW0ipOLD+jlStQGkHnbM6GV
         eA49jZAi/LgPSbadTA7lwBn67E+CWPETXE5IAW4fNz14PlHRpOW9aPjo+atUXs5w9WXn
         MMhcGrsICjubsFKQK1GM5RBiK1SXmkcv7QJX5mzhDXsiKUq02jqjoIVAU+IKlUJvpS7n
         8UQ2fp/9mYlVOChSjK12kjc9IxcNcygvpzLFloMgg9pNKUiHZBUAAvzEGQjP3L3wUVdo
         EWZA==
X-Gm-Message-State: ACrzQf1lpgnZLjLuQYjJDHEsIDGb28uT/yYHM5rYJxpCO85nOUwx/S7u
        7iECyo2biLBquXmbs4ECUC0IYDnQN1r+BSG0/aI=
X-Google-Smtp-Source: AMsMyM6xKqU5Rjh4+2+AxAqC0U0YC7Pv+rLQ5ILVu1L9p+G2RCExT06n9hL8M7TD2Z3SGUMSH2B3gfKMmkK13680VKQ=
X-Received: by 2002:a25:a088:0:b0:6ca:33ff:5b30 with SMTP id
 y8-20020a25a088000000b006ca33ff5b30mr54330551ybh.242.1667906436602; Tue, 08
 Nov 2022 03:20:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a38a:b0:313:c983:1d7e with HTTP; Tue, 8 Nov 2022
 03:20:36 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik2@gmail.com>
Date:   Tue, 8 Nov 2022 03:20:36 -0800
Message-ID: <CAC9COZf4gVM4aT_ghoemxu3B8PtJ41D3GAMuMHbW-Zm3a0vanw@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik2[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

-- 
Hi

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

If you are interested for more details.....

Sincerely,
Kairi Andrew
