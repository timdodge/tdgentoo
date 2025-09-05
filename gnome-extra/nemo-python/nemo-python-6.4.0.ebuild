# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
inherit meson python-single-r1

DESCRIPTION="libnemo-extension Python bindings"
HOMEPAGE="https://projects.linuxmint.com/cinnamon/ https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~riscv x86"

DEPEND="
	>=dev-libs/glib-2.14.0:2
	>=gnome-extra/nemo-2.0.0
	>=dev-python/pygobject-3.0
	>=x11-libs/gtk+-3.0
"
RDEPEND="
	${DEPEND}
"
