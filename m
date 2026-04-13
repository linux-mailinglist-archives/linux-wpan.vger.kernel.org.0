Return-Path: <linux-wpan+bounces-802-lists+linux-wpan=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-wpan@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEfxDJZc3WmadAkAu9opvQ
	(envelope-from <linux-wpan+bounces-802-lists+linux-wpan=lfdr.de@vger.kernel.org>)
	for <lists+linux-wpan@lfdr.de>; Mon, 13 Apr 2026 23:13:58 +0200
X-Original-To: lists+linux-wpan@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BED3F375A
	for <lists+linux-wpan@lfdr.de>; Mon, 13 Apr 2026 23:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83CBE303E8F1
	for <lists+linux-wpan@lfdr.de>; Mon, 13 Apr 2026 21:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ADA1514F8;
	Mon, 13 Apr 2026 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=globalimpacttime.com header.i=@globalimpacttime.com header.b="OHOMIlBg"
X-Original-To: linux-wpan@vger.kernel.org
Received: from secure.dev2hosting.net (secure.dev2hosting.net [67.222.137.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD9E242D88
	for <linux-wpan@vger.kernel.org>; Mon, 13 Apr 2026 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.222.137.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776114707; cv=none; b=kwN2tDkTK1f+V7ncth746gAkRTdMPk4VpuJ9QRVwGzkMWP3r+JIcf1Sg4wRAX4fV2hRfm4ryvV7fCydmz6DgsTJnn+SeSPHBZu9BFEwRgOKqr1Hb2KrjArGwgizYCz8E4RgClgchtd1Dj7lChzURzNJ+RlLVmAuk6rMrXadvEX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776114707; c=relaxed/simple;
	bh=opHl364UkrZ5yFsFqILty0i6nD4d+BFpK3GwY7ghAdI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rIp1GJeGufAcZka2uNXeu57zltJcjHQfRd4Zewb6j9vC/vg+SLJY9EEjU6EZNmqsAixgrk70uzoMtp4mOt6NpD7S4p/4QARNR82cZ3GWqaE1at80k9PFrFfIwsKa0UzXcJLiGJU8EvDEur+5RniFotRd10oYijKbLMQW8oVrQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=globalimpacttime.com; spf=pass smtp.mailfrom=globalimpacttime.com; dkim=pass (2048-bit key) header.d=globalimpacttime.com header.i=@globalimpacttime.com header.b=OHOMIlBg; arc=none smtp.client-ip=67.222.137.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=globalimpacttime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=globalimpacttime.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=globalimpacttime.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=opHl364UkrZ5yFsFqILty0i6nD4d+BFpK3GwY7ghAdI=; b=OHOMIlBgQ2sHjPT8sdOoPGPRzh
	HnO9IY8aEwwHnWRtlBjYOvKeO7ghmsE5QeYnGNjmiDdjBrGsk4dUlZ3RStXkJ7eawPy6vrAPnKhTo
	Uewce0zXa4KOpFP+GPcsOaOYlf7K0VMqXUNThNmzwZvN7tnjCrfBuFIzxrJSbOsBPjnOhTg7ST+5d
	EJKsQyZSKsLqZh0sxGsGGrYjt2yka9UbfIbOhvxVVEoS5sYzbG8Ezf1WE4mIOsL7TQ2acRKV4UfCK
	cXx1aJpA21F0uj/NhBHKndrE8W7iGwSc6ZG4WN9ni2ewCbVk9EqlqItEQ3ylDEpK7zWw5XgUgXtaH
	D2bU8g+g==;
Received: from [2.27.62.163] (port=53558)
	by secure.dev2hosting.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <crp@globalimpacttime.com>)
	id 1wCOTo-00000009Yih-2d1Z
	for linux-wpan@vger.kernel.org;
	Mon, 13 Apr 2026 15:06:00 -0600
From: "NexusLend" <crp@globalimpacttime.com>
To: linux-wpan@vger.kernel.org
Subject: Pending Application
Date: 13 Apr 2026 14:05:59 -0700
Message-ID: <20260413140559.ECB11DFA8ABDD5D5@globalimpacttime.com>
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-dev2host-MailScanner-Information: Please contact the ISP for more information
X-dev2host-MailScanner-ID: 1wCOTo-00000009Yih-2d1Z
X-dev2host-MailScanner: Found to be clean
X-dev2host-MailScanner-SpamCheck: 
X-dev2host-MailScanner-From: crp@globalimpacttime.com
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - secure.dev2hosting.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - globalimpacttime.com
X-Get-Message-Sender-Via: secure.dev2hosting.net: authenticated_id: crp@globalimpacttime.com
X-Authenticated-Sender: secure.dev2hosting.net: crp@globalimpacttime.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spamd-Result: default: False [-0.46 / 15.00];
	R_DKIM_REJECT(1.00)[globalimpacttime.com:s=default];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-802-lists,linux-wpan=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_X_AS(0.00)[crp@globalimpacttime.com];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[globalimpacttime.com: no valid DMARC record];
	RCPT_COUNT_ONE(0.00)[1];
	HAS_X_GMSV(0.00)[crp@globalimpacttime.com];
	HAS_X_SOURCE(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.440];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crp@globalimpacttime.com,linux-wpan@vger.kernel.org];
	DKIM_TRACE(0.00)[globalimpacttime.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-wpan];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,globalimpacttime.com:mid,share.google:url]
X-Rspamd-Queue-Id: A3BED3F375A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Valued Client,

Are you looking to expand your business while preserving your=20
personal savings? We have a solution designed to support your=20
goals.

We are pleased to offer a personal loan tailored to help cover=20
expenses and provide working capital for your business growth.=20
This crypto-based loan requires no collateral, offering you both=20
flexibility and convenience.

Key Features:

=E2=80=A2No Late Penalties: Enjoy flexible repayment terms without added=20=

stress.


=E2=80=A2Flexible Payments: Repay at your own pace, with amounts that=20
suit your cash flow.


=E2=80=A2Preserve Your Savings: Keep your personal savings intact while=20
we help fund your business needs.


If you would like to proceed with your application, please visit=20
our website using the link below:

Website: https://share.google/ibBimu6YaSG4wlWaV

We look forward to supporting your business growth.

Regards,
NexusLend

