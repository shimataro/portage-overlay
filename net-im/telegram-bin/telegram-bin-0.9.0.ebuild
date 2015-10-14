# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit eutils

DESCRIPTION="a new era of messaging"
HOMEPAGE="https://telegram.org/"
SRC_URI="
	amd64? ( https://updates.tdesktop.com/tlinux/tsetup.${PV}.tar.xz )
	x86?   ( https://updates.tdesktop.com/tlinux32/tsetup32.${PV}.tar.xz )
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/xz-utils"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	local DIR="/opt/${PN}"

	exeinto ${DIR}
	doexe Telegram/*

	doicon ${FILESDIR}/telegram.svg

	make_wrapper ${PN} "${DIR}/Telegram -- %u"
	make_desktop_entry ${PN} "Telegram Desktop" "telegram" "Network;" "MimeType=application/x-xdg-protocol-tg;x-scheme-handler/tg;"
}
