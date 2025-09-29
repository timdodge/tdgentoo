# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Provides Unicode Standard tokenization routines and orthography segmentation"
HOMEPAGE="
	https://pypi.org/project/segments/
"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/regex[${PYTHON_USEDEP}]
	>=dev-python/csvw-1.5.6[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
