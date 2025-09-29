# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Fast BLAS-like operations from Python and Cython"
HOMEPAGE="
	https://github.com/explosion/cython-blis
"

SRC_URI="https://github.com/explosion/${PN}/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-release-v${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.3[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
