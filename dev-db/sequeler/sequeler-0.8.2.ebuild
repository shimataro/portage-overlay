# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson ninja-utils vala gnome2-utils

DESCRIPTION="SQL Client built in Vala"
HOMEPAGE="https://github.com/Alecaddd/sequeler"
AUTHOR="Alecaddd"

EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mysql +postgres"
REQUIRED_USE=""

CDEPEND="
	>=x11-libs/gtk+-3.22.29:3
	>=dev-libs/granite-5.3
	dev-libs/glib:2
	dev-libs/libgee:0.8
	dev-libs/libxml2
	gnome-extra/libgda:5/4[mysql?,postgres?]
	x11-libs/gtksourceview:3.0
	app-crypt/libsecret
	net-libs/libssh2
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
