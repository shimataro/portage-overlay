# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit eutils git-r3

DESCRIPTION="Visual Studio Code"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Microsoft/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="amd64 x86"
KEYWORDS=""
IUSE=""

DEPEND="
	>=net-libs/nodejs-0.12[npm]
	dev-lang/python:2.7
	sys-devel/gcc
	sys-devel/make
"
RDEPEND=""

TARGET_DIR="/usr/share/${PN}"
PLATFORM=""
if use amd64; then
	PLATFORM="linux-x64"
fi
if use x86; then
	PLATFORM="linux-ia32"
fi

NPMDIR="/usr/etc"

pkg_setup() {
	if [ ! -d ${NPMDIR} ]; then
		mkdir ${NPMDIR}
	fi
}

src_prepare() {
	npm install
}

src_compile() {
	./node_modules/gulp/bin/gulp.js ${PN}-${PLATFORM}-min
}

src_install() {
	insinto ${TARGET_DIR}
	doins -r ${WORKDIR}/VSCode-${PLATFORM}/*

	# change permissions
	fperms +x "${TARGET_DIR}/Code [OSS Build]"

	# symbolic links
	dosym "${TARGET_DIR}/Code [OSS Build]" /usr/bin/vscode

	# icons
	for SIZE in 16 32 48 64 128 256;
	do
		doicon -s ${SIZE} ${FILESDIR}/icons/${SIZE}/vscode.png
	done
	doicon ${FILESDIR}/icons/128/vscode.png

	# desktop entry file
	make_desktop_entry "vscode" "Visual Studio Code" "vscode" "TextEditor;Development;Utility;" "MimeType=text/plain;"
}

pkg_postinst() {
	rmdir ${NPMDIR}
}
