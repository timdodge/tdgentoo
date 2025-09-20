# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

DESCRIPTION="Create Daily, Weekly and Monthly backups of MySQL databases."
HOMEPAGE="http://sourceforge.net/projects/automysqlbackup/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-v${PV}.tar.gz"
S=${WORKDIR}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-arch/bzip2
	app-arch/gzip
	virtual/mysql
"
DEPEND=""

PATCHES=(
    "${FILESDIR}/use_mariadb.patch"
)

src_install() {
	dobin automysqlbackup
	insinto /etc/automysqlbackup
	mv automysqlbackup.conf{,.example}
	doins automysqlbackup.conf.example
	# automysqlbackup.conf could contain passphrase information
	fperms 600 /etc/automysqlbackup/automysqlbackup.conf.example
	dodoc CHANGELOG README
}
