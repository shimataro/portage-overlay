# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit unpacker xdg-utils eutils

DESCRIPTION="A modern, open source text editor that understands web design."
HOMEPAGE="http://brackets.io/"
SRC_URI="
	amd64? ( https://github.com/adobe/brackets/releases/download/release-${PV}/Brackets.Release.${PV}.64-bit.deb -> ${P}-amd64.deb )
	x86? ( https://github.com/adobe/brackets/releases/download/release-${PV}/Brackets.Release.${PV}.32-bit.deb -> ${P}-x86.deb )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	gnome-base/gconf
	x11-libs/libX11
"

S=${WORKDIR}

src_install () {
	doins -r *

	# change permissions
	find . -type f -perm -a=x -exec fperms a+x "/{}" \;

	make_desktop_entry "/opt/brackets/brackets %U" Brackets ${PN} "Development" "MimeType=text/html;"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
