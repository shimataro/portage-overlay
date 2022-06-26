# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="GitHub Desktop for Linux"
HOMEPAGE="https://github.com/shiftkey/desktop"
SRC_URI="https://github.com/shiftkey/desktop/releases/download/release-${PV/_rc/-linux}/GitHubDesktop-linux-${PV/_rc/-linux}.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-crypt/libsecret
	dev-libs/libappindicator
	dev-libs/nss
	gnome-base/gconf
	gnome-base/gnome-keyring
	net-misc/curl
	x11-libs/libXtst
	x11-libs/libnotify
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
