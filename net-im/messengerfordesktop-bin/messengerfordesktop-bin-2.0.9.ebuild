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

PN_SRC="messengerfordesktop"
OPT_SRC="opt/${PN_SRC}"
OPT_DST="/opt/${PN}"
EXEFILE="messengerfordesktop"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install () {
	insinto ${OPT_DST}
	doins -r ${OPT_SRC}/*

	# symbolic links
	dosym "${OPT_DST}/${EXEFILE}" /usr/bin/${PN}

	# icons
	for SIZE in 16 24 32 48 64 128 256 512;
	do
		newicon -s ${SIZE} usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${PN_SRC}.png ${PN}.png
	done
	newicon usr/share/icons/hicolor/128x128/apps/${PN_SRC}.png ${PN}.png

	# desktop entry
	make_desktop_entry "${PN}" "Messenger For Desktop" "${PN}" "GNOME;GTK;Network;InstantMessaging;"

	# change permissions
	cd ${OPT_SRC}
	find . -type f -perm -a=x -exec fperms a+x "${OPT_DST}/{}" \;
}
