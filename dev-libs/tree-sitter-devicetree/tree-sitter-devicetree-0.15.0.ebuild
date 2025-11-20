# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

DESCRIPTION="Devicetree grammar for Tree-sitter"
HOMEPAGE="https://github.com/joelspadin/tree-sitter-devicetree"

SRC_URI="https://github.com/joelspadin/${PN}/archive/${TS_PV:-v${PV}}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
