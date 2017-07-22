# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="threads(+)"
inherit git-r3 eutils waf-utils python-single-r1 gnome2-utils

DESCRIPTION="Store, Sync and Share Files Online"
#DESCRIPTION="Plugin for Thunar that adds context-menu items for Dropbox"
HOMEPAGE="http://www.softwarebakery.com/maato/thunar-dropbox.html"

EGIT_REPO_URI="https://github.com/Maato/thunar-dropbox"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

COMMON_DEPEND="
	dev-libs/glib:2
	xfce-base/thunar
"
DEPEND="
	${COMMON_DEPEND}
	virtual/pkgconfig
"
RDEPEND="
	${COMMON_DEPEND}
	net-misc/dropbox
"

#src_prepare() {
#	epatch "${FILESDIR}/${P}-wscript.patch"
#}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update /usr/share/icons/hicolor
	gtk-update-icon-cache
}

pkg_postrm() {
	gnome2_icon_cache_update /usr/share/icons/hicolor
	gtk-update-icon-cache
}
