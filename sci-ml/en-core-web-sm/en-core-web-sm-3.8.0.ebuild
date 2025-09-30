# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1
DESCRIPTION="Multi-language pipeline optimized for CPU. Components: ner"
HOMEPAGE="https://spacy.io/models/xx#xx_ent_wiki_sm"

MY_PN="${PN//-/_}"
SRC_URI="https://github.com/explosion/spacy-models/releases/download/${MY_PN}-${PV}/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sci-ml/spacy"
