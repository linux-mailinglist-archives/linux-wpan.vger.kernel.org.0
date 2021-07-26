Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B364C3D636D
	for <lists+linux-wpan@lfdr.de>; Mon, 26 Jul 2021 18:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238688AbhGZPr7 (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Mon, 26 Jul 2021 11:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238199AbhGZPrm (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Mon, 26 Jul 2021 11:47:42 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1709C061764
        for <linux-wpan@vger.kernel.org>; Mon, 26 Jul 2021 09:28:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so377623wmd.3
        for <linux-wpan@vger.kernel.org>; Mon, 26 Jul 2021 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=kncW2zoYdO5wqDEc9msMKDZoMpdAKqI3NmnBNZDVg9w=;
        b=X/TFdQhFpgTaiLa+uX8i/Lcw/CXxPKbCEh/Oh6JuztITr9FG/0gc/N3xIRejSPp/7O
         xXEj+pxuR+QodgFytpQyCmhjgDv9y4ExGC2/WyXV7slMptrSnmS/BOLCkZ0v0dYVg5Gt
         X8VxiEymX7QQ1YUhmt8Wqm0SrCQGGHJSfLeOOMgNSn/seq0NsWBD+xbNWLHM+khBOPWl
         o8kfvHfqSbhQG6kfs7kDFZaxpjsDtKNZxIu+B0TfxOK7VOqMPKuFVsQ3Qx/FPZntKfeX
         t+blmyKeKwIAawE17Pd7WByS8GqsH5grwdLFsLepi90cIM0Y1YDixjUS/3Ui7U66RHe5
         f0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=kncW2zoYdO5wqDEc9msMKDZoMpdAKqI3NmnBNZDVg9w=;
        b=IzKKAwLTCHL+eqPge7098BJszyTjCh294cwVKfv2IxtQfVX1H0qCZP//0DuGCV5eGq
         eS62+g6nH96WpLu7s/8xSJU0GMOPiQT8kc3LaFiFncm5Ss3Jgw2ZjLo5vaij4YloOq29
         f12UDNWAyJg+DbeMd1lohYrzd26JUMRKBToV8CF2JLMrAeoxdOoFX2ebo8esSmV4Zm2Z
         iLqkYSyQ0zdI/iPx3wFCNyy+OAKTOUZVXQoM60HJIYh8ljSP0J1tvkSzTDHZG4gP7Hxc
         d2MrzL24AOAGqKm9DSiD4yRcPAASpxo1bUFt5wU2ozNPKBDUiqsCtKQtsxsxwEIUySNC
         wgrw==
X-Gm-Message-State: AOAM533A8AV7LlIDcnvg8wFdt7Lfq0qrXCY4Ri+XzXwXMjqdRdBN3XWb
        u6zlGoS9dXJssSD+7UZY49cxAHltbBtuUq5k5LY=
X-Google-Smtp-Source: ABdhPJyMhyTy/tNQl+9U753anWdcr6Cfig4IjuHUfJDOqeCiaJl9OFzrfx7J4Krjh8EdkaR5333PS7mwA0mP0lgcstQ=
X-Received: by 2002:a05:600c:19d3:: with SMTP id u19mr28651667wmq.115.1627316889510;
 Mon, 26 Jul 2021 09:28:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:f94a:0:0:0:0:0 with HTTP; Mon, 26 Jul 2021 09:28:09
 -0700 (PDT)
Reply-To: cherrykona25@hotmail.com
From:   Cherry Kona <ambroisetete20@gmail.com>
Date:   Mon, 26 Jul 2021 09:28:09 -0700
Message-ID: <CALnhZLQPPNvn8NCJOgqx8Aa0ZY5ubaw0TOKt6c+cVfB40P6N6A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

-- 
 Did you receive my message?
