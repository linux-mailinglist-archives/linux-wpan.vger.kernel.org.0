Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035D87B7C7F
	for <lists+linux-wpan@lfdr.de>; Wed,  4 Oct 2023 11:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241000AbjJDJnj (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Wed, 4 Oct 2023 05:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242070AbjJDJnh (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Wed, 4 Oct 2023 05:43:37 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CA21B9
        for <linux-wpan@vger.kernel.org>; Wed,  4 Oct 2023 02:43:22 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 46e09a7af769-6c644a1845cso1236609a34.2
        for <linux-wpan@vger.kernel.org>; Wed, 04 Oct 2023 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696412601; x=1697017401; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU548seJ+5zMe+Z5LSygRVRGtbVoNQXTGH3w2Ep9TOM=;
        b=BE5eXA8L2bvROOCZ3cfUQZ9JYiyBgvwMULDzCOYZliG7XawROohfjnT5GtVyx+W4aw
         u369wZXTSzzC7jOyBYRF9/kdpIixLuMn03bDhovmHVwMGlnycnJwX8LZ5xA0u5ZOpF9o
         WUodgdG1KERXhKdj2ZwBScMnOJ9RIN96aK6wdcr5NDV4/8BAGg11HSjsZB0eo+RLoXIs
         0V+NAO5v9jenlohJrub+LYl7ePaHx8sLAIPRte4vT2kPtHdyTZ18kowCqHqssmmrWr3B
         +muHejNH9MDiFyz2JHZGEhO4IhOvzwjS7LMLQujqPq+/KgkncHiYSagQQoz2HhyuR0ji
         itHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412601; x=1697017401;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU548seJ+5zMe+Z5LSygRVRGtbVoNQXTGH3w2Ep9TOM=;
        b=QnQBX+gbTZKOGqSkcRc9/ZDuG/dMzGBXoO/sfSAcTCbCj1kES6ZpYJ3E9kDzGly/ZH
         J4bA4G3ZKCqD8ndcsxFM+0sSWF58XlZ+BABfiH749sBOz5k49zAF3k/9CTarpsUGt/+1
         4moPpuoehXTg6Wd+HV9UxD/oSwk92qBBPZKOKlJlA88kXGjz/rG2OJo6wQbTJNT49sMZ
         B4d0pBbTY0QPeJYhd6DGdmYs/DupSNMyiNUSBiq4jZjyO2yvI9WJIkpmdHfLYLtm3iHt
         /ck119eCIjc/qlfgBDw7A2lvrjwBc+0yqMUsrVHezjhlfySEACtKe3Xt0Y/6C7YaG/sC
         PBmA==
X-Gm-Message-State: AOJu0YxSlioAflY0OIXZPjqlU6v6oZ3JtvE3yW1BC2jv/vKjW7xdePd1
        yeXbA5Tp8VwxTw/FgPnkfU79joUZ4UgWbIy50uw=
X-Google-Smtp-Source: AGHT+IGU1pxuxLSxjOP+CuFF6xfKArQnu8a/NBnlQ5qASTxXKBZnY6mzoOCJmZS5sf3Mg+7mHLoEfEj+4JQq7QIV1YA=
X-Received: by 2002:a05:6870:5489:b0:1bb:bcc3:c96 with SMTP id
 f9-20020a056870548900b001bbbcc30c96mr1893879oan.33.1696412601399; Wed, 04 Oct
 2023 02:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:318a:b0:143:322c:caa8 with HTTP; Wed, 4 Oct 2023
 02:43:21 -0700 (PDT)
Reply-To: mrsaishag06@yahoo.com
From:   Mrs Aisha Al-Qaddafi <mrsaishag89@gmail.com>
Date:   Wed, 4 Oct 2023 10:43:21 +0100
Message-ID: <CAF-3XQQyFPhvQCTztws82QyyadmFurxiu2kMMpBzAXnLXjEPWw@mail.gmail.com>
Subject: please dearest did you received my last email
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:344 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5388]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsaishag89[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrsaishag89[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrsaishag06[at]yahoo.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

My dear Beloved One, i need your assistance.

Please bear with me. I am writing this letter to you with tears and
sorrow from my heart.

I am Aisha Muammar Gaddafi, the only daughter of the embattled
president of Libya, Hon. Muammar Gaddafi.
Yours Sincerely
Best Regard,
Aisha Gaddafi
mrsaishag06@yahoo.com
