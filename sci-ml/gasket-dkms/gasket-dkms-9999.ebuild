# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MODULES_OPTIONAL_IUSE=+modules
inherit linux-mod-r1 git-r3 udev

DESCRIPTION="Google Coral TPU DKMS Driver"
HOMEPAGE="https://github.com/KyleGospo/gasket-dkms"
EGIT_REPO_URI="https://github.com/KyleGospo/gasket-dkms"
S="${WORKDIR}/${PN}-${PV}/src"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="modules"

src_prepare() {
	eapply -p2 "${FILESDIR}"/DMA_BUFF_NS_support.patch
	eapply_user
}

src_compile() {
	local modlist=( apex gasket )
	local modargs=( KERNEL_SOURCE_DIR="${KV_OUT_DIR}" )
	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
	udev_dorules "${WORKDIR}/${PN}-${PV}"/65-apex.rules
	dodoc "${WORKDIR}/${PN}-${PV}"/README.md
}

pkg_postinst() {
	linux-mod-r1_pkg_postinst
	udev_reload
}

pkg_postrm() {
	udev_reload
}
