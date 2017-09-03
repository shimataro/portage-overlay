# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit rpm

DESCRIPTION="Bring messenger.com to your OS X, Windows or Linux desktop."
HOMEPAGE="https://messengerfordesktop.com/"
SRC_URI="
	amd64? ( https://github.com/aluxian/Messenger-for-Desktop/releases/download/v${PV}/messengerfordesktop-${PV}-linux-x86_64.rpm -> ${P}-amd64.rpm )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	gnome-base/gconf
	gnome-base/libgnome-keyring
"

DIR="opt"
PACKAGE="messengerfordesktop"
EXEFILE="messengerfordesktop"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install () {
	insinto /${DIR}
	doins -r ${DIR}/*

	# symbolic links
	dosym "/${DIR}/${PACKAGE}/${EXEFILE}" /usr/bin/${PACKAGE}

	# icons
	for SIZE in 16 24 32 48 64 128 256 512;
	do
		doicon -s ${SIZE} usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${PACKAGE}.png
	done
	doicon usr/share/icons/hicolor/128x128/apps/${PACKAGE}.png

	# desktop entry
	domenu usr/share/applications/${PACKAGE}.desktop

	# change permissions
	find ${DIR} -type f -perm -a=x -exec fperms a+x "/{}" \;
}
