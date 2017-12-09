# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit rpm xdg-utils

DESCRIPTION="Visual Studio Code"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="
	amd64? ( https://vscode-update.azurewebsites.net/${PV}/linux-rpm-x64/stable -> ${P}-amd64.rpm )
	x86? ( https://vscode-update.azurewebsites.net/${PV}/linux-rpm-ia32/stable -> ${P}-x86.rpm )
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
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
