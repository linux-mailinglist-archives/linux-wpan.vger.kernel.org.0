Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26A648098A
	for <lists+linux-wpan@lfdr.de>; Tue, 28 Dec 2021 14:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbhL1N1v (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Tue, 28 Dec 2021 08:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbhL1N1v (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Tue, 28 Dec 2021 08:27:51 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51874C061574
        for <linux-wpan@vger.kernel.org>; Tue, 28 Dec 2021 05:27:51 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so24385499otu.10
        for <linux-wpan@vger.kernel.org>; Tue, 28 Dec 2021 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:cc;
        bh=7f0Bjb4CTA9sDf/RhNU0ViDB8ImucRrQA+jdH+nCegM=;
        b=bNpDt7mUloC/g19/FvSHdbmHsaEUFVzEu8TfMvg05NsLmw/PULZMz6RLOAStYbhQ2s
         yzIXrTExmOIYhqKS85H/iNMOXWDcxOxkUcwUy4ot837RTftMxyJF9wi5GK3ETxoImE7U
         d09AEjcV5O8xx2YX8W84oIt+yl4MBut7G/wmixYgYSXibsGZfZ+cTYGWOmUykNoQjD5H
         BSJa/GLf/Fp0L5v483sCcSMxcSHR+AIvhzOvVb5N1COXakq6lKbclpSM2FxOqoX4qfm0
         AZeswi3gU47p3SbquKBlCXCIPzUN0CMQXZoHnR7sn66adUTJJrcTXlEppWZGVL3MOCWK
         uQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:cc;
        bh=7f0Bjb4CTA9sDf/RhNU0ViDB8ImucRrQA+jdH+nCegM=;
        b=g8LN7Hb7dD7vrKghP70Bnf0G/g8gOJ9wE7RPtzy3zKe0VFsP7fWbv9lQ40AOEWsMwt
         sG5c2eSy14iwCaBpnBzhRiu2Ql2cXqEXPQHET3YkVTotnWFTgMzh4BY1vLC9eTLj39Rr
         9fcBawyBcu0kDfJtbMAvsHSZ+NGdOhEsbiwYYVg+JdnvqkK4XEPacvKiDZfBvg/EuyC/
         enr2M4c4BFCvqXxxX4/pO1G/emI8RBUdHgk9qH9GtSZmwwo4Yzn+97+Bp4MbEeeMBEDD
         vwXkMBErB+x0Z92+TkLWpzVN+kNvG5suEgxgbys/QGn0cVW/GsbY+BUXP21o+j0lh5bK
         MZMw==
X-Gm-Message-State: AOAM530ROyI2PE/Ngg4GYhJuhhcmsZGD/RxbpDv0KILL9FFqLW0ugmcD
        w2DSsOtyQUUPkeH6H073xF6iMF/xkdpLZDIdEUo=
X-Received: by 2002:a05:6830:2693:: with SMTP id l19mt15865430otu.338.1640698070717;
 Tue, 28 Dec 2021 05:27:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:6c95:0:0:0:0:0 with HTTP; Tue, 28 Dec 2021 05:27:50
 -0800 (PST)
Reply-To: israelbarney287@gmail.com
In-Reply-To: <CAA4TxLBsoXXCY1GzPdnSPOSHC-7cU5y9zWBai0mKAW8NWQRyuw@mail.gmail.com>
References: <CAA4TxLAu8=2raBhm2JSyO7e0J6z7XYcnKLhGjFh9i9HFswU9WA@mail.gmail.com>
 <CAA4TxLDBJ2RMH4mdvm0DWwrG3s4_jM_Bd7bkjDdDfuQa5yBaHQ@mail.gmail.com>
 <CAA4TxLA7yHtChVy14jGRO9xiYOSqs7hSuoO4AEuQ64_nMMu2pw@mail.gmail.com>
 <CAA4TxLCHi1CxSFbgveQXq=-5qkz=Wd8pRSTU4GOiFZsjGfWt-w@mail.gmail.com>
 <CAA4TxLDfqA86Ab+Ry_qLPRh=-Xrn_bb9kn2pyQDmnmhSGiCHZA@mail.gmail.com>
 <CAA4TxLBkKhL+QX+kOORBeEZB2JskdvKURXtmSqqiY1vTkkJYdQ@mail.gmail.com>
 <CAA4TxLCN+k=E=Mr+A3ZzpgmeCrektfV49sDPc8y66nxZk+pbzw@mail.gmail.com>
 <CAA4TxLDY9qGQ=Anm6-hQMGCYjLy-VDt_tVLKQr86gknK1jtFag@mail.gmail.com> <CAA4TxLBsoXXCY1GzPdnSPOSHC-7cU5y9zWBai0mKAW8NWQRyuw@mail.gmail.com>
From:   israel barney <kristengriest098@gmail.com>
Date:   Tue, 28 Dec 2021 14:27:50 +0100
Message-ID: <CAA4TxLBq5O7AyphtrUyYwf5LVxSRdiWXfk9RkLXc49JT76RZgQ@mail.gmail.com>
Subject: Hi
Cc:     israelbarney287@gmail.com
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

Permit I talk with you please, is about Mrs. Anna.
