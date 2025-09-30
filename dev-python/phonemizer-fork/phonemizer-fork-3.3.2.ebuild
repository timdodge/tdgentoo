# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="The phonemizer allows simple phonemization of words and texts in many languages"
HOMEPAGE="
	https://pypi.org/project/phonemizer-fork/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/segments[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.1[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/dlinfo[${PYTHON_USEDEP}]
"
EPYTEST_PLUGINS=()
distutils_enable_tests pytest
