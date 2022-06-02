Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3045453BBB8
	for <lists+linux-wpan@lfdr.de>; Thu,  2 Jun 2022 17:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbiFBPnC (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 2 Jun 2022 11:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236540AbiFBPnC (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 2 Jun 2022 11:43:02 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975FE2A7ABA
        for <linux-wpan@vger.kernel.org>; Thu,  2 Jun 2022 08:42:59 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id d39so4629238vsv.7
        for <linux-wpan@vger.kernel.org>; Thu, 02 Jun 2022 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=87oWlrEDJPKye07U0WyyudOqWYEXHhnsv54D8X6PyNE=;
        b=lYmD2Vdc6iEFdRLmxMtbvY31KuscwP09XMJ4+YqT1Wj2so8Z8vvEB5aFQ7nGQTNZ1r
         f2UVXy0dcssqZm+qZQviE6Lulx5egoE98IwIvJ2C9aKD8ty5C3JF7YHdjmMfZ0RPX1wo
         gLIWOz1W+cO2n5heXrCpZmXKiGff0F+tFY9+3IbF0+gFnH9lDsVNdPZgQlnriDC501E3
         bVnz7roCwHRgrbOBuEr6bGJvZBBmxrb1gHfkGpuwStvYSS4IPl0j3jww0e0D8a2VFnnM
         QbYxc3REB+nCkihEeMZTnKAtfKCgA7UeDJoPg+m4xSDGxmNPSl/18rp2SqVicd41fTMP
         vV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=87oWlrEDJPKye07U0WyyudOqWYEXHhnsv54D8X6PyNE=;
        b=oUhEXduK8TcL/Fy1bpHdKUl7PFP8a7UcKQBW5kw6SS5+FXQlhzdit1jXpXW2lcVsG0
         Z5UvGXOWNJ41mgrxf7N7kaXIZEs0PPMdJrXqOI5TBf6GuISNNuhSP90kEdBKID4LgAXM
         m6iXeVmM/149eKfp09QzGZ1FMC0GsHVhGaBOaHn4QmBEY8q3B1qXw03m5zJ8Fzj+MLwx
         WdtRSod9RRewfERTfUv0dMqLvhKB9tEmNZ4v90buVIxEqOz4gFEzU8JrgMyzq0ychFc1
         DJaVxS3A8sBNReGw1kKEmZ6Z+SJZaWdPpG7o6fWLiP7chtAI2kvH1+Ragna1F/6ZQCI1
         ZyLA==
X-Gm-Message-State: AOAM530HA3Pivh8/SvWf5/pLQjWHYTZVJwm+PeLh8cCPFnEb7SDz9Jpe
        3Ff0XTMNhswejcr4WM9gwwyBSMSiSlHfbPNE4iY=
X-Google-Smtp-Source: ABdhPJyZoR730Z3zDq1R0oFlmQMbxK1eLRHa/hcu4ujec/kwqRDY24I+HvP+9JyfaIrfkTN5wjUXbPSPFFn+/rv4yYA=
X-Received: by 2002:a05:6102:3ed1:b0:337:b70a:8b59 with SMTP id
 n17-20020a0561023ed100b00337b70a8b59mr2381211vsv.69.1654184578492; Thu, 02
 Jun 2022 08:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:689:b0:2a2:f30f:1a4f with HTTP; Thu, 2 Jun 2022
 08:42:58 -0700 (PDT)
Reply-To: payenjane100@gmail.com
From:   payen jane <sawadogob52blokus@gmail.com>
Date:   Thu, 2 Jun 2022 08:42:58 -0700
Message-ID: <CAA-60znyV4tR=-e4J4rbNbpS7Kxo040VhWWK60Z9go3PsXd0RQ@mail.gmail.com>
Subject: =?UTF-8?B?5oiR6ZyA6KaB5L2g55qE5biu5Yqp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e29 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [payenjane100[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sawadogob52blokus[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

5oiR5biM5pyb5L2g6IO955CG6Kej6L+Z5p2h5L+h5oGv77yM5Zug5Li65oiR5q2j5Zyo5L2/55So
57+76K+R57uZ5L2g5YaZ5L+h44CCDQoNCuaIkeaYr+eugMK35L2p5oGp5Lit5aOr5aSr5Lq644CC
DQoNCuWcqOe+juWbvemZhuWGm+eahOWGm+S6i+mDqOmXqOOAgue+juWbve+8jOS4gOWQjeS4reWj
q++8jDMyIOWyge+8jOaIkeaYr+adpeiHque+juWbveeUsOe6s+ilv+W3nuWFi+WIqeWkq+WFsOea
hOWNlei6q++8jOebruWJjeWcqOWIqeavlOS6muePreWKoOilv+aJp+ihjOS4gOmhueeJueauiuS7
u+WKoeOAgg0KDQrmiJHmmK/kuIDkuKrlhYXmu6HniLHlv4PjgIHor5rlrp7lkozmt7Hmg4XnmoTk
urrvvIzlhbfmnInoia/lpb3nmoTlub3pu5jmhJ/vvIzmiJHllpzmrKLnu5Por4bmlrDmnIvlj4vl
ubbkuobop6Pku5bku6znmoTnlJ/mtLvmlrnlvI/vvIzmiJHllpzmrKLnnIvliLDlpKfmtbfnmoTm
s6LmtpvlkozlsbHohInnmoTnvo7kuL3ku6Xlj4rlpKfoh6rnhLbmiYDmi6XmnInnmoTkuIDliIfm
j5DkvpvjgILlvojpq5jlhbTog73mm7TlpJrlnLDkuobop6PmgqjvvIzmiJHorqTkuLrmiJHku6zl
j6/ku6Xlu7rnq4voia/lpb3nmoTllYbkuJrlj4vosIrjgIINCg0K5oiR5LiA55u05b6I5LiN5byA
5b+D77yM5Zug5Li65Yeg5bm05p2l55Sf5rS75a+55oiR5LiN5YWs5bmz77yb5oiR5ZyoIDIxDQrl
soHml7blpLHljrvkuobniLbmr43jgILmiJHniLbkurLnmoTlkI3lrZfmmK/luJXnibnph4zmlq/k
vanmganlkozmiJHnmoTmr43kurLnjpvkuL3kvanmganjgILmsqHmnInkurrluK7liqnmiJHvvIzk
vYbmiJHlvojpq5jlhbTmiJHnu4jkuo7lnKjnvo7lhpvkuK3mib7liLDkuoboh6rlt7HjgIINCg0K
5oiR57uT5ama55Sf5LqG5LiA5Liq5a2p5a2Q77yM5L2G5LuW5Y675LiW5LqG77yM5Zyo5oiR5LiI
5aSr5byA5aeL6IOM5Y+b5oiR5ZCO5LiN5LmF77yM5oiR5LiN5b6X5LiN5pS+5byD5ama5ae744CC
DQoNCuaIkeS5n+W+iOW5uOi/kOWcqOaIkeeahOWbveWutue+juWbveWSjOWIqeavlOS6muePreWK
oOilv+i/memHjOaLpeacieaIkeeUn+a0u+S4remcgOimgeeahOS4gOWIh++8jOS9huayoeacieS6
uue7meaIkeW7uuiuruOAguaIkemcgOimgeS4gOS4quivmuWunueahOS6uuadpeS/oeS7u++8jOS7
luS5n+S8muW7uuiuruaIkeWmguS9leaKlei1hOaIkeeahOmSseOAguWboOS4uuaIkeaYr+aIkeeI
tuavjeWcqOS7luS7rOatu+WJjeeUn+S4i+eahOWUr+S4gOS4gOS4quWls+WtqeOAgg0KDQrmiJHk
uI3orqTor4bkvaDvvIzkvYbmiJHorqTkuLrmnInkuIDkuKrlj6/ku6Xkv6Hku7vnmoTlpb3kurrv
vIzlj6/ku6Xlu7rnq4vnnJ/mraPnmoTkv6Hku7vlkozoia/lpb3nmoTllYbkuJrlj4vosIrvvIzl
poLmnpzkvaDnnJ/nmoTmnInkuIDkuKror5rlrp7nmoTlkI3lrZfvvIzmiJHkuZ/mnInkuIDkupvk
uovmg4XopoHlkozkvaDliIbkuqvnm7jkv6HjgILlnKjkvaDouqvkuIrvvIzlm6DkuLrmiJHpnIDo
poHkvaDnmoTluK7liqnjgILmiJHmi6XmnInmiJHlnKjliKnmr5Tkuprnj63liqDopb/otZrliLDn
moTmgLvpop3vvIg0NzANCuS4h+e+juWFg++8ieOAguaIkeWwhuWcqOS4i+S4gOWwgeeUteWtkOmC
ruS7tuS4reWRiuivieaCqOaIkeaYr+WmguS9leWBmuWIsOeahO+8jOS4jeimgeaDiuaFjO+8jOWu
g+S7rOaYr+aXoOmjjumZqeeahO+8jOaIkei/mOWcqOS4jiBSZWQNCuacieiBlOezu+eahOS6uumB
k+S4u+S5ieWMu+eUn+eahOW4ruWKqeS4i+Wwhui/meeslOmSseWtmOWFpeS6huS4gOWutumTtuih
jOOAguaIkeW4jOacm+S9oOS7peaIkeeahOWPl+ebiuS6uui6q+S7veaOpeWPl+WfuumHke+8jOW5
tuWcqOaIkeWcqOi/memHjOWujOaIkOWQjuWmpeWWhOS/neeuoeWug++8jOW5tuiOt+W+l+aIkeea
hOWGm+S6i+mAmuihjOivge+8jOS7peS+v+WcqOS9oOeahOWbveWutuS4juS9oOS8mumdou+8m+S4
jeimgeWus+aAlemTtuihjOS8mumAmui/h+eUteaxh+Wwhui1hOmHkei9rOe7meaCqO+8jOi/meWv
ueaIkeS7rOadpeivtOWuieWFqOS4lOW/q+aNt+OAgg0KDQrnrJTorrA75oiR5LiN55+l6YGT5oiR
5Lus6KaB5Zyo6L+Z6YeM5b6F5aSa5LmF5ZKM5oiR55qE5ZG96L+Q77yM5Zug5Li65oiR5Zyo6L+Z
6YeM5bm45YWN5LqO5Lik5qyh54K45by56KKt5Ye777yM6L+Z5a+86Ie05oiR5a+75om+5LiA5Liq
5YC85b6X5L+h6LWW55qE5Lq65p2l5biu5Yqp5oiR5o6l5pS25ZKM5oqV6LWE5Z+66YeR77yM5Zug
5Li65oiR5bCG5p2l5Yiw5L2g55qE5Zu95a625Ye66Lqr5oqV6LWE77yM5byA5aeL5paw55Sf5rS7
77yM5LiN5YaN5b2T5YW144CCDQoNCuWmguaenOaCqOaEv+aEj+iwqOaFjuWkhOeQhu+8jOivt+Wb
nuWkjeaIkeOAguaIkeS8muWRiuivieS9oOaOpeS4i+adpeeahOa1geeoi++8jOW5tue7meS9oOWP
kemAgeabtOWkmuWFs+S6juWfuumHkeWtmOWFpemTtuihjOeahOS/oeaBr+OAguS7peWPiumTtuih
jOWwhuWmguS9leW4ruWKqeaIkeS7rOmAmui/h+eUteaxh+Wwhui1hOmHkei9rOenu+WIsOaCqOea
hOWbveWutu+8jOeUteaxh+S5n+aYr+mTtuihjOWIsOmTtuihjOeahOi9rOW4kOOAguiLpeacieWF
tOi2o+ivt+iBlOezu+acrOS6uuOAgg0K
