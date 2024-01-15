Return-Path: <linux-wpan+bounces-67-lists+linux-wpan=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-wpan@lfdr.de
Delivered-To: lists+linux-wpan@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C082E1BC
	for <lists+linux-wpan@lfdr.de>; Mon, 15 Jan 2024 21:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81FF2838CE
	for <lists+linux-wpan@lfdr.de>; Mon, 15 Jan 2024 20:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927D21864D;
	Mon, 15 Jan 2024 20:23:30 +0000 (UTC)
X-Original-To: linux-wpan@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90B19474
	for <linux-wpan@vger.kernel.org>; Mon, 15 Jan 2024 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSJ-0004fv-Vc; Mon, 15 Jan 2024 21:21:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSC-0005fw-T0; Mon, 15 Jan 2024 21:21:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSC-000N73-2E;
	Mon, 15 Jan 2024 21:21:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-fpga@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sergey Kozlov <serjk@netup.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-mmc@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	Helge Deller <deller@gmx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Kalle Valo <kvalo@kernel.org>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	libertas-dev@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	James Clark <james.clark@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/33] spi: get rid of some legacy macros
Date: Mon, 15 Jan 2024 21:12:46 +0100
Message-ID: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-wpan@vger.kernel.org
List-Id: <linux-wpan.vger.kernel.org>
List-Subscribe: <mailto:linux-wpan+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wpan+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6320; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=4XhGTLODNw8yhIWMecN5LnSB/9sNwzZ7ZtVxoa/j52s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpZHAtVz/M7HYOTe/qdG2V00aOQMH7pbvHciH8 Vd+hMtY79eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaWRwAAKCRCPgPtYfRL+ TmMcB/9KE9qwNyMSSIfdofdQbKyCv4Jl+hXy0kKEYM/VNzbklICtWwj9498FhxF8B9thFSDK3gp DulZCe7rJn+MKx/eJphonzR1LVWev1YTJ2kkqaeBZRIN4i1mYHInwS35ESw2q+zwzVxxA5C1ESX kW25rOyy4D74faKClkI6O9XJ8+8hTw+2V1FDTJCM3vzxmqJnOLbi+YQW48FklGIPMoSqjx8aCyd SI61u1H7VyOe/EymwrynrT3G6SCnlHBYtfL1qLmsfALHT2BaON0BD/T5W5/wZjxuPBbtdlD253K rqyhVZMP3ez427R7zZKU1qhJqs7O6YTGrydt0et9PARzYGe0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-wpan@vger.kernel.org

Hello,

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions were renamed. Further some compat defines were introduced
to map the old names to the new ones.

In this series all drivers still using the old names are changed to use
the new ones and then in patch #32 the compat defines are dropped.
Variables and struct members of type pointer to struct spi_controller that were
named "master" (matching the old name of spi_controller) were renamed to
"ctlr", which slightly increased the count of touched lines, but is nice
for consistency.

Patch #18 and #19 touch the same driver, otherwise the patches #1 - #31
are pairwise independent and could be applied by their respective
maintainers. The alternative is to let all patches go via the spi tree.
Mark, what's your preference here?

Patch #33 updates the documentation. (This one is a bit fuzzy, because
it also does some s/master/host/ which doesn't match the remainder of
the series). Also patch #18 is an improvement I noticed while touching
this driver that doesn't match the series' topic. I still kept it
included here. If you should not like it, it can just be dropped.

Best regards
Uwe

