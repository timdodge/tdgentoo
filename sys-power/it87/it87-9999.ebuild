# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 git-r3 udev

DESCRIPTION="Kernel driver it87"
HOMEPAGE="https://github.com/a1wong/it87"

EGIT_REPO_URI="https://github.com/timdodge/it87"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	local modlist=( it87 )
	linux-mod-r1_src_compile
}
