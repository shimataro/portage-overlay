# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

VALA_MIN_API_VERSION=0.24
VALA_USE_DEPEND=vapigen

inherit fdo-mime gnome2-utils vala autotools-utils git-r3

DESCRIPTION="The dock for elementary Pantheon, stupidly simple"
HOMEPAGE="https://launchpad.net/plank"

AUTHOR="ricotz"
EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+dbus debug nls static-libs"

CDEPEND="
	dev-libs/glib:2
	dbus? ( dev-libs/libdbusmenu[gtk3] )
	dev-libs/libgee:0.8
	x11-libs/cairo
	x11-libs/libX11
	x11-libs/libwnck:3
	x11-libs/bamf
	x11-libs/gtk+:3"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	$(vala_depend)
	dev-util/intltool
	virtual/pkgconfig
	gnome-base/gnome-common
	nls? ( sys-devel/gettext )"

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=yes

DOCS=( AUTHORS COPYING COPYRIGHT NEWS README )

src_prepare() {
	epatch_user

	autotools-utils_src_prepare
	vala_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_enable debug)
		$(use_enable nls)
		$(use_enable dbus dbusmenu)
	)
	autotools-utils_src_configure
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update

	glib-compile-schemas /usr/share/glib-2.0/schemas
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
