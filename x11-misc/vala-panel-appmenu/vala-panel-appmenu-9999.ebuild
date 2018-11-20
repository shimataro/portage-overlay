# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_MIN_API_VERSION=0.24

inherit git-r3 vala cmake-utils eutils gnome2-utils

DESCRIPTION="Global Menu for Vala Panel (and xfce4-panel and mate-panel)"
HOMEPAGE="https://github.com/rilian-la-te/vala-panel-appmenu"
SRC_URI=""

EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_COMMIT="${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="-vala-panel xfce mate +wnck jayatana"
REQUIRED_USE="|| ( vala-panel xfce mate )"

DEPEND="
	$(vala_depend)
	>=x11-libs/gtk+-3.22.0:3
	sys-devel/gettext
"
RDEPEND="
	${DEPEND}
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	>=x11-libs/bamf-0.5.0
	wnck? ( >=x11-libs/libwnck-3.4.7 )
	vala-panel? ( x11-misc/vala-panel )
	xfce? ( >=xfce-base/xfce4-panel-4.11.2 )
	mate? ( >=mate-base/mate-panel-1.20.0 )
"

src_configure() {
	cmake-utils_use_enable XFCE xfce
	cmake-utils_use_enable VALAPANEL vala-panel
	cmake-utils_use_enable MATE mate
	cmake-utils_use_enable JAYATANA jayatana
	cmake-utils_use_enable APPMENU_GTK_MODULE
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
