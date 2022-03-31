# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="Morisawa BIZ UDGothic"
HOMEPAGE="https://github.com/googlefonts/morisawa-biz-ud-mincho"
AUTHOR="googlefonts"

EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="v${PV}"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 mips ppc ppc64 sparc x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	# do nothing
	:
}

src_install() {
	insinto /usr/share/fonts/morisawa-biz-ud
	doins -r ${S}/fonts/ttf/*.ttf
}

pkg_postinst() {
	einfo "Updating global fontcache"
	fc-cache -fs
}

pkg_postrm() {
	einfo "Updating global fontcache"
	fc-cache -fs
}
