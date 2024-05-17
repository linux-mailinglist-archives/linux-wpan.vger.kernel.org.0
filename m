Return-Path: <linux-wpan+bounces-255-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A92108C8BF1
	for <lists+linux-wpan@lfdr.de>; Fri, 17 May 2024 20:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378951F29CF8
	for <lists+linux-wpan@lfdr.de>; Fri, 17 May 2024 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912A313E02C;
	Fri, 17 May 2024 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HW4kVh7M"
X-Original-To: linux-wpan@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B213DBA8;
	Fri, 17 May 2024 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715968829; cv=none; b=PfTcrR2zvZCJiLCv7wtiRiC0ySEUva6k1ZYo/is2Jq8o/lO+1CE2bGRLoKCdlGRqMsiYH85bHeCMjl8sirBUKSeLWbqCdg9vIBsFm5OWatum2o53dKftb8c5w1wrtfu90v7sbPyAb4ot/6LlTZYavLW7XTaQ1yNLAA03txZ/wAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715968829; c=relaxed/simple;
	bh=hozAzpQMXObpbdTk7Ibzjpn2uslGrLTRVG5E8LS6QJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwH/jvTwkNY1CGaK1H3l3hV6WqCOVqPoj8nYiJPtHZe5aaDzOerBiTgmTk3dloDvfABHjpRX7HuvVTNvzSZeMtn4gtbXZNoDwdXwxAX1FlNVr29CrBfUPzGS0L5TBZG6j4tzEhSCap+JskwXLYlifjKZJSK1JgyV3g55UGCrATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HW4kVh7M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f08442b7bcso17357835ad.1;
        Fri, 17 May 2024 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715968827; x=1716573627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w/StxRW/VLxGkt1YAzvKzW9ayexnITae0WPMFzYawxM=;
        b=HW4kVh7Mf1aqJZXkXUCX5NqzIMDENND+Ktu8JZlXTbcrLARq4Fyzu5hfIgcu9+PuXk
         CzwAEiFryEdp7zEYZ7/kjY3xgqz0AVfUAviZ3qxix3G/MRZzblh3TcDG/y77K5wI4QjU
         J/RkIYmye0aYTb0f/nC+C2FYHXxqaWSDoHP2HQWFLdxu4Iy74tgchlE5zb+dctwtERMy
         LesV3t6oNdCrKBrtbW6UZ+0J1f/SId6G3tadCWC0iQDOih0CvZk0/AkeOVjRcrGIKBMO
         y4S9xD9CM2BG9wvv+E4ikhz0Tyxnz6mLFUEgEnk50X6OyoUMleopoh90qQA1oNVkpieV
         X9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715968827; x=1716573627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/StxRW/VLxGkt1YAzvKzW9ayexnITae0WPMFzYawxM=;
        b=hrYi3kr7p2e2PDbxC4rCEenybCLRkHABvcnL9afXj51LSKzK6GiC4kwd3Ahhcw/0am
         fUZrorqKewsU12XiWC/1c6v8zLIgCJys1eFz51I8xIsW2eNUsVu7gkleCB+PyqnmhE8y
         QUKadiMO/zWU6+LB6mA1QjOasJpxSY5qqvauuhEl0BE1AUP9YPiG+u5LoYTVrat1qy50
         wbmRNT60bGPFMJDgftNwhReNy5taqoyH7S4kziBpQHdLSMZV0ufiFc+D1ZjzMMMZn6I9
         7KCKa01uNAFCpANDsIXOlOg4qwQgzQQUhxPN4nJfjsMCJFoZxd/mop5neDniJzJ2q01+
         964Q==
X-Forwarded-Encrypted: i=1; AJvYcCXggv4wnW8V/iWNwr9JL2+Ju3Bw/qOsScDe7myDx2E7msxw0E5MywO54B16ENDrxlDJFLYiTuSUyYHMaprBktOhME92E4VPAj0M5HgxidWsm5N5VNdDCetYT4YL64DMim9j56BmKB8=
X-Gm-Message-State: AOJu0Yxdxmx6zifn01xamrgFUvZHEjbeX3xa2KwUFGpt1+lwkuvJcwXb
	OCuF0WcNKSXw3iiqU574wWPTN7V8K22sIOQMLIfl9moi3bSv+8Bl
X-Google-Smtp-Source: AGHT+IGZDVzcY7OCALKn8Hd9OAI6XcssKSQlDPeH3SNH0EqlCaPwK+7ssdLCEtEMxDGdIwihVzJtAg==
X-Received: by 2002:a17:903:120e:b0:1e4:6519:816d with SMTP id d9443c01a7336-1ef43f51feamr267718025ad.48.1715968827236;
        Fri, 17 May 2024 11:00:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30bfesm159992895ad.175.2024.05.17.11.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 11:00:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5cff0ff0-48d1-49f8-84f4-bb33571fdf16@roeck-us.net>
Date: Fri, 17 May 2024 11:00:22 -0700
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org,
 selinux@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org,
 linux-sound@vger.kernel.org, bpf@vger.kernel.org,
 linux-wpan@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
References: <20240516133454.681ba6a0@rorschach.local.home>
 <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
 <20240517134834.43e726dd@gandalf.local.home>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240517134834.43e726dd@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/24 10:48, Steven Rostedt wrote:
> On Fri, 17 May 2024 10:36:37 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> Building csky:allmodconfig (and others) ... failed
>> --------------
>> Error log:
>> In file included from include/trace/trace_events.h:419,
>>                   from include/trace/define_trace.h:102,
>>                   from drivers/cxl/core/trace.h:737,
>>                   from drivers/cxl/core/trace.c:8:
>> drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
>>
>> This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
>> So far that seems to be the only build failure.
>> Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
>> cxl_general_media and cxl_dram events"). Guess we'll see more of those
>> towards the end of the commit window.
> 
> Looks like I made this patch just before this commit was pulled into
> Linus's tree.
> 
> Which is why I'll apply and rerun the above again probably on Tuesday of
> next week against Linus's latest.
> 
> This patch made it through both an allyesconfig and an allmodconfig, but on
> the commit I had applied it to, which was:
> 
>    1b294a1f3561 ("Merge tag 'net-next-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next")
> 
> I'll be compiling those two builds after I update it then.
> 

I am currently repeating my test builds with the above errors fixed.
That should take a couple of hours. I'll let you know how it goes.

Guenter


