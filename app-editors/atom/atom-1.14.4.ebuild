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
	>=net-libs/nodejs-6[npm]
	sys-apps/sed
"
RDEPEND="
	gnome-base/libgnome-keyring
"

TARGET_DIR="/usr/share/${PN}"
EXEFILE="atom"
PLATFORM=""
NPMDIR="/usr/etc"

pkg_setup() {
	if use amd64; then
		PLATFORM="amd64"
	fi
	if use x86; then
		PLATFORM="x86"
	fi

	if [ ! -d ${NPMDIR} ]; then
		mkdir ${NPMDIR}
	fi
}

src_configure() {
	epatch -p1 "${FILESDIR}/1.14.patch"
}

src_compile() {
	./script/build || die "!!!failed to compile atom!!!"
}

src_install() {
	insinto ${TARGET_DIR}
	doins -r ${WORKDIR}/${PF}/out/${PF}-${PLATFORM}/*

	# change permissions
	fperms +x "${TARGET_DIR}/${EXEFILE}" "${TARGET_DIR}/libnode.so"

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

pkg_postinst() {
	rmdir ${NPMDIR}
}
