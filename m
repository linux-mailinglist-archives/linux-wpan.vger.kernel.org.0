Return-Path: <linux-wpan-owner@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631FA4F7C68
	for <lists+linux-wpan@lfdr.de>; Thu,  7 Apr 2022 12:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244128AbiDGKLQ (ORCPT <rfc822;lists+linux-wpan@lfdr.de>);
        Thu, 7 Apr 2022 06:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbiDGKLM (ORCPT
        <rfc822;linux-wpan@vger.kernel.org>); Thu, 7 Apr 2022 06:11:12 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC5C236936;
        Thu,  7 Apr 2022 03:09:08 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7727260011;
        Thu,  7 Apr 2022 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649326147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hzRFgzM4CKz3QS8PYg7wgueEZihoX1rywNOkCigJb0c=;
        b=TI7sgk22p8yTxlSmKG3neEGT6HJIcFAt9hfwTWCLDdky34HW/khwyTzL1tzOAzwnAS2p9c
        QRXX2OyqHdVpIJ7JkT2z5AKrQklILxa3M/vjRb77f+s6RxhCE2FawgTqIWSBybxhylVfOw
        CfzJGzhH67NXuYePY2ghKveer2Pi5RRl3POjL4ZMCaAneKIlSoFaJyUsbcm6Zg+WEXChGq
        JuyMEDv09OaEfcTrIoha/t8LaZ40o3uy51hEQDQ71lUz6dOh5MkLLxbueHiVNyrLSMfk6m
        4maFcUFhqgJ2dWos4shj107NBYrkZ1HOnt4B2V6TxkjUyTeWLIbduqVyA+mROw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        David Girault <david.girault@qorvo.com>,
        Romuald Despres <romuald.despres@qorvo.com>,
        Frederic Blain <frederic.blain@qorvo.com>,
        Nicolas Schodet <nico@ni.fr.eu.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 02/10] net: ieee802154: Fill the list of MLME return codes
Date:   Thu,  7 Apr 2022 12:08:55 +0200
Message-Id: <20220407100903.1695973-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407100903.1695973-1-miquel.raynal@bootlin.com>
References: <20220407100903.1695973-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-wpan.vger.kernel.org>
X-Mailing-List: linux-wpan@vger.kernel.org

There are more codes than already listed, let's be a bit more
exhaustive. This will allow to drop device drivers local definitions of
these codes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/ieee802154.h | 67 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/include/linux/ieee802154.h b/include/linux/ieee802154.h
index 01d945c8b2e1..f1f9412b6ac6 100644
--- a/include/linux/ieee802154.h
+++ b/include/linux/ieee802154.h
@@ -134,7 +134,35 @@ enum {
 	 * a successful transmission.
 	 */
 	IEEE802154_SUCCESS = 0x0,
-
+	/* The requested operation failed. */
+	IEEE802154_MAC_ERROR = 0x1,
+	/* The requested operation has been cancelled. */
+	IEEE802154_CANCELLED = 0x2,
+	/*
+	 * Device is ready to poll the coordinator for data in a non beacon
+	 * enabled PAN.
+	 */
+	IEEE802154_READY_FOR_POLL = 0x3,
+	/* Wrong frame counter. */
+	IEEE802154_COUNTER_ERROR = 0xdb,
+	/*
+	 * The frame does not conforms to the incoming key usage policy checking
+	 * procedure.
+	 */
+	IEEE802154_IMPROPER_KEY_TYPE = 0xdc,
+	/*
+	 * The frame does not conforms to the incoming security level usage
+	 * policy checking procedure.
+	 */
+	IEEE802154_IMPROPER_SECURITY_LEVEL = 0xdd,
+	/* Secured frame received with an empty Frame Version field. */
+	IEEE802154_UNSUPPORTED_LEGACY = 0xde,
+	/*
+	 * A secured frame is received or must be sent but security is not
+	 * enabled in the device. Or, the Auxiliary Security Header has security
+	 * level of zero in it.
+	 */
+	IEEE802154_UNSUPPORTED_SECURITY = 0xdf,
 	/* The beacon was lost following a synchronization request. */
 	IEEE802154_BEACON_LOST = 0xe0,
 	/*
@@ -204,11 +232,48 @@ enum {
 	 * that is not supported.
 	 */
 	IEEE802154_UNSUPPORTED_ATTRIBUTE = 0xf4,
+	/* Missing source or destination address or address mode. */
+	IEEE802154_INVALID_ADDRESS = 0xf5,
+	/*
+	 * MLME asked to turn the receiver on, but the on time duration is too
+	 * big compared to the macBeaconOrder.
+	 */
+	IEEE802154_ON_TIME_TOO_LONG = 0xf6,
+	/*
+	 * MLME asaked to turn the receiver on, but the request was delayed for
+	 * too long before getting processed.
+	 */
+	IEEE802154_PAST_TIME = 0xf7,
+	/*
+	 * The StartTime parameter is nonzero, and the MLME is not currently
+	 * tracking the beacon of the coordinator through which it is
+	 * associated.
+	 */
+	IEEE802154_TRACKING_OFF = 0xf8,
+	/*
+	 * The index inside the hierarchical values in PIBAttribute is out of
+	 * range.
+	 */
+	IEEE802154_INVALID_INDEX = 0xf9,
+	/*
+	 * The number of PAN descriptors discovered during a scan has been
+	 * reached.
+	 */
+	IEEE802154_LIMIT_REACHED = 0xfa,
+	/*
+	 * The PIBAttribute parameter specifies an attribute that is a read-only
+	 * attribute.
+	 */
+	IEEE802154_READ_ONLY = 0xfb,
 	/*
 	 * A request to perform a scan operation failed because the MLME was
 	 * in the process of performing a previously initiated scan operation.
 	 */
 	IEEE802154_SCAN_IN_PROGRESS = 0xfc,
+	/* The outgoing superframe overlaps the incoming superframe. */
+	IEEE802154_SUPERFRAME_OVERLAP = 0xfd,
+	/* Any other error situation. */
+	IEEE802154_SYSTEM_ERROR = 0xff,
 };
 
 /* frame control handling */
-- 
2.27.0

