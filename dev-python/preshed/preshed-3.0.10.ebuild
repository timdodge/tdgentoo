# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Cython hash tables for fast lookup and mapping"
HOMEPAGE="https://github.com/explosion/preshed"
SRC_URI="https://files.pythonhosted.org/packages/source/p/preshed/preshed-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/cython-0.29.35[${PYTHON_USEDEP}]
	>=dev-python/cymem-2.0.8[${PYTHON_USEDEP}]
"

S="${WORKDIR}/preshed-${PV}"

src_prepare() {
	default
	# Ensure Cython files are regenerated
	rm -f preshed/*.c || die
}
