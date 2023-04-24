# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="Free Universal Database Tool"
HOMEPAGE="https://dbeaver.io/"
SRC_URI="
	amd64? ( https://github.com/dbeaver/dbeaver/releases/download/${PV}/${P}-linux.gtk.x86_64.tar.gz -> ${P}-amd64.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	>=virtual/jdk-1.7
"

S=${WORKDIR}

src_install () {
	local TARGET="/usr/share/"

	# create desktop entry
	mkdir ${WORKDIR}/applications
	mv ${WORKDIR}/dbeaver ${WORKDIR}/dbeaver-ce
	cp -r ${WORKDIR}/dbeaver-ce/dbeaver-ce.desktop ${WORKDIR}/applications

	insinto ${TARGET}
	doins -r ${WORKDIR}/*

	# change permissions
	find . -type f -perm -a=x -exec fperms a+x "${TARGET}{}" \;
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
