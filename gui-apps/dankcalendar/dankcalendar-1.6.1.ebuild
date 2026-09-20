# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Indexed filesystem search in GO"
HOMEPAGE="https://github.com/AvengeMedia/dankcalendar"
SRC_URI="https://github.com/AvengeMedia/${PN}/releases/download/v${PV}/dankcalendar-${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/dankcalendar-${PV}/core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=dev-lang/go-1.25.0"

#PATCHES=("${FILESDIR}"/"${PN}-0.3.2-no-strip.patch")

src_compile() {
	sed -i '/^GOFLAGS=/d' "${S}/Makefile"
	sed -i "s/^VERSION=.*$/VERSION=\"${PV}\"/" "${S}/Makefile"
	sed -i 's/local\///' "${S}/../assets/systemd/dcal.service"

	default
}

src_install() {
	dobin "${S}/bin/dcal"
	systemd_douserunit "${S}/../assets/systemd/dcal.service"
}
