# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Calendar for Local, Google, Microsoft, CalDAV, and iCloud"
HOMEPAGE="https://github.com/duxlabs-dev/dux-calendar"
SRC_URI="https://github.com/duxlabs-dev/dux-calendar/releases/download/v${PV}/dankcalendar-${PV}.tar.gz"

S="${WORKDIR}/dankcalendar-${PV}/core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=dev-lang/go-1.25.0"

src_prepare() {
	sed -i "s/^VERSION=.*$/VERSION=\"${PV}\"/" "${S}/Makefile" || die
	sed -i '/^BUILD_LDFLAGS=/s/-s -w //' "${S}/Makefile" || die
}

src_install() {
	dobin "${S}/bin/dcal"
	systemd_douserunit "${S}/../assets/systemd/dcal.service"
}
