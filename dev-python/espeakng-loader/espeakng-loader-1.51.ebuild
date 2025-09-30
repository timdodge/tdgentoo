# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Loads the espeak-ng shared library so it will be available for other libraries"
HOMEPAGE="https://github.com/thewh1teagle/espeakng-loader"

SRC_URI="https://github.com/thewh1teagle/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-accessibility/espeak-ng"

PATCHES=(
    "${FILESDIR}"/use-system-espeak.patch
)
