Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1D97C57B4
	for <lists+linux-wpan@lfdr.de>; Wed, 11 Oct 2023 17:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346731AbjJKPEX (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 11 Oct 2023 11:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235041AbjJKPEV (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 11 Oct 2023 11:04:21 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF14A4
        for <linux-wpan@vger.kernel.org>; Wed, 11 Oct 2023 08:04:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32d895584f1so470845f8f.1
        for <linux-wpan@vger.kernel.org>; Wed, 11 Oct 2023 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1697036655; x=1697641455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRkqB8/peQlqSu9v9E/Jxgpb5iu6r7QHy0PIjTwaP3U=;
        b=Wa/rr+qYC8sSKEtftymBPnBFWOwtAUwirmBF/93mEazjvXl182v0aK/83guW5UIg+3
         LvIf0WO9xMZYUcWGqndZvFQyNv3fquN1seN1VZvwOeirw4vPCD7MDh12zjxaLqd9ffQv
         hN1748m3vSN+fdR/RdIdpJuTpkvGYFb9zcEzQ5yh1s3quTAsF0YbklAEQZED/94QYLTb
         0m6DI96wUlDwZ3MAWvcoUhHkTMbZKej9YJLJIma7++uCinn0aA865VUb8loQQtr96Ots
         AcZBjmyijGPOuiqDGYB6aF/oV5RpLoPrOd+J8FCLK/Bwwq6otnAV9CeslfrBz0WZAJ9C
         DpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697036655; x=1697641455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRkqB8/peQlqSu9v9E/Jxgpb5iu6r7QHy0PIjTwaP3U=;
        b=wANq6LUQMGvuhWEkdVw+rPs4bMzALfXLBBsDfaz6pU7hH/WHZ4gEA2tLUb3eKlFHrF
         cFdDkY4yyPYVplCtO35JkbTDO+Eb8jUhBZ6/j4Qr5HKnDGQ2dQBclPYtWrYqsrdAZzeW
         AvHYALI8TXnQdwe/K30mKzGaLALmRA6/BYM9YXCUGhRWKgcHlorSffOak4cQRVGnJSfk
         fRPrmuMsHRQTLaTPJmAwaWZU16XzjORJXqMD0yQ+V5xU6ET+fUPyeW5VsWJgnfJwQjb1
         RojVa8yGmLPiJ0v0UjzrXQF5P+huUhfAkFcq/Qm+AjfeEbQbv1jo/wa2T8XtxRvDXWzn
         6A+g==
X-Gm-Message-State: AOJu0YyAEPBdC8cBVf6Sgpowc6VmsI5plxto5VPCLNKGwClqXpu3GFZC
        SMPQ0J7h1WXw1qVWjh6RbqN4yQ==
X-Google-Smtp-Source: AGHT+IFfZQ1SiRV7geQ0Uqaa1luLtMmhs2/HZDlMTol8OQRTChK4x+uxynd3PWFf8uF8nkr/44Pylg==
X-Received: by 2002:a5d:548f:0:b0:31d:d48f:12a3 with SMTP id h15-20020a5d548f000000b0031dd48f12a3mr16620164wrv.43.1697036655189;
        Wed, 11 Oct 2023 08:04:15 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d50cb000000b00325c7295450sm15782616wrt.3.2023.10.11.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 08:04:14 -0700 (PDT)
Date:   Wed, 11 Oct 2023 17:04:12 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-wireless@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-wpan@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S . Miller" <davem@davemloft.net>,
        Rodolfo Zitellini <rwz@xhero.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 01/10] appletalk: make localtalk and ppp support
 conditional
Message-ID: <ZSa5bIcISlvW3zo5@nanopsycho>
References: <20231011140225.253106-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011140225.253106-1-arnd@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org


Could you provide a cover letter for the set please?
