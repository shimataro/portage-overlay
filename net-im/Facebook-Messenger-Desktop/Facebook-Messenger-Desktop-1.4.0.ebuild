# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils git-r3

DESCRIPTION="A simple & beautiful app for Facebook Messenger."
HOMEPAGE="http://messengerfordesktop.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Aluxian/${PN}.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="|| ( net-libs/nodejs[npm] net-libs/iojs[npm] )"
RDEPEND=""

TARGET_DIR="/opt/MessengerForDesktop"
PLATFORM=""

pkg_setup() {
	if use amd64; then
		PLATFORM="linux64"
	fi
	if use x86; then
		PLATFORM="linux32"
	fi

	if [ -z ${PLATFORM} ]; then
		eerror
		eerror "!!! Invalid Platform !!!"
		eerror
		die
	fi

	npm install -g gulp
	chown -R portage:portage ${PORTAGE_BUILDDIR}/homedir/.npm
}

src_prepare() {
	npm install
	npm install gulp-node-webkit-builder
}

src_compile() {
	gulp build:${PLATFORM}
}

src_install() {
	doicon -s 48       assets-linux/icons/48/messengerfordesktop.png
	doicon -s 256      assets-linux/icons/256/messengerfordesktop.png
	doicon -s scalable assets-linux/icons/scalable/messengerfordesktop.svg
	doicon             assets-linux/icons/scalable/messengerfordesktop.svg

	domenu assets-linux/messengerfordesktop.desktop

	insopts -m0755
	insinto ${TARGET_DIR}
	doins -r build/Messenger/${PLATFORM}/*

	dosym ${TARGET_DIR}/Messenger /usr/bin/messengerfordesktop
}
