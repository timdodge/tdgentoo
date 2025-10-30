# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

ROCM_VERSION="6.4"
inherit distutils-r1 pypi rocm
IUSE="rocm"

DESCRIPTION="CuPy is a NumPy/SciPy-compatible array library for GPU-accelerated computing"
HOMEPAGE="
	https://pypi.org/project/cupy/
	https://github.com/cupy/cupy
"

LICENSE="MIT"
SLOT="${ROCM_VERSION}"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
	rocm? ( >=sci-libs/hipBLAS-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/hipSPARSE-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/rocSPARSE-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/rocRAND-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/hipRAND-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/rocThrust-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/rocSOLVER-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/rocFFT-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/hipFFT-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/hipCUB-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=sci-libs/rocPRIM-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=dev-libs/rccl-${ROCM_VERSION}[${ROCM_USEDEP}]
			>=dev-util/roctracer-${ROCM_VERSION}[${ROCM_USEDEP}]
	)
"
BDEPEND="
	>=dev-python/fastrlock-0.5[${PYTHON_USEDEP}]
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
"

src_configure() {
	if use rocm; then
		export CUPY_INSTALL_USE_HIP=1
		export ROCM_HOME=/usr
		local amdgpu_flags=$(get_amdgpu_flags)
		export HCC_AMDGPU_TARGET=${amdgpu_flags//;/,}
	fi
	default
}

