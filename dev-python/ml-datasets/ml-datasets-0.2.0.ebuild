# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Machine learning dataset loaders for testing and examples"
HOMEPAGE="
	https://pypi.org/project/ml-datasets/
	https://github.com/explosion/ml-datasets
"
SRC_URI="https://github.com/explosion/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/numpy-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/srsly-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/catalogue-0.2.0[${PYTHON_USEDEP}]
"
