# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="A small and easy workflow system"
HOMEPAGE="
	https://pypi.org/project/weasel/
	https://github.com/explosion/weasel/
"

SRC_URI="https://github.com/explosion/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/confection-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/wasabi-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.3[${PYTHON_USEDEP}]
	>=dev-python/typer-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
"
