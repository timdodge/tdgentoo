# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Stateless, cursor-based system and process monitoring"
HOMEPAGE="https://github.com/AvengeMedia/dgop"
SRC_URI="https://github.com/AvengeMedia/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/timdodge/${PN}/releases/download/${PV}/${P}-vendor.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile(){
	ego build -ldflags="-s -w" -o ./dgop cmd/cli/*.go
}

src_install(){
	dobin dgop
	dodoc README.md
}
