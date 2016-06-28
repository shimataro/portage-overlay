# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="OSX-MATE theme - Based on Radiant-MATE"
HOMEPAGE="https://github.com/rohithmadhavan/OSX-MATE"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rohithmadhavan/${PN}.git"
EGIT_COMMIT="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-themes/mate-icon-theme-faenza"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/themes/${PN}
	doins -r *
}
