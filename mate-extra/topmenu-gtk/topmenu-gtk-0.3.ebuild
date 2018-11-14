# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3 autotools

DESCRIPTION="A Gtk+ module and Mate/Xfce panel applets for a global menubar."
HOMEPAGE="https://git.javispedro.com/cgit/topmenu-gtk.git"
SRC_URI=""

EGIT_REPO_URI="https://git.javispedro.com/cgit/${PN}.git"
EGIT_COMMIT="release_${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	mate-base/mate-panel
	x11-libs/gtk+:3
	x11-libs/libwnck:1
"

src_prepare() {
	eautoreconf --install
}

src_configure() {
	econf --prefix=/usr --with-gtk=3
}

pkg_postinst() {
	gnome2_icon_cache_update
	cat ${FILESDIR}/gtkrc-2.0 >>/etc/gtk-2.0/gtkrc
}

pkg_postrm() {
	gnome2_icon_cache_update
}
