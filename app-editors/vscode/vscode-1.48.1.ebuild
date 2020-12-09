# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="Visual Studio Code"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="
	amd64? ( https://vscode-update.azurewebsites.net/${PV}/linux-deb-x64/stable -> ${P}-amd64.deb )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	x11-libs/libnotify
	>=dev-libs/nss-3.26
	app-crypt/gnupg
	x11-libs/libxkbfile
	app-crypt/libsecret
	>=x11-libs/gtk+-3.10.0
	x11-libs/libXScrnSaver
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
