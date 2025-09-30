# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Industrial-strength Natural Language Processing (NLP) library in Python"
HOMEPAGE="https://spacy.io/ https://github.com/explosion/spaCy"
SRC_URI="https://files.pythonhosted.org/packages/source/s/spacy/spacy-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

# Required dependencies based on spaCy 3.8.7 requirements
DEPEND="
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/typer-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.38.0[${PYTHON_USEDEP}]
	>=dev-python/wasabi-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.3[${PYTHON_USEDEP}]
	>=dev-python/catalogue-2.0.6[${PYTHON_USEDEP}]
	>=dev-python/preshed-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/cymem-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/murmurhash-0.28.0[${PYTHON_USEDEP}]
	>=sci-ml/thinc-8.3.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/weasel-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.38.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	cuda? ( >=dev-python/cupy-9.0.0[${PYTHON_USEDEP}] )
	sci-ml/xx-ent-wiki-sm[${PYTHON_USEDEP}]
	sci-ml/en-core-web-sm[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

PATCHES=(
    "${FILESDIR}"/remove_langcodes_dependency.patch
)

S="${WORKDIR}/spacy-${PV}"

src_prepare() {
	default

	# Optionally disable CUDA-related dependencies if USE flag is not set
	if ! use cuda; then
		sed -i '/cupy/d' setup.py || die "Failed to remove cupy dependency"
	fi
}

src_install() {
	distutils-r1_src_install

	# Install documentation if available
	dodoc README.md
	if [[ -d docs ]]; then
		dodoc -r docs
	fi
}

pkg_postinst() {
	einfo "spaCy is installed. To use specific language models, you need to download them separately."
	einfo "For example, to download the English model, run:"
	einfo "  python -m spacy download en_core_web_sm"
	einfo "For GPU support, ensure the 'cuda' USE flag is enabled and the appropriate CUDA libraries are installed."
}
