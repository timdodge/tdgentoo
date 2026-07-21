# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Fast, configurable filesystem search with fuzzy matching"
HOMEPAGE="https://github.com/AvengeMedia/danksearch"
SRC_URI="https://github.com/AvengeMedia/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/timdodge/${PN}/releases/download/${PV}/${P}-vendor.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile(){
	ego build -ldflags="-s -w" -o ./dsearch cmd/dsearch/*.go
}

src_install(){
	dobin dsearch
	dodoc README.md
	exeinto /etc/user/init.d
	newexe "${FILESDIR}"/danksearch.init danksearch
}
