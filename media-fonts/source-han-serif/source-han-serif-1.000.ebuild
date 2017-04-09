# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Source Han Serif"
HOMEPAGE="http://adobe.ly/SourceHanSerif"
SRC_URI="https://github.com/adobe-fonts/${PN}/archive/${PV}R.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 mips ppc ppc64 sparc x86"
IUSE="+otc l10n_ja l10n_ko l10n_zh-CN l10n_zh-TW"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${P}R"

src_install() {
	declare -A hash_
	hash_["ja"]="Japanese"
	hash_["ko"]="Korean"
	hash_["zh-CN"]="SimplifiedChinese"
	hash_["zh-TW"]="TraditionalChinese"

	if use otc;
	then
		insinto /usr/share/fonts/${PN}
		doins -r ${S}/OTC/*.ttc
	fi

	for l in ja ko zh-CN zh-TW;
	do
		local ll=${hash_[${l}]}
		if use l10n_${l};
		then
			insinto /usr/share/fonts/${PN}/${l}
			doins -r ${S}/OTF/${ll}/*.otf
		fi
	done
}

pkg_postinst() {
	einfo "Updating global fontcache"
	fc-cache -fs
}

pkg_postrm() {
	einfo "Updating global fontcache"
	fc-cache -fs
}
