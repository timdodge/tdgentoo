# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 pypi

DESCRIPTION="An inference library for the Kokoro-82M TTS model"
HOMEPAGE="https://github.com/hexgrad/kokoro https://pypi.org/project/kokoro/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=sci-ml/misaki-0.9.4[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
