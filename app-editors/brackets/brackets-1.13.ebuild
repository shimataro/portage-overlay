# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="An open source code editor for the web, written in JavaScript, HTML and CSS."
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
	dodir /
	cd "${ED}" || die
	unpacker
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
