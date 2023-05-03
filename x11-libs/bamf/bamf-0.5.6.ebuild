# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )
VALA_MIN_API_VERSION=0.20
VALA_USE_DEPEND=vapigen

inherit vala autotools libtool python-any-r1 git-r3

EGIT_REPO_URI="https://git.launchpad.net/${PN}"
EGIT_COMMIT="${PV}"

DESCRIPTION="BAMF Application Matching Framework"
HOMEPAGE="https://launchpad.net/bamf"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+introspection doc static-libs"

RDEPEND="
	dev-libs/dbus-glib
	dev-util/gdbus-codegen
	>=dev-libs/glib-2.38:2
	gnome-base/libgtop:2
	x11-libs/gtk+:3
	x11-libs/libX11
	>=x11-libs/libwnck-3.4.7:3
"
BDEPEND="
	$(vala_depend)
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/lxml[${PYTHON_USEDEP}]
	')
	dev-util/gtk-doc
	introspection? ( dev-libs/gobject-introspection )
	virtual/pkgconfig
"

src_prepare() {
	sed -i 's/-Werror//' configure.ac

	eapply_user
	./autogen.sh

	vala_src_prepare
}

src_configure() {
	python_setup

	econf \
		--disable-gtktest \
		$(use_enable doc gtk-doc) \
		$(use_enable introspection) \
		VALA_API_GEN="${VAPIGEN}"
}
