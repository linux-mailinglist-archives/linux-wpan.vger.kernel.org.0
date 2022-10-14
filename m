Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6FE5FEFA7
	for <lists+linux-wpan@lfdr.de>; Fri, 14 Oct 2022 16:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbiJNOER (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Fri, 14 Oct 2022 10:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbiJNODi (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Fri, 14 Oct 2022 10:03:38 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC7C1D3C68
        for <linux-wpan@vger.kernel.org>; Fri, 14 Oct 2022 07:02:57 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id e62so5706227yba.6
        for <linux-wpan@vger.kernel.org>; Fri, 14 Oct 2022 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=g4G4xdhbJznBvRlhymq0fqnwkphY+F7F8oq55ntDIK+watbk9gtUaHQUK6DE4iGyRr
         Byk3s8hIeeupysYBS+wvCQ1LjVIqsIaBxrBJRI0tX36DNLvBq5Rmf6eFFExktrt7jkzq
         oz35k4dg3e3czYorPLUyjvBC3RvTBhbu+Rc2wzOdR5CIgVFpsARpf4z4aYsvn2iagaS0
         xN6SE0i3u3UsOv5gItt7G9P4ALR7zXhJG/tLqkXAKiN67dMTgWxg6Um0NFtESfVGpqfz
         0tV4Yf1jNee6kekTy3veZ6iAxxBikiMnsAYVNV4J7/c1hFTt1bS3jGlXBVvUtuGnZWn2
         CuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Bxb+KeZshozUjJfiZ0/AjtlcVAawQDhzhxxiiJbP5vnvvAt0AmnjydvGYmip+bF9QD
         RI5dZ3+9tv9D0H35MAqDvT96YP6T5+s/XuCpW8W+qQCmX3k5T1drhW2Ub8VcWoxSu8VM
         AsnRKuZOhnSXh5tC0KbHpmDDVeTknEP0AN+BV7TgiJfXij6Fn5xKH7rh2Q4suhBSL6uB
         GnufQU67o6bUn3O0Ru8uGgv6qkHiPNPNdV9k+Bb/SulDrm5/n9COLyn49JkwPQaQKP8K
         ZZ913AiubDA8oNkbbutzNoPxld60TkQ394/6TYngMgOMo7WTsXEBhHPs9EVyN0LtiVWf
         vRVg==
X-Gm-Message-State: ACrzQf0hW8anh+Eg9lXdeJV/+CKQ4DOpQ1txEeTaEn7lnMoidwbG0L/W
        D7r5EkLVe0YYCLa8/gSw3FN9wiMViZoknbFL444=
X-Google-Smtp-Source: AMsMyM6TZTBh2h9tVZ9Ep+pKPSjU6c9LlnuKlNv1AcEWIIbGDmp/UrtX78FDQ+FbZauB4D6uUnUhXIAtnxGOfdYUwhY=
X-Received: by 2002:a25:1606:0:b0:6c1:7c57:ee97 with SMTP id
 6-20020a251606000000b006c17c57ee97mr4318493ybw.503.1665756130748; Fri, 14 Oct
 2022 07:02:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:6c05:b0:3c1:5961:57b5 with HTTP; Fri, 14 Oct 2022
 07:02:10 -0700 (PDT)
Reply-To: tatianaarthur72@gmail.com
From:   "Mrs.Tatiana Arthur" <goowjarwq@gmail.com>
Date:   Fri, 14 Oct 2022 16:02:10 +0200
Message-ID: <CAC-x_XFZOWmkghicGS_8EqW6KvXPWZa6y5_cgQxEOxFq2=LuDQ@mail.gmail.com>
Subject: Did you receive the email I sent you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org


