Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728C669A4DF
	for <lists+linux-wpan@lfdr.de>; Fri, 17 Feb 2023 05:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjBQE0M (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 16 Feb 2023 23:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBQE0L (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 16 Feb 2023 23:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2798242DE5
        for <linux-wpan@vger.kernel.org>; Thu, 16 Feb 2023 20:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676607912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BFcQl7WBZl4GtOmgXYd9kFNRhlobAUl1+UdIV+TqIc0=;
        b=JJJvb52M0L6+TvY4j5wZXVv+aCYGMiklPa9Jf1UlerySeQy9jF+6CiWJdacptBX9eNvboR
        ZFXwM6s1/7gesEmhW2+aRc/dBz6J9XDgsGxAQ1GWnhnu1Vzs+7d/vtuxLbAACge3y04joE
        ivJz1L9Y4OLPTETSNRRBNvOMfUwBf4w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-uxwo6BbQPk2TmG5n3vlHnw-1; Thu, 16 Feb 2023 23:25:08 -0500
X-MC-Unique: uxwo6BbQPk2TmG5n3vlHnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5099C3C0CD3E;
        Fri, 17 Feb 2023 04:25:08 +0000 (UTC)
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 38B3E2026D4B;
        Fri, 17 Feb 2023 04:25:08 +0000 (UTC)
From:   Alexander Aring <aahringo@redhat.com>
To:     linux-wpan@vger.kernel.org
Cc:     bluetlh@gmail.com
Subject: [PATCH wpan] ca8210: fix mac_len negative array access
Date:   Thu, 16 Feb 2023 23:25:04 -0500
Message-Id: <20230217042504.3303396-1-aahringo@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

This patch fixes a buffer overflow access of skb->data if
ieee802154_hdr_peek_addrs() fails.

Reported-by: lianhui tang <bluetlh@gmail.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 drivers/net/ieee802154/ca8210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index e1a569b99e4a..0b0c6c0764fe 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -1913,6 +1913,8 @@ static int ca8210_skb_tx(
 	 * packet
 	 */
 	mac_len = ieee802154_hdr_peek_addrs(skb, &header);
+	if (mac_len < 0)
+		return mac_len;
 
 	secspec.security_level = header.sec.level;
 	secspec.key_id_mode = header.sec.key_id_mode;
-- 
2.31.1

