# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# To check if there's a new version available:
# curl -so- https://apt.enpass.io/dists/stable/main/binary-amd64/Packages.gz | zegrep "Package|Version|Depends" | head -n 3

EAPI=5

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="Description: A cross-platform, complete password management solution that securely manages passwords and all other life important credentials like bank accounts, Credit cards, IDs, passport, driving licenses etc. Everything is saved locally on user device and optionally he can sync through other devices using his accounts of Dropbox, Box, Google Drive, OneDrive and ownCloud."
HOMEPAGE="https://www.enpass.io/"
SRC_URI="https://apt.enpass.io/pool/main/e/${PN}/${PN}_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	x11-libs/libXScrnSaver
	sys-process/lsof
	net-misc/curl[adns]
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
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
