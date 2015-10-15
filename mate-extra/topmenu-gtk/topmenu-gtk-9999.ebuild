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
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf --install
}

src_configure() {
	econf --prefix=/usr
}

pkg_postinst() {
	cat ${FILESDIR}/gtkrc-2.0 >>/etc/gtk-2.0/gtkrc
}
