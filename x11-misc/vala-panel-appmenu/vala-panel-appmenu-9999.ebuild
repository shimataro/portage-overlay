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
IUSE="-vala-panel xfce mate +wnck jayatana -wayland"
REQUIRED_USE="|| ( vala-panel xfce mate )"

DEPEND="
	$(vala_depend)
	>=x11-libs/gtk+-3.22.0:3[wayland?]
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

src_prepare() {
	if use !wayland; then
		sed -i 's/WAYLAND//' CMakeLists.txt
		sed -i 's/WAYLAND//' subprojects/appmenu-gtk-module/CMakeLists.txt
		sed -i 's/\${WAYLAND_INCLUDE}//'  subprojects/appmenu-gtk-module/src/CMakeLists.txt
	fi

	vala_src_prepare
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_XFCE=$(usex xfce ON OFF)
		-DENABLE_VALAPANEL=$(usex vala-panel ON OFF)
		-DENABLE_MATE=$(usex mate ON OFF)
		-DENABLE_JAYATANA=$(usex jayatana ON OFF)
		-DENABLE_APPMENU_GTK_MODULE=ON
		-DGSETTINGS_COMPILE=OFF
	)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update

	elog "for GTK+2; add the following lines into /etc/gtk-2.0/gtkrc:"
	elog "  gtk-modules=\"appmenu-gtk-module\""
	elog
	elog "for GTK+3; add the following lines into /etc/gtk-3.0/settings.ini:"
	elog "  [Settings]"
	elog "  gtk-modules=\"appmenu-gtk-module\""
	elog

	if use xfce; then
		elog "type the following lines into yor console:"
		elog "  xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true"
		elog "  xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true"
	fi
	if use mate; then
		elog "type the following lines into yor console:"
		elog "  gsettings set org.mate.interface gtk-shell-shows-app-menu true"
		elog "  gsettings set org.mate.interface gtk-shell-shows-menubar true"
	fi
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
