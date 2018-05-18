# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit rpm xdg-utils

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io/"
SRC_URI="
	amd64? ( https://github.com/atom/atom/releases/download/v${PV}/${PN}.x86_64.rpm -> ${P}-amd64.rpm )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	gnome-base/gconf
	gnome-base/libgnome-keyring
"

S=${WORKDIR}

src_install () {
	doins -r *

	# change permissions
	find . -type f -perm -a=x -exec fperms a+x "/{}" \;
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
