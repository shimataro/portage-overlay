# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="MBuntu boot-splash theme"
HOMEPAGE="https://launchpad.net/~noobslab/+archive/ubuntu/themes"
SRC_URI="http://ppa.launchpad.net/noobslab/themes/ubuntu/pool/main/m/mbuntu-bscreen-v3/mbuntu-bscreen-v3_3.10~trusty~NoobsLab.com.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND_COMMON="sys-boot/plymouth"
DEPEND="${DEPEND_COMMON}"
RDEPEND="${DEPEND_COMMON}"

S="${WORKDIR}/mbuntu-boot"

src_install() {
	for NAME in mbuntu;
	do
		insinto /lib/plymouth/themes/${NAME}
		doins -r ${NAME}/*
		dosym /lib/plymouth/themes/${NAME} /usr/share/plymouth/themes/${NAME}
	done
}

pkg_postinst() {
	einfo
	einfo "mbuntu-plymouth has been installed successfully."
	einfo "to apply this theme, execute following command:"
	einfo
	einfo "# plymouth-set-default-theme mbuntu"
	einfo
}
