# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=5

inherit eutils cmake-utils bash-completion-r1

DESCRIPTION="Timewarrior tracks and reports time"
HOMEPAGE="http://taskwarrior.org/docs/timewarrior/index.html"
SRC_URI="http://taskwarrior.org/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/readline:0
	elibc_glibc? ( sys-apps/util-linux )"
RDEPEND="${DEPEND}"

src_prepare() {
	# don't automatically install ext
	sed -i '/ext/d' CMakeLists.txt || die
}

src_configure() {
	mycmakeargs=(
		-DTIMEW_DOCDIR=share/doc/${PF}
	)
	cmake-utils_src_configure
}
