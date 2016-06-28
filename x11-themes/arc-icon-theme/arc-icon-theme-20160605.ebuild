# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools

DESCRIPTION="A flat theme with transparent elements"
HOMEPAGE="https://github.com/horst3180/arc-icon-theme"
SRC_URI=""
AUTHOR="horst3180"

EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-vcs/git
	sys-devel/autoconf
"
RDEPEND=""

src_prepare() {
	eautoreconf
}
