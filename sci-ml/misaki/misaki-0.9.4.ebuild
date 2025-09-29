# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="G2P engine designed for Kokoro TTS models"
HOMEPAGE="https://github.com/hexgrad/misaki https://pypi.org/project/misaki/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+en"

RDEPEND="
	dev-python/addict[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	en? (
		dev-python/num2words[${PYTHON_USEDEP}]
		dev-python/phonemizer-fork[${PYTHON_USEDEP}]
	)
"
