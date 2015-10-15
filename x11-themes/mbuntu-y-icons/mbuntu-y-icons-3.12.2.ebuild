# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="MBuntu Yosemite icons & cursors themes"
HOMEPAGE="https://launchpad.net/~noobslab/+archive/ubuntu/themes"
SRC_URI="http://ppa.launchpad.net/noobslab/themes/ubuntu/pool/main/m/mbuntu-y-icons-v4/mbuntu-y-icons-v4_3.12.2~trusty~NoobsLab.com.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/MBuntu-Y-icons"

src_install() {
	local NAME=""

	NAME="MBuntu-OS-Y"
	insinto /usr/share/icons/${NAME}
	doins -r ${NAME}/*

	NAME="mac-cursors"
	insinto /usr/share/cursors/xorg-x11/${NAME}
	doins -r ${NAME}/*
}
