# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 gnome2-utils xdg-utils

DESCRIPTION="A flat theme with transparent elements"
HOMEPAGE="https://github.com/daniruiz/flat-remix"
SRC_URI=""
AUTHOR="daniruiz"

EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="${PV}"
EGIT_SUBMODULES=(-aur)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-vcs/git
"
RDEPEND="
	x11-themes/gtk-engines-murrine
	x11-themes/gnome-themes-standard
"

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
