# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Cython bindings for MurmurHash2"
HOMEPAGE="https://github.com/explosion/murmurhash"
SRC_URI="https://files.pythonhosted.org/packages/source/m/murmurhash/murmurhash-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/cython-0.29.35[${PYTHON_USEDEP}]
"

S="${WORKDIR}/murmurhash-${PV}"

src_prepare() {
	default
	# Ensure Cython files are regenerated
	rm -f murmurhash/*.c || die
}
