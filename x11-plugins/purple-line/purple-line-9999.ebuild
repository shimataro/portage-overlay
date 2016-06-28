# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$


EAPI=5
inherit git-2

DESCRIPTION="libpurple (Pidgin, Finch) protocol plugin for LINE."
HOMEPAGE="http://altrepo.eu/git/purple-line"
SRC_URI=""

EGIT_REPO_URI="http://altrepo.eu/git/purple-line.git"
EGIT_COMMIT=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-im/pidgin dev-util/apache-thrift"
RDEPEND="${DEPEND}"
