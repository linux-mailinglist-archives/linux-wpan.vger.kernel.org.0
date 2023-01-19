Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62353673B0E
	for <lists+linux-wpan@lfdr.de>; Thu, 19 Jan 2023 15:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjASOFK (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 19 Jan 2023 09:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbjASOFF (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 19 Jan 2023 09:05:05 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F714ED0
        for <linux-wpan@vger.kernel.org>; Thu, 19 Jan 2023 06:05:04 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id kt14so5957246ejc.3
        for <linux-wpan@vger.kernel.org>; Thu, 19 Jan 2023 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AV4rd40WVbMFZkIUJcsvF7Mjp/MQlzSIO2ZQCTrdWbo=;
        b=JLT/SpEdU5FZ1izFxY33QRB4ZU0ifb3qFJVFoE5KI2Y497avwyOrNu+04PcTpnHVRB
         qjoBC9/fvnAqKBul9Slu4lQ6redM+2A7AUHjVo6475ed9a8izSsNUefF5oQLyt24wkJ+
         XhQETV9Dbxc4rR4zo7+vpQhNsmgsANkrE7vhN7K8ZNpgiSOBw66GpnkmwoDj7QF8rFf3
         vw2HsJ7rzH3ddn5uxmBvuFtynJyixgEDkYbvPHiW8cxmdcsURJ4IDSZQE5J21qWQI3g/
         RwIO6C+k/jHw94F8/xhpnZ2tNVALkh7DxuJBUTcON7ZEXoyByaOB+LD5x4ZMZ0R+Pchj
         engg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AV4rd40WVbMFZkIUJcsvF7Mjp/MQlzSIO2ZQCTrdWbo=;
        b=nfDTnTIgaJznOrbgsdvM1c2ynnFwLUEKpVskYxmDx+Egn0i2n0Gdey/3HDVhWrT5n1
         2yEiFAim+5n8qQhLRMl9ykiz2QDspirrA7OwwvljjNsqBvbK7iCrtOR8r0zKvOgDB6j+
         Yc90uV7gQXid8oEjjruEdD2NonTgnBFwEQskaPuxeoFC1z6EHUUhpVfra+AwSxhXJaaT
         WDkl62y4bUNXXaGIpxpkJ6UoMzpFAx8RvRrTh5nRZO0LoX7gukPhHtWUxbJgBD2IEX+4
         ndGm3FfSZX6OLDoLGGR7Y6Rsew/MWjmGNAWc+FZ8ekRpKINjkDeavvdXhZByYxqZNJLS
         1gXA==
X-Gm-Message-State: AFqh2kpkzgwnia3JqkIL3E0tyYnLaFiAf7Mf+3+cFnQZr4TxVFmKROOb
        oG3zmbN4iFVAaxrODsGwOKYTgVnd9Ats7qqC7CY=
X-Google-Smtp-Source: AMrXdXvPkNf1+64ei5YGnDWeAUjccr+sK9EF1f6g9oQbXJiei9ULcwVA+wFvVzIxFAo+SNfiT4XRGnHiaAYR7zbA9Cs=
X-Received: by 2002:a17:906:c08e:b0:84d:17e4:61e4 with SMTP id
 f14-20020a170906c08e00b0084d17e461e4mr961043ejz.496.1674137102749; Thu, 19
 Jan 2023 06:05:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:ce2a:b0:84d:feae:677f with HTTP; Thu, 19 Jan 2023
 06:05:02 -0800 (PST)
Reply-To: fiona.hill.usa@outlook.com
From:   Fiona Hill <mr2848830@gmail.com>
Date:   Thu, 19 Jan 2023 06:05:02 -0800
Message-ID: <CABtAzOadDL4tBUTpazELrYg4sGoh8GVBVKeDWkxuQ7qdY0KKoQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

-- 
Hello did you see my messags, I sent to you
