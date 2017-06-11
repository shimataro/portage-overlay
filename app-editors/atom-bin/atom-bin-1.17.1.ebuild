# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit eutils

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io/"
SRC_URI="
	amd64? ( https://github.com/atom/atom/releases/download/v${PV}/atom-amd64.tar.gz -> ${P}-amd64.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	gnome-base/gconf
	gnome-base/libgnome-keyring
"

TARGET_DIR="/usr/share/${PN}"
EXEFILE="atom"
PLATFORM=""

pkg_setup() {
	if use amd64; then
		PLATFORM="amd64"
	fi
}

src_install () {
	cd ${WORKDIR}/atom-${PV}-${PLATFORM}

	insinto ${TARGET_DIR}
	doins -r *

	# change permissions
	find -type f -perm -a=x -exec fperms a+x "${TARGET_DIR}/{}" \;

	# symbolic links
	dosym "${TARGET_DIR}/${EXEFILE}" /usr/bin/${PN}

	# icons
	doicon -s scalable ${FILESDIR}/icons/${PN}.svg
	for SIZE in 16 32 48 64 128 256;
	do
		newicon -s ${SIZE} ${FILESDIR}/icons/${PN}-${SIZE}.png ${PN}.png
	done
	newicon ${FILESDIR}/icons/${PN}-128.png ${PN}.png

	# desktop entry file
	make_desktop_entry "${PN}" "Atom" "${PN}" "TextEditor;Development;Utility;" "MimeType=text/plain;"
}
