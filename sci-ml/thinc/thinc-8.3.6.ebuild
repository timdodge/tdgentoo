# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Practical Machine Learning for NLP"
HOMEPAGE="https://github.com/explosion/thinc"

SRC_URI="https://github.com/explosion/${PN}/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-release-v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
	>=dev-python/cymem-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/preshed-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/murmurhash-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/cython-blis-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/wasabi-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/catalogue-2.0.4[${PYTHON_USEDEP}]
	>=dev-python/confection-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/ml-datasets-0.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	cuda? ( >=dev-python/cupy-5.0.0[${PYTHON_USEDEP}] )
"

src_prepare() {
	default
	# Ensure Cython files are regenerated
	rm -f thinc/*.c thinc/*/*.c || die
}
