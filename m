Return-Path: <linux-wpan+bounces-330-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CF97D08C
	for <lists+linux-wpan@lfdr.de>; Fri, 20 Sep 2024 06:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9646A1C22610
	for <lists+linux-wpan@lfdr.de>; Fri, 20 Sep 2024 04:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C782A1F94D;
	Fri, 20 Sep 2024 04:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="GXcxmGu0"
X-Original-To: linux-wpan@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838A125A9
	for <linux-wpan@vger.kernel.org>; Fri, 20 Sep 2024 04:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726806645; cv=none; b=R5Nimtx1HbvGa3LYoF5b0F/MHahWp/libZ6THicp2h5Ewtqmro87Ujhi9OkVzZXR4oWt018e9nwzYsa/hkI2K0uNIgu3+QWpFwcY1vDlS292zkri0U+y727vbtCaPy04EAt0WNPPkdg8/h801u8GY/nZ/WubVM3VlnEZWrvlFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726806645; c=relaxed/simple;
	bh=njQRqLG7wlH/zIXBSY4tiDaObLehSkaocznA1qc1A38=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=UiHxGNmxwy0Ry5Gup6/JSgxXywAT2FItjFTWHUAWWjtixUsywHJm6J5PXwi/5zVCwm5pNkKKIKP51lzp920FRfl90l+vBjRvM58q2d29GXaDRNOA7Or/4h31DxrKwuuhNW5+zpjRLmXizhpAhFLs/hJbt+cMcHgWRORuxHZSZOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=GXcxmGu0; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1726806628;
	bh=Z2Z3+yeR3SnFTYap5T0uUA9hdSiUIk+aWXvfdPP8fwE=;
	h=From:To:Cc:Subject:Date;
	b=GXcxmGu0sQZCXSX1UCD8OytCjNB9h88DhsSEe6irpquOdZvqUB5PUIaikOvBBzVfx
	 gCYOw0By13wjPqI2jq6LK2PRVcInuqAtQQSzEHEJgh6TwkOowfjMYRb8g/wtcs+e8T
	 OFTm9qUlyv1YEcKqThgSwWpoB3jOLuPvcC6qRIV4=
Received: from localhost.localdomain ([114.246.200.160])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id E100020; Fri, 20 Sep 2024 12:03:33 +0800
X-QQ-mid: xmsmtpt1726805013tyuqqrxw2
Message-ID: <tencent_3D3535F93CE8BC48A50E29D1CF7A25E93D0A@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujycmiipQosCyokqx0fKwi+k8zgQnMhO1Z7x0x0lPClOiQ9Msa1n
	 DseKo74Mc2PEjZIkrxyWvHLu4XL4cDZf6xIG+V6TvZW1+i3Dcd+egQs/KMDYH5D80HEW9hh7oNuQ
	 neGB0j72f4cyCyR8gyMflrE9Y/vKVP7qQI91MBgJ1vdQnS1T5bxL8JhKezYHCPVqQMHNk5YLKHEh
	 sANwQJjg6SOAW4B3UowINMbvgKLCmt9cKJvW/F6t0jMFQmOQRrrSG1O8OYlD0A/a2mo08Lndr25Z
	 7t3V8d0L0+OaZa5eQLqOpAL1/92LQlLDNbhV4tR0FdAolSSd1KackhCM9+bUg16+eVF7OnqRB95h
	 WTrmNYJmvPqemW2He9Ybhyhi/AN/PVNkrUBI4TQM7HkMEJiJEU0jinK+bHoEbL9y8Fsm9dqoxhDH
	 6uAgg9lG6so4LnDicpfgqrSFTf0QWEgDkN8ScitewHfPBDwyGf3k8xSDNJLkNgj+wyquNU6WOSCv
	 lR7cfAPv7yKP5/J9v04E/ONYI3dZI3PmJ0GhTLHR9eF3UCx/1IYDzCeD/pBrKpzfldvLAEjdlZ7p
	 WfqKMM55OAQLNI8MJDjzxkAh+KY7EuO3qcbKqa7wcDPAkay9wxzrPyO7UkcKsCZogIlz13fznxU6
	 wuAWX+p06d1QO1s5Kjt0IvmjdVRL+TOx1HvH3cZdJMLNGMrS1EGkpq/NfAbp+w1yAoh/NmRz4sjo
	 fhsm+xu8BRg6+o1VaoN1JG/LE2iBotG8IvVmaDLXb9NsMZNhIyTKFa924PGFHOe37wfgDiY0zOOu
	 WiLK37sk2A38rU/xqpL5hzM29UyhRpwZ+oOF2uKtI9dDpR3TfowFvnFis+6+I145fxJgUafbk0AQ
	 VJlXKr/UDeS3IFWfLFsvUE1dXsoHeDfSMte+jJ+B6WtQWCMliJx6tdDwIa9MHOEHyQyU94avB7Qg
	 p8LoqZB78kpQZLo7OZ7ekSXsG2LwQEuYTaZGJ4BDJc0n4NqK6OCLtEJavjQPsbEIzaK4c4toy4o+
	 wrevh2V2234CxkW4F4UsZJ6G0fKrqzywevkVEtcRhQLtsekz5iCgYdWGZyhzTrk4faON4Bkw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Jiawei Ye <jiawei.ye@foxmail.com>
