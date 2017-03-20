# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit eutils

DESCRIPTION="Visual Studio Code"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="
	amd64? ( https://vscode-update.azurewebsites.net/${PV}/linux-x64/stable -> ${P}-amd64.tar.gz )
	x86? ( https://vscode-update.azurewebsites.net/${PV}/linux-ia32/stable -> ${P}-x86.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	x11-libs/libX11
"

TARGET_DIR="/usr/share/${PN}"
EXEFILE="code"
PLATFORM=""

pkg_setup() {
	if use amd64; then
		PLATFORM="linux-x64"
	fi
	if use x86; then
		PLATFORM="linux-ia32"
	fi
}

src_install() {
	cd ${WORKDIR}/VSCode-${PLATFORM}

	insinto ${TARGET_DIR}
	doins -r *

	# change permissions
	find -type f -perm -a=x -exec fperms a+x "${TARGET_DIR}/{}" \;

	# symbolic links
	dosym "${TARGET_DIR}/${EXEFILE}" /usr/bin/${PN}

	# icons
	for SIZE in 16 32 48 64 128 256;
	do
		newicon -s ${SIZE} ${FILESDIR}/icons/${PN}-${SIZE}.png ${PN}.png
	done
	newicon ${FILESDIR}/icons/${PN}-128.png ${PN}.png

	# desktop entry file
	make_desktop_entry "${PN}" "Visual Studio Code" "${PN}" "TextEditor;Development;Utility;" "MimeType=text/plain;"
}
