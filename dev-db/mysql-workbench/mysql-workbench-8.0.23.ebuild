# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
GCONF_DEBUG="no"

PYTHON_COMPAT=( python3_8 )
PYTHON_REQ_USE="sqlite"

ANTLR_VERSION=4.7.1

inherit flag-o-matic git-r3 gnome2 python-single-r1 cmake-utils

DESCRIPTION="MySQL Workbench is a unified visual tool for database architects, developers, and DBAs."
HOMEPAGE="https://www.mysql.com/products/workbench/"
SRC_URI="https://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar"
AUTHOR="mysql"

EGIT_REPO_URI="https://github.com/${AUTHOR}/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug doc +gnome-keyring +proj"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# from CMakeLists.txt
#find_package(PkgConfig REQUIRED)
#find_package(Java QUIET)
#find_package(X11 REQUIRED)
#find_package(Threads REQUIRED)
#find_package(SWIG REQUIRED)
#find_package(ANTLR4 REQUIRED)
#find_package(PythonLibs 3.7 REQUIRED)
#find_package(MySQL 5.6.0 REQUIRED)
#find_package(LibXml2 REQUIRED)
#find_package(OpenGL REQUIRED)
#find_package(MySQLCppConn 1.1.8 REQUIRED)
#find_package(VSqlite REQUIRED)
#find_package(GDAL REQUIRED)
#find_package(Boost REQUIRED)
#find_package(LibSSH 0.8.5 REQUIRED)
#find_package(OpenSSL REQUIRED)
#find_package(Rapidjson 1.1.0 REQUIRED)
#  find_package(IODBC)
#  find_package(UNIXODBC)
#pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
#pkg_check_modules(GTKMM REQUIRED gtkmm-3.0)
#pkg_check_modules(GTHREAD REQUIRED gthread-2.0)
#pkg_check_modules(GMODULE REQUIRED gmodule-2.0)
#pkg_check_modules(GLIB REQUIRED glib-2.0>=2.30)
#pkg_check_modules(PCRE REQUIRED libpcre libpcrecpp)
#pkg_check_modules(CAIRO REQUIRED cairo>=1.5.12)
#pkg_check_modules(UUID REQUIRED uuid)
#pkg_check_modules(LIBZIP REQUIRED libzip)
#  pkg_check_modules(LIBSECRET REQUIRED libsecret-1)
CDEPEND="${PYTHON_DEPS}
	>=dev-libs/libxml2-2.7.4:2
	virtual/opengl
	>=dev-db/mysql-connector-c++-1.1.8
	=dev-db/mysql-connector-c++-1*
	dev-db/vsqlite++
	>=sci-libs/gdal-1.11.1-r1
	>=dev-libs/boost-1.55.0[nls]
	>=net-libs/libssh-0.8.5[server]
	>=dev-libs/openssl-1.1.1
	>=dev-libs/rapidjson-1.1.0
	|| ( dev-db/libiodbc dev-db/unixODBC )

	>=x11-libs/gtk+-3.21.5:3
	>=dev-cpp/gtkmm-3.24.0:3.0
	>=sys-libs/glibc-2.29
	>=dev-libs/glib-2.30.0:2
	>=dev-cpp/glibmm-2.54:2
	>=dev-libs/libpcre-7.7:3[cxx]
	>=x11-libs/cairo-1.5.12[glib,svg]
	|| ( sys-libs/e2fsprogs-libs dev-libs/ossp-uuid )
	>=dev-libs/libzip-0.10:0/5

	gnome-keyring? ( gnome-base/gnome-keyring >=app-crypt/libsecret-0.7 )
	proj? ( sci-libs/proj )

	>=dev-libs/atk-1.12.4
	>=dev-cpp/atkmm-2.24.0
	>=x11-libs/gdk-pixbuf-2.22.0
	>=app-crypt/mit-krb5-1.17
	>=x11-libs/pango-1.18.0
	>=media-libs/libpng-1.6.2-r1
	>=dev-libs/libsigc++-2.8.0:2
	>=dev-db/sqlite-2.16
	>=sys-libs/ncurses-6[tinfo]
	>=sys-libs/zlib-1.2.0:0/1
	dev-cpp/antlr-cpp:4
"

RDEPEND="${CDEPEND}
	app-admin/sudo
	>=sys-apps/net-tools-1.60_p20120127084908"

DEPEND="${CDEPEND}
	virtual/pkgconfig
	virtual/jre
	dev-lang/swig
"

src_prepare() {
	cp build/mysql-workbench-community.mime           build/mysql-workbench-commercial.mime
	cp build/mysql-workbench-community.sharedmimeinfo build/mysql-workbench-commercial.sharedmimeinfo

	cmake-utils_src_prepare
}

src_configure() {
	append-cxxflags -std=c++11 -lssh

	local mycmakeargs=(
		-DWITH_ANTLR_JAR="${DISTDIR}/antlr-${ANTLR_VERSION}-complete.jar"
		-DLIB_INSTALL_DIR="/usr/$(get_libdir)"
		-DIODBC_INCLUDE_PATH="/usr/include/iodbc"
		-DPYTHON_INCLUDE_DIR="$(python_get_includedir)"
		-DPYTHON_LIBRARY="$(python_get_library_path)"
		-DMySQL_CONFIG_PATH="/usr/bin/mysql_config"
	)
	if has_version dev-db/libiodbc ; then
		mycmakeargs+=( -DIODBC_CONFIG_PATH="/usr/bin/iodbc-config" )
	fi

	cmake-utils_src_configure
}
