Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706FE53AF69
	for <lists+linux-wpan@lfdr.de>; Thu,  2 Jun 2022 00:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiFAVKV (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 1 Jun 2022 17:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbiFAVJ5 (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 1 Jun 2022 17:09:57 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417C23968E
        for <linux-wpan@vger.kernel.org>; Wed,  1 Jun 2022 14:09:56 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-edeb6c3642so4380607fac.3
        for <linux-wpan@vger.kernel.org>; Wed, 01 Jun 2022 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=HLFKV03IvnCnmYNulbqEkPjTK3riUL87h2wHAPtiQ15M9iY6Q8e992KMQxJwLdk6f+
         yc6asPWVRklcz8AY8oqwyi19SO9Z3FXfSKl8KIcHwdn2diZ16fcVN3Noj9XYHhxCnXOp
         L86c6aBumcYcai1ti0jT0anzEO5LqUJSpP7KiFxQXIe3O9qnWY7viJfSABa1ly9ubc5O
         7xqU4M/fQQEbpLLu8u6cCuAo0xRfp/5LoTJYIMP5ne/O4VXGwgI3hKlV02ue3fdzqvYA
         6IABKhDngCz8ZKTuipfv5GZ/7HEqJFbM8x/u/85qQFiKTPs+Mb3XRU84XoMrlsTu1Zr+
         PsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=KbeX+e/sq8WlIOX0XgQDzd/DD4FsStqPoiWjEo/Pismkh39sWv+ssnfF1NAzs73yNY
         QHCepRDICzZ58mndvualm9XTZKtlEQL880P2yZ4Q6mBGr3F6Bdk+YFFzeDpMZ0dekP8O
         2LTpkc/zqQKtje9To2gPE7TqFxjupAOsNNi+ZqLaOkvEyvW8iUgYUAsywI3jHioqW/id
         TZORMQ42Aink1Dcv7Hk9q9quT04sqPpE9P/J3cjZJ8TAEhHl9NYhOCJxdeozBuKCBc3G
         Ll1yJLG/nbLg5uP5dcbwA6uqGH9rDR6F8wQL0MOcoS9/GNCrl2TIAcUJmcf63aQmanpY
         uQVQ==
X-Gm-Message-State: AOAM5324e3zasBYamg6vuUYPYae+qAFhwXzJ3YrOPGuENGs9Esa7rJgf
        HPoPeigZ8ZYfFcC3+bTXnA+UpRJZ3ogFcIPVjhTqfS9FQGI=
X-Google-Smtp-Source: ABdhPJzieEZsH3sz7p7h/CGCrygaKC3twss2VqEDgMRTw52PjXyF0yZxDsfC/Wcw+CTWK4gcBihtpQQBph7O0cnThRw=
X-Received: by 2002:a05:6870:308:b0:f1:ddfe:8ac5 with SMTP id
 m8-20020a056870030800b000f1ddfe8ac5mr16670934oaf.237.1654111051378; Wed, 01
 Jun 2022 12:17:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:17:30 -0700 (PDT)
Reply-To: johnwinery@online.ee
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:17:30 -0700
Message-ID: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
