# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop linux-info multilib unpacker xdg

DESCRIPTION="Grok Bot desktop agent"
HOMEPAGE="https://x.ai/bot"

# Stable-channel commit. The deb URL is keyed by this commit.
GROK_BOT_COMMIT="92808c0ad869b2e3725dbc3b8fa2fcc991687502"

SRC_URI="
	amd64? (
		https://downloads.cursor.com/grokbot/stable/${GROK_BOT_COMMIT}/linux/x64/${PN}_${PV}_amd64.deb
	)
	arm64? (
		https://downloads.cursor.com/grokbot/stable/${GROK_BOT_COMMIT}/linux/arm64/${PN}_${PV}_arm64.deb
	)
"
S="${WORKDIR}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
IUSE="apparmor appindicator +pulseaudio +wayland"
RESTRICT="bindist mirror strip"

QA_PREBUILT="*"

RDEPEND="
	app-accessibility/at-spi2-core:2
	app-crypt/libsecret
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa[gbm(+)]
	net-print/cups
	sys-apps/dbus
	sys-apps/util-linux
	virtual/libudev
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXtst
	x11-libs/libdrm
	x11-libs/libnotify
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-misc/xdg-utils
	apparmor? ( sys-apps/apparmor )
	appindicator? ( dev-libs/libayatana-appindicator )
	pulseaudio? ( media-libs/libpulse )
	wayland? ( dev-libs/wayland )
"

# Setuid chrome-sandbox cannot exec from "/opt/Grok Bot" (the space breaks it).
# https://github.com/electron/electron/issues/44414
CONFIG_CHECK="~USER_NS"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	# unpack_deb does not run the deb maintainer scripts.
	dodir /opt
	cp -a "opt/Grok Bot" "${ED}/opt/" || die

	dosym -r "/opt/Grok Bot/grok-bot" /usr/bin/grok-bot

	fperms 0755 "/opt/Grok Bot/grok-bot" \
		"/opt/Grok Bot/chrome_crashpad_handler" \
		"/opt/Grok Bot/chrome-sandbox"

	local size
	for size in 16 24 32 48 64 128 256 512; do
		doicon -s "${size}" "usr/share/icons/hicolor/${size}x${size}/apps/grok-bot.png"
	done
	domenu usr/share/applications/grok-bot.desktop

	if use appindicator; then
		dosym -r "/usr/$(get_libdir)/libayatana-appindicator3.so" \
			"/opt/Grok Bot/libappindicator3.so"
	fi

	if use apparmor; then
		insinto /etc/apparmor.d
		newins "opt/Grok Bot/resources/apparmor-profile" grok-bot
	fi

	dodoc "opt/Grok Bot/LICENSE.electron.txt" \
		"opt/Grok Bot/LICENSES.chromium.html"
}

pkg_postinst() {
	xdg_pkg_postinst

	if linux_config_exists && ! linux_chkconfig_present USER_NS; then
		ewarn "CONFIG_USER_NS is disabled, and chrome-sandbox cannot be setuid"
		ewarn "under /opt/Grok Bot. Launch with: grok-bot --no-sandbox"
	fi
}