To: przemyslaw.kitszel@intel.com
Cc: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	david.girault@qorvo.com,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mac802154: Fix potential RCU dereference issue in mac802154_scan_worker
Date: Fri, 20 Sep 2024 04:03:32 +0000
X-OQ-MSGID: <20240920040332.1706036-1-jiawei.ye@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the `mac802154_scan_worker` function, the `scan_req->type` field was
accessed after the RCU read-side critical section was unlocked. According
to RCU usage rules, this is illegal and can lead to unpredictable
behavior, such as accessing memory that has been updated or causing
use-after-free issues.

This possible bug was identified using a static analysis tool developed
by myself, specifically designed to detect RCU-related issues.

To address this, the `scan_req->type` value is now stored in a local
variable `scan_req_type` while still within the RCU read-side critical
section. The `scan_req_type` is then used after the RCU lock is released,
ensuring that the type value is safely accessed without violating RCU
rules.

Fixes: e2c3e6f53a7a ("mac802154: Handle active scanning")
Signed-off-by: Jiawei Ye <jiawei.ye@foxmail.com>

---
Changelog:

v1->v2: -Repositioned the enum nl802154_scan_types scan_req_type
declaration between struct cfg802154_scan_request *scan_req and struct
ieee802154_sub_if_data *sdata to comply with the reverse Christmas tree
rule.
---
 net/mac802154/scan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/mac802154/scan.c b/net/mac802154/scan.c
index 1c0eeaa76560..a6dab3cc3ad8 100644
--- a/net/mac802154/scan.c
+++ b/net/mac802154/scan.c
@@ -176,6 +176,7 @@ void mac802154_scan_worker(struct work_struct *work)
 	struct ieee802154_local *local =
 		container_of(work, struct ieee802154_local, scan_work.work);
 	struct cfg802154_scan_request *scan_req;
+	enum nl802154_scan_types scan_req_type;
 	struct ieee802154_sub_if_data *sdata;
 	unsigned int scan_duration = 0;
 	struct wpan_phy *wpan_phy;
@@ -209,6 +210,7 @@ void mac802154_scan_worker(struct work_struct *work)
 	}
 
 	wpan_phy = scan_req->wpan_phy;
+	scan_req_type = scan_req->type;
 	scan_req_duration = scan_req->duration;
 
 	/* Look for the next valid chan */
@@ -246,7 +248,7 @@ void mac802154_scan_worker(struct work_struct *work)
 		goto end_scan;
 	}
 
-	if (scan_req->type == NL802154_SCAN_ACTIVE) {
+	if (scan_req_type == NL802154_SCAN_ACTIVE) {
 		ret = mac802154_transmit_beacon_req(local, sdata);
 		if (ret)
 			dev_err(&sdata->dev->dev,
-- 
2.34.1


