Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AE33272F8
	for <lists+linux-wpan@lfdr.de>; Sun, 28 Feb 2021 16:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhB1PUd (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Sun, 28 Feb 2021 10:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22558 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231139AbhB1PUC (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>);
        Sun, 28 Feb 2021 10:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614525516;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PeSpDSkiOIRLibPx5IY1ERbxboVDlbwir0mbFIxNQ4c=;
        b=SGg4rYYhGHoscfg+UNAoy4XPT9Ndd6lAf8WHE6AFrbyScqKETrf46Ies3uix7fpsnzHQ9Z
        /n2R9YR/J+mtjUq2tERGoNbc6nPEyWprBO1uNfoepjyfV46VRm105AC5gob1RPQUJAbmQ6
        CgMuwf5hhaRfCJa7NImQ+h0OIh97RwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-YTShLGthP2OJqeAxgZcPQQ-1; Sun, 28 Feb 2021 10:18:32 -0500
X-MC-Unique: YTShLGthP2OJqeAxgZcPQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639D110066F0;
        Sun, 28 Feb 2021 15:18:31 +0000 (UTC)
Received: from carbon.redhat.com (ovpn-112-225.rdu2.redhat.com [10.10.112.225])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F2AC85C1D5;
        Sun, 28 Feb 2021 15:18:30 +0000 (UTC)
From:   Alexander Aring <aahringo@redhat.com>
To:     stefan@datenfreihafen.org
Cc:     linux-wpan@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH wpan 16/17] net: ieee802154: forbid monitor for del llsec seclevel
Date:   Sun, 28 Feb 2021 10:18:16 -0500
Message-Id: <20210228151817.95700-17-aahringo@redhat.com>
In-Reply-To: <20210228151817.95700-1-aahringo@redhat.com>
References: <20210228151817.95700-1-aahringo@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

This patch forbids to del llsec seclevel for monitor interfaces which we
don't support yet. Otherwise we will access llsec mib which isn't
initialized for monitors.

Reported-by: syzbot+fbf4fc11a819824e027b@syzkaller.appspotmail.com
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 net/ieee802154/nl802154.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index e5181de4a77a..576e418cf5aa 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -2133,6 +2133,9 @@ static int nl802154_del_llsec_seclevel(struct sk_buff *skb,
 	struct wpan_dev *wpan_dev = dev->ieee802154_ptr;
 	struct ieee802154_llsec_seclevel sl;
 
+	if (wpan_dev->iftype == NL802154_IFTYPE_MONITOR)
+		return -EOPNOTSUPP;
+
 	if (!info->attrs[NL802154_ATTR_SEC_LEVEL] ||
 	    llsec_parse_seclevel(info->attrs[NL802154_ATTR_SEC_LEVEL],
 				 &sl) < 0)
-- 
2.26.2

