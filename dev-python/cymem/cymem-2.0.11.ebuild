# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Cython memory pool for RAII-style memory management"
HOMEPAGE="https://github.com/explosion/cymem"
SRC_URI="https://files.pythonhosted.org/packages/source/c/cymem/cymem-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/cython-0.29.35[${PYTHON_USEDEP}]
"
