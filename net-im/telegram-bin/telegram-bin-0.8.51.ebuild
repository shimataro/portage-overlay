# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

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
	insinto /opt/${PN}
	insopts -m0755
	doins -r Telegram/*

	# icon
	insopts -m0644
	doins ${FILESDIR}/telegram.svg

	# desktop entry
	insinto /usr/share/applications
	doins ${FILESDIR}/telegramdesktop.desktop
}
