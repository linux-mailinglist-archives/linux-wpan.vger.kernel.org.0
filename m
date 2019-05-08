Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E71A17D76
	for <lists+linux-wpan@lfdr.de>; Wed,  8 May 2019 17:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfEHPnb (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 8 May 2019 11:43:31 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34564 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfEHPnb (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 8 May 2019 11:43:31 -0400
Received: by mail-io1-f68.google.com with SMTP id g84so9485035ioa.1
        for <linux-wpan@vger.kernel.org>; Wed, 08 May 2019 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YYX7E7iR5nqLOZQLUwrAtuFr9M6AuUYPADgHcb9hOGI=;
        b=Wci141IdsYqgXnl/WZqJfrCjqVxcOYsM6oRufs6wt+xPbEEyrmQPANVHcUfpkymizV
         jxc/gRulYXB0YmYk8fJJfsRtw3dTNXQw/u2FwsIXGOLETTFxY0dAMO7qLUEra1vFM/iu
         gJLQhrSYPsFNwST0Z9lcAg9l1JEkIHPauHKJ1bwWRrbHHdc8Dmzhis/7pSe1IjDm3ipn
         4+Jf/XCczic/9hKJkXIDtA1LCEVvV9oRsXi8vRHEJGePpKbttvqfTvJZ/PIpHPe1jXsB
         IBObV+PaqLoE2rFLyuGp3837TbzNI2O2BTpfKRqJcz4yaTNnAP4EKMZY8QYVy5U3PmsG
         4ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YYX7E7iR5nqLOZQLUwrAtuFr9M6AuUYPADgHcb9hOGI=;
        b=aorMvrYBh0DL62AxoObMj9Nj0wtiQWj92Oe3SnItltCQhIsVEkzXbeqg3y3AhrF3Jd
         sjrOZ2lAnS5pZHcfsHBN4Xi2oaiZ+KcKzfX9RoufxSzw9joZSzQG5fjc9hy2xv1+l5hV
         VEp64tPuMm0UcWCbsfngT52AvEAy5byIHC/2ixfGgWGEOGgHWUO4A+SdHSbqUH2xHBk5
         KoUUNSarppBeS9z5IZ2KqW3O4QGgWGYXwltQbUVyNMTB/c/WkQBEm8S1+HnN3EXEAMRG
         GMRvEcDuq3UCPGN34BNfkYgnh0Zzq2mCOP74fIupkRt4UP8Ntlwlhnt9/lPN6pLlFt31
         Pogg==
X-Gm-Message-State: APjAAAW2aED+E/P0Z+IFZFVKZEtqYqeOCDJ1YXJHF34KVkHUfS8nzvnb
        /1woJhlJYGYZZfGEUUkxJnfJJvGxOhc=
X-Google-Smtp-Source: APXvYqywVLA8NBLZK+B52f+aPAYdFjmDjZBB45nL6pBS4meWOjIdEMsW5kTuLIBVJyo2INO0+dyeFA==
X-Received: by 2002:a6b:ba04:: with SMTP id k4mr11518305iof.127.1557330210591;
        Wed, 08 May 2019 08:43:30 -0700 (PDT)
Received: from x220t ([64.26.149.125])
        by smtp.gmail.com with ESMTPSA id b8sm5902557ior.5.2019.05.08.08.43.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 08:43:30 -0700 (PDT)
Date:   Wed, 8 May 2019 11:43:21 -0400
From:   Alexander Aring <aring@mojatatu.com>
To:     Aditya Nath <nath46950@gmail.com>
Cc:     linux-wpan@vger.kernel.org
Subject: Re: wpan-ping not working for an initial setup of Openlabs 802.15.4
 modules connected to rapsberry pi.
Message-ID: <20190508154321.34euz2ygus2qjbvv@x220t>
References: <C17AA022-0F79-4663-877F-A4A0A62E141A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C17AA022-0F79-4663-877F-A4A0A62E141A@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-wpan-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Hi,

On Fri, Apr 26, 2019 at 12:29:54AM -0400, Aditya Nath wrote:
> Hi,
> 
> Sorry for creating another thread of mails, but I couldn’t figure out how to properly send the mail in the same chain using git-send-mail.
> 

latest rpi kernel is known to have problems which I don't have with a
mainline kernel.

try:

sudo rpi-update 936a8dc3a605c20058fbb23672d6b47bca77b0d5

which downgrades the kernel to a version where I heard from people that
it works with the rpi kernel.

- Alex
