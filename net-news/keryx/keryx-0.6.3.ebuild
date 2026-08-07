# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit desktop unpacker xdg-utils

DESCRIPTION="One reader. Every device."
HOMEPAGE="https://keryx.merc.works/"
SRC_URI="
	amd64? ( https://github.com/shimataro/${PN}/releases/download/v${PV}/Keryx-${PV}-linux-x86_64.deb -> ${P}-amd64.deb )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

src_install () {
	dodir /
	cd "${ED}" || die
	unpacker

	# Upstream's jpackage build doesn't install anything under
	# /usr/share/applications yet (missing Linux "shortcut" request on the
	# Compose Multiplatform side — fixed upstream, not yet released).
	# The .desktop it does ship (under /opt/keryx/lib) already has correct
	# absolute Exec=/Icon= paths, so just install it into the standard location.
	domenu opt/keryx/lib/keryx-Keryx.desktop
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
