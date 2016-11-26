# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools

DESCRIPTION="A flat theme with transparent elements"
HOMEPAGE="https://github.com/horst3180/arc-theme"
SRC_URI=""
AUTHOR="horst3180"

EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+transparency +light +darker +dark +cinnamon +gnome-shell +gtk2 +gtk3 +metacity +unity +xfwm +xfce-notify"

DEPEND="
	dev-vcs/git
	sys-devel/autoconf
"
RDEPEND="
	x11-themes/gtk-engines-murrine
	x11-themes/gnome-themes-standard
"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable transparency) \
		$(use_enable light) \
		$(use_enable darker) \
		$(use_enable dark) \
		$(use_enable cinnamon) \
		$(use_enable gnome-shell) \
		$(use_enable gtk2) \
		$(use_enable gtk3) \
		$(use_enable metacity) \
		$(use_enable unity) \
		$(use_enable xfwm) \
		$(use_enable xfce-notify)
}
