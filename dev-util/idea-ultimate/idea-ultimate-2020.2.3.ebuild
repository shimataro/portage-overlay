# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit unpacker eutils desktop

DESCRIPTION="A Capable and Ergonomic Java IDE for Enterprise"
HOMEPAGE="https://www.jetbrains.com/idea/"
SRC_URI="
	jbr? ( https://download.jetbrains.com/idea/ideaIU-${PV}.tar.gz )
	!jbr? ( https://download.jetbrains.com/idea/ideaIU-${PV}-no-jbr.tar.gz )
"

LICENSE="IDEA || ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="+jbr"

RDEPEND="
	>=virtual/jdk-1.7
"

S=${WORKDIR}

src_install () {
	local dir=$(ls -1 | head -1)

	insinto /opt/
	doins -r ${S}/*

	# change permissions
	find . -type f -perm -a=x -exec fperms a+x "/opt/{}" \;

	make_wrapper "${PN}" "/opt/${dir}/bin/idea.sh"
	newicon "${dir}/bin/idea.svg" "${PN}.svg"
	make_desktop_entry "${PN}" "IntelliJ Idea Ultimate" "${PN}" "Development;IDE;"
}
