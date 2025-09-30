# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 pypi

DESCRIPTION="Generate audiobooks from e-books (epub to wav/m4b)"
HOMEPAGE="https://github.com/santinic/audiblez"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=sci-ml/kokoro-0.7.9[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/EbookLib-0.18[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/pick-2.4.0[${PYTHON_USEDEP}]
		>=sci-ml/spacy-3.8.3[${PYTHON_USEDEP}]
		>=sci-ml/misaki-0.7.10[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	')
	media-video/ffmpeg
	app-accessibility/espeak-ng
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	distutils-r1_src_prepare

	# sigh, poetry
	sed -i -e 's:\^:>=:' pyproject.toml || die
}
