# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

WX_GTK_VER="3.0"
inherit git-r3 wxwidgets

DESCRIPTION="An open source disk encryption tool with strong security for the Paranoid"
HOMEPAGE="https://veracrypt.codeplex.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/veracrypt/VeraCrypt"
EGIT_COMMIT="VeraCrypt_${PV}"

LICENSE="truecrypt-3.0"
SLOT="0"
KEYWORDS=""
IUSE="asm wxwidgets"

DEPEND="
	sys-fs/fuse
	app-arch/makeself
	x11-libs/wxGTK:3.0
	asm? ( dev-lang/nasm )
"
RDEPEND="${DEPEND}"

src_compile() {
	local OPTIONS=("VERBOSE=1")
	if use !asm; then
		OPTIONS+=("NOASM=1")
	fi
	if use !wxwidgets; then
		OPTIONS+=("NOGUI=1")
	fi

	cd src
	emake ${OPTIONS[@]} TC_EXTRA_CFLAGS="${CFLAGS}" TC_EXTRA_CXXFLAGS="${CXXFLAGS}"
}

src_install() {
	cd src/Setup/Linux
	insinto /
	doins -r usr

	dobin usr/bin/*
}
