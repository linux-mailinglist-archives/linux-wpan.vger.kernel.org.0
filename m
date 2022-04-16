Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC4F5035C5
	for <lists+linux-wpan@lfdr.de>; Sat, 16 Apr 2022 11:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiDPJf1 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sat, 16 Apr 2022 05:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiDPJf0 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Sat, 16 Apr 2022 05:35:26 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E688419014
        for <linux-wpan@vger.kernel.org>; Sat, 16 Apr 2022 02:32:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 2so9300440pjw.2
        for <linux-wpan@vger.kernel.org>; Sat, 16 Apr 2022 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=OnMnDXtsssG1PMJV6Vh9RVlsBYxuMtuzQ5K5pRFEkV5qXn+ZrAh2ZFslqR4xnKE0Hk
         GQ+CLHJutLWWqMO75QFhM+IRA2/wZNMVNNcM1+YCF17b5Q7YW89l2uF+boY6Ofow7+NL
         fn943S+jW/NDjJPK14vq+4P/pJlDTTNjvxKXkLEF8KhKMBcrgxyWNvAuMW4I2vWnlBY3
         p+cg39Sq6bKocB3qUzkD5Y4iPLgW1eaGavAbw0OiLhzqeZYTO0w1k1ArafUEW9XAFM1h
         LcW3oHaeBgS6JQujSIDEEQUdp+S4xQBMeXONCh927/HQ7YCGo6Wy46LIPPkPn/NSJJQH
         IhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=aXKitCy6VLZQClwSqz0yJ9qEkjLUwY32mk1Arb5DGZhLHjS9qjrcv1dO7T2gsd2ARw
         if+FpqnY+eyBxI++Hf+VGd0jBu802sk6CVKCiTGZ4HVRF9/kGMO+bKgFWdqf20Tk+7AG
         qzzGGFZB2hDoa8yrB9NEi9QdwwjqEU3sQab54qM40F+w1+CQIxUA4UP+nFRclcNJI7Pw
         tYdwYLCDFrmGyiP5wOCtFiNye6jlLPLlmqY0os39gGF7ESH4XBHSIjnsqlcduOCqcrMr
         1aFHlE0tkLlbCEoMNmdyW+0GaLpfiuRIjTJeeqhReym5M7Ah95YKZxEZTgpHPMfxFY5H
         784g==
X-Gm-Message-State: AOAM530Ist4ro6OrluOchkctyFfZshFUDTlwDWgUEgOfr2jeHNQKbq0I
        HMxI8wcNjaJKcwj5kH0/Lke9lmTggUIi8wX1YZ0=
X-Google-Smtp-Source: ABdhPJwqCsqD5DZAs+yLsK1Q40OYa2x34kCD00ZToa8SgVmMan3kS1qBVhMdLvxYJTagyhSyDcUKkxCWEpGV9apRvWU=
X-Received: by 2002:a17:902:e141:b0:158:e152:adc6 with SMTP id
 d1-20020a170902e14100b00158e152adc6mr2754842pla.161.1650101575023; Sat, 16
 Apr 2022 02:32:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:2d9e:b0:7c:79b9:95a7 with HTTP; Sat, 16 Apr 2022
 02:32:54 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikram <kodjoadannou123@gmail.com>
Date:   Sat, 16 Apr 2022 09:32:54 +0000
Message-ID: <CAOtKoZ81uRBLE+0pS5Dt7mz6euSXMSMA9xV1rpct8CvfrmQcEg@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Dear ,


Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian
