# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit rpm

DESCRIPTION="Bring messenger.com to your OS X, Windows or Linux desktop."
HOMEPAGE="https://messengerfordesktop.com/"
SRC_URI="
	amd64? ( https://github.com/aluxian/Messenger-for-Desktop/releases/download/v${PV}/messengerfordesktop-${PV}-linux-x86_64.rpm -> ${P}-amd64.rpm )
	x86? ( https://github.com/aluxian/Messenger-for-Desktop/releases/download/v${PV}/messengerfordesktop-${PV}-linux-i386.rpm -> ${P}-x86.rpm )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	gnome-base/gconf
	gnome-base/libgnome-keyring
"

S=${WORKDIR}

src_install () {
	doins -r *

	# change permissions
	find . -type f -perm -a=x -exec fperms a+x "/{}" \;
}
