# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Source Han Code JP"
HOMEPAGE="http://github.com/adobe-fonts/source-han-code-jp"
SRC_URI="https://github.com/adobe-fonts/${PN}/archive/${PV}R.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 mips ppc ppc64 sparc x86"
IUSE="+otc -otf"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${P}R"

src_install() {
	if use otc;
	then
		insinto /usr/share/fonts/${PN}
		doins -r ${S}/OTC/*.ttc
	fi
	if use otf;
	then
		insinto /usr/share/fonts/${PN}
		doins -r ${S}/OTF/*.otf
	fi
}

pkg_postinst() {
	einfo "Updating global fontcache"
	fc-cache -fs
}

pkg_postrm() {
	einfo "Updating global fontcache"
	fc-cache -fs
}
