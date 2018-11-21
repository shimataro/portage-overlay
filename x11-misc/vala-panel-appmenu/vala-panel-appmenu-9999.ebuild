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
	local mycmakeargs=(
		$(cmake-utils_use_enable xfce XFCE)
		$(cmake-utils_use_enable vala-panel VALAPANEL)
		$(cmake-utils_use_enable mate MATE)
		$(cmake-utils_use_enable jayatana JAYATANA)
		-DENABLE_APPMENU_GTK_MODULE=ON
	)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update

	if use xfce; then
		elog "type the following lines into yor console:"
		elog "    xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true"
		elog "    xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true"
	fi
	if use mate; then
		elog "type the following lines into yor console:"
		elog "    gsettings set org.mate.interface gtk-shell-shows-app-menu true"
		elog "    gsettings set org.mate.interface gtk-shell-shows-menubar true"
	fi
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
