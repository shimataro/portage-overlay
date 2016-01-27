# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit git-r3

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/atom/${PN}.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	|| ( net-libs/nodejs[npm] net-libs/iojs[npm] )
	sys-apps/sed
"
RDEPEND=""

NPMDIR="/usr/etc"

pkg_setup() {
	if [ ! -d ${NPMDIR} ]; then
		mkdir ${NPMDIR}
	fi
}

src_compile() {
	./script/build --verbose --build-dir ${T}/atom-build || die "!!!failed to compile atom!!!"
}

src_install() {
	./script/grunt install --install-dir ${D}/usr
	dosed "s:${D}:/:g" /usr/share/applications/atom.desktop
}

pkg_postinst() {
	rmdir ${NPMDIR}
}
