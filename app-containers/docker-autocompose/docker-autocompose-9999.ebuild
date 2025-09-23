# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1 git-r3

DESCRIPTION="Generates a docker-compose yaml definition from a docker container."
HOMEPAGE="https://github.com/Red5d/docker-autocompose"
EGIT_REPO_URI="https://github.com/Red5d/docker-autocompose.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyaml-24.9.0[${PYTHON_USEDEP}]
	~dev-python/docker-7.1.0[${PYTHON_USEDEP}]
"
