# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson ninja-utils vala gnome2-utils

DESCRIPTION="Code editor designed for elementary OS"
HOMEPAGE="https://github.com/elementary/code"
AUTHOR="elementary OS"

EGIT_REPO_URI="https://github.com/elementary/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
REQUIRED_USE=""

CDEPEND="
	app-text/editorconfig-core-c
	x11-libs/gtk+:3
	dev-libs/libgee:0.8
	>=dev-libs/libgit2-glib-1.0
	x11-libs/gtksourceview:4
	app-text/gtkspell:3
	>=dev-libs/granite-6.0.0
	>=gui-libs/libhandy-0.90.0
	dev-libs/libpeas
	net-libs/libsoup:2.4
	x11-libs/vte:2.91
"

RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}"

src_prepare() {
	epatch_user
	eapply_user

	./autogen.sh
	vala_src_prepare
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}
