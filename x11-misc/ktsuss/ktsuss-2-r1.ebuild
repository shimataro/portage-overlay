# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/ktsuss/ktsuss-2.ebuild,v 1.7 2012/12/10 18:04:23 ago Exp $

EAPI=4

DESCRIPTION="ktsuss stands for \"keep the su simple, stupid\", and as the name says, is a graphical version (frontend) of su written in C and GTK+ 2. The idea of the project is to remain simple and bug free."
HOMEPAGE="https://github.com/nomius/ktsuss"
SRC_URI="https://github.com/nomius/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86"
IUSE="sudo"

RDEPEND=">=x11-libs/gtk+-2.12.11:2
	>=dev-libs/glib-2.16.5:2
	sudo? ( app-admin/sudo )"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

src_configure() {
	econf \
		$(use_enable sudo)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc Changelog CREDITS README
}
