# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit shell-completion

DESCRIPTION="A greetd login screen with the Dank Material aesthetic"
HOMEPAGE="https://github.com/AvengeMedia/dank-greeter"
SRC_URI="https://github.com/AvengeMedia/${PN}/releases/download/v${PV}/dank-greeter-${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/dank-greeter-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-libs/greetd
	gui-apps/quickshell
"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.25.0"

PATCHES=("${FILESDIR}"/"${PN}-1.6.2-no-strip.patch")

src_compile() {
	# build the dms-greeter binary
	emake VERSION="${PV}" build

	# generate shell completions
	"${S}"/core/bin/dms-greeter completion bash > "${S}"/dms-greeter-bashcomp
	"${S}"/core/bin/dms-greeter completion zsh > "${S}"/dms-greeter-zshcomp
}


src_install() {
	# install dms-greeter binary
	dobin "${S}/core/bin/dms-greeter"

	# create the cache directory
	keepdir /var/cache/dms-greeter
	fowners greetd:greetd /var/cache/dms-greeter
	fperms 2770 /var/cache/dms-greeter

	# install shell completions
	newbashcomp "${S}"/dms-greeter-bashcomp dms-greeter
	newzshcomp "${S}"/dms-greeter-zshcomp _dms-greeter
}
