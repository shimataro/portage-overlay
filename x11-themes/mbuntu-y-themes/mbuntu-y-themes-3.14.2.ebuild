# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="MBuntu Yosemite themes"
HOMEPAGE="https://launchpad.net/~noobslab/+archive/ubuntu/themes"
SRC_URI="http://ppa.launchpad.net/noobslab/themes/ubuntu/pool/main/m/mbuntu-y-ithemes-v5/mbuntu-y-ithemes-v5_3.14.2~vivid~NoobsLab.com.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/Mbuntu-Y-themes"

src_install() {
	for NAME in MBuntu-Y MBuntu-Y-For-Cinnamon MBuntu-Y-Transparent-Panel MBuntu-Y-Unity;
	do
		insinto /usr/share/themes/${NAME}
		doins -r ${NAME}/*
	done
}
