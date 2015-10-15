# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="MBuntu themes"
HOMEPAGE="https://launchpad.net/~noobslab/+archive/ubuntu/themes"
SRC_URI="http://ppa.launchpad.net/noobslab/themes/ubuntu/pool/main/m/mac-ithemes-v3/mac-ithemes-v3_3.12-c~trusty~NoobsLab.com.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/Mbuntu-themes"

src_install() {
	for NAME in Mac-2.0 Mbuntu-AC Mbuntu-Mb Mbuntu-Mb-For-Mint Mbuntu-X Mbuntu-Zukimac Mbuntu-Zukimac-ml Mbuntu-Zukimac-ml2 Mbuntu-iB Mbuntu-iB-For-Mint;
	do
		insinto /usr/share/themes/${NAME}
		doins -r ${NAME}/*
	done
}
