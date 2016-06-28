# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3 autotools

DESCRIPTION="application dock for the MATE panel"
HOMEPAGE="https://github.com/robint99/dock-applet"
SRC_URI=""

EGIT_REPO_URI="https://github.com/robint99/dock-applet.git"
EGIT_COMMIT="V${PV}"

LICENSE=""
SLOT="0"
#KEYWORDS="~amd64 ~x86"
KEYWORDS=""
IUSE=""

DEPEND="
	sys-devel/automake:1.15
"
RDEPEND="
	dev-lang/python:3.4
	sci-libs/scipy
	x11-libs/libwnck:1[introspection]
	mate-base/mate-panel[introspection]
	dev-python/pygobject:3[python_targets_python3_4]
	dev-python/pyxdg[python_targets_python3_4]
	dev-python/pygtksourceview
	dev-python/pillow
	dev-python/pycairo
"

#aclocal
#automake --add-missing
#autoreconf
#./configure --prefix=/usr
#make
#sudo make install

src_prepare() {
	eaclocal
	eautomake --add-missing
	eautoreconf
}
