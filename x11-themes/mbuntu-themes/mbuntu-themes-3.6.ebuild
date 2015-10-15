# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="MBuntu themes"
HOMEPAGE="https://launchpad.net/~noobslab/+archive/ubuntu/themes"
SRC_URI="http://ppa.launchpad.net/noobslab/themes/ubuntu/pool/main/m/mac-ithemes-v2-noobslab/mac-ithemes-v2-noobslab_3.6~saucy~NoobsLab.com.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/MBuntu-themes"

src_install() {
	for NAME in MBuntu-AC MBuntu-OSX MBuntu-Shell MBuntu-X MBuntu-iB;
	do
		insinto /usr/share/themes/${NAME}
		doins -r ${NAME}/*
	done
}