Uwe Kleine-König (33):
  fpga: ice40-spi: Follow renaming of SPI "master" to "controller"
  ieee802154: ca8210: Follow renaming of SPI "master" to "controller"
  iio: adc: ad_sigma_delta: Follow renaming of SPI "master" to "controller"
  Input: pxspad - follow renaming of SPI "master" to "controller"
  Input: synaptics-rmi4 - follow renaming of SPI "master" to "controller"
  media: mgb4: Follow renaming of SPI "master" to "controller"
  media: netup_unidvb: Follow renaming of SPI "master" to "controller"
  media: usb/msi2500: Follow renaming of SPI "master" to "controller"
  media: v4l2-subdev: Follow renaming of SPI "master" to "controller"
  misc: gehc-achc: Follow renaming of SPI "master" to "controller"
  mmc: mmc_spi: Follow renaming of SPI "master" to "controller"
  mtd: dataflash: Follow renaming of SPI "master" to "controller"
  mtd: rawnand: fsl_elbc: Let .probe retry if local bus is missing
  net: ks8851: Follow renaming of SPI "master" to "controller"
  net: vertexcom: mse102x: Follow renaming of SPI "master" to "controller"
  platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
  spi: bitbang: Follow renaming of SPI "master" to "controller"
  spi: cadence-quadspi: Don't emit error message on allocation error
  spi: cadence-quadspi: Follow renaming of SPI "master" to "controller"
  spi: cavium: Follow renaming of SPI "master" to "controller"
  spi: geni-qcom: Follow renaming of SPI "master" to "controller"
  spi: loopback-test: Follow renaming of SPI "master" to "controller"
  spi: slave-mt27xx: Follow renaming of SPI "master" to "controller"
  spi: spidev: Follow renaming of SPI "master" to "controller"
  staging: fbtft: Follow renaming of SPI "master" to "controller"
  staging: greybus: spi: Follow renaming of SPI "master" to "controller"
  tpm_tis_spi: Follow renaming of SPI "master" to "controller"
  usb: gadget: max3420_udc: Follow renaming of SPI "master" to "controller"
  video: fbdev: mmp: Follow renaming of SPI "master" to "controller"
  wifi: libertas: Follow renaming of SPI "master" to "controller"
  spi: fsl-lib: Follow renaming of SPI "master" to "controller"
  spi: Drop compat layer from renaming "master" to "controller"
  Documentation: spi: Update documentation for renaming "master" to "controller"

 .../driver-api/driver-model/devres.rst        |  2 +-
 Documentation/spi/spi-summary.rst             | 74 +++++++++----------
 drivers/char/tpm/tpm_tis_spi_main.c           |  4 +-
 drivers/fpga/ice40-spi.c                      |  4 +-
 drivers/iio/adc/ad_sigma_delta.c              | 14 ++--
 drivers/input/joystick/psxpad-spi.c           |  4 +-
 drivers/input/rmi4/rmi_spi.c                  |  2 +-
 drivers/media/pci/mgb4/mgb4_core.c            | 14 ++--
 .../media/pci/netup_unidvb/netup_unidvb_spi.c | 48 ++++++------
 drivers/media/usb/msi2500/msi2500.c           | 38 +++++-----
 drivers/media/v4l2-core/v4l2-spi.c            |  4 +-
 drivers/misc/gehc-achc.c                      |  8 +-
 drivers/mmc/host/mmc_spi.c                    |  6 +-
 drivers/mtd/devices/mtd_dataflash.c           |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |  3 +-
 drivers/net/ethernet/micrel/ks8851_spi.c      |  4 +-
 drivers/net/ethernet/vertexcom/mse102x.c      |  2 +-
 drivers/net/ieee802154/ca8210.c               |  2 +-
 .../net/wireless/marvell/libertas/if_spi.c    |  2 +-
 drivers/platform/chrome/cros_ec_spi.c         |  8 +-
 drivers/spi/spi-ath79.c                       |  4 +-
 drivers/spi/spi-bitbang.c                     | 64 ++++++++--------
 drivers/spi/spi-butterfly.c                   |  6 +-
 drivers/spi/spi-cadence-quadspi.c             |  7 +-
 drivers/spi/spi-cavium.c                      |  6 +-
 drivers/spi/spi-cavium.h                      |  2 +-
 drivers/spi/spi-davinci.c                     |  6 +-
 drivers/spi/spi-fsl-lib.c                     | 14 ++--
 drivers/spi/spi-geni-qcom.c                   |  2 +-
 drivers/spi/spi-gpio.c                        |  2 +-
 drivers/spi/spi-lm70llp.c                     |  6 +-
 drivers/spi/spi-loopback-test.c               |  4 +-
 drivers/spi/spi-oc-tiny.c                     |  6 +-
 drivers/spi/spi-omap-uwire.c                  |  4 +-
 drivers/spi/spi-slave-mt27xx.c                |  2 +-
 drivers/spi/spi-xilinx.c                      |  4 +-
 drivers/spi/spi-xtensa-xtfpga.c               |  2 +-
 drivers/spi/spi.c                             |  2 +-
 drivers/spi/spidev.c                          |  2 +-
 drivers/staging/fbtft/fbtft-core.c            |  4 +-
 drivers/staging/greybus/spilib.c              | 66 ++++++++---------
 drivers/usb/gadget/udc/max3420_udc.c          |  2 +-
 drivers/video/fbdev/mmp/hw/mmp_spi.c          | 26 +++----
 include/linux/spi/spi.h                       | 20 +----
 include/linux/spi/spi_bitbang.h               |  2 +-
 include/media/v4l2-common.h                   |  6 +-
 46 files changed, 249 insertions(+), 267 deletions(-)


base-commit: 8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
-- 
2.43.0


