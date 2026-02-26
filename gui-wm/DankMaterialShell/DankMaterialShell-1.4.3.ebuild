# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module shell-completion desktop

DESCRIPTION="A complete desktop shell for niri and other Wayland compositors."
HOMEPAGE="https://github.com/AvengeMedia/DankMaterialShell"
SRC_URI="https://github.com/AvengeMedia/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/timdodge/${PN}/releases/download/${PV}/${P}-vendor.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${P}/core"

DEPEND="gui-apps/quickshell
	media-sound/cava
	app-misc/cliphist
	gui-apps/wl-clipboard
	x11-misc/matugen
	gui-wm/niri
	dev-qt/qtmultimedia:6
	sys-process/dgop
	sys-apps/danksearch
	x11-terms/kitty
	gui-apps/xwayland-satellite"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile(){
	ego build -ldflags="-s -w" -o ./dms ./cmd/dms

	mkdir -pv completions || die
	./dms completion bash > completions/dms || die
	./dms completion fish > completions/dms.fish || die
	./dms completion zsh > completions/_dms || die
}

src_install(){
	dobin dms
	dodoc README.md

	dobashcomp completions/dms
	dofishcomp completions/dms.fish
	dozshcomp completions/_dms

	newicon -s scalable ../assets/danklogo.svg danklogo.svg
	domenu ../assets/dms-open.desktop

	insinto /usr/share/quickshell/dms
	doins -r ../quickshell/*
}
