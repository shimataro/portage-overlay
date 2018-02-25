# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

REV="3f1c4bd"

DESCRIPTION="Cloud Application Platform"
HOMEPAGE="https://www.heroku.com/"
SRC_URI="
	amd64? ( https://cli-assets.heroku.com/heroku-cli/channels/stable/${PN}-v${PV}-${REV}-linux-x64.tar.gz -> ${P}-amd64.tar.gz )
	x86? ( https://cli-assets.heroku.com/heroku-cli/channels/stable/${PN}-v${PV}-${REV}-linux-x86.tar.gz -> ${P}-x86.tar.gz )
	arm? ( https://cli-assets.heroku.com/heroku-cli/channels/stable/${PN}-v${PV}-${REV}-linux-arm.tar.gz -> ${P}-arm.tar.gz )
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE=""

src_prepare() {
	local ARC=""
	if use amd64; then
		ARC="x64"
	fi
	if use x86; then
		ARC="x86"
	fi
	if use arm; then
		ARC="arm"
	fi

	S=${WORKDIR}/${PN}-v${PV}-${REV}-linux-${ARC}
}

src_install () {
	local INSDIR="/usr/share/${PN}"
	local SYMDIR="/usr/bin"

	insinto ${INSDIR}
	doins -r *

	# change permissions
	find . -type f -perm -a=x -exec fperms a+x "${INSDIR}/{}" \;

	# create symbolic link
	dodir ${SYMDIR}
	dosym ${INSDIR}/bin/heroku ${SYMDIR}
}
