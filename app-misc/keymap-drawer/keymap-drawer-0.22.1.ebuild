# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Parse QMK & ZMK keymaps and draw them in SVG format"
HOMEPAGE="https://github.com/caksoylar/keymap-drawer"

SRC_URI="https://github.com/caksoylar/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-util/pcpp-1.30[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.2[${PYTHON_USEDEP}]
		>=dev-libs/tree-sitter-0.25.0
		>=dev-libs/tree-sitter-devicetree-0.14.0
		>=dev-python/pyparsing-3.2[${PYTHON_USEDEP}]
	')
"
RDEPEND=""
BDEPEND=""

src_prepare() {
	distutils-r1_src_prepare

	# sigh, poetry
	sed -i -e 's:\^:>=:' pyproject.toml || die
}
