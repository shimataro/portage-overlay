portage-overlay
===============

original portage repository for [Gentoo Linux](http://www.gentoo.org/)

# Included packages

| package | name | description | note |
|---------|------|-------------|------|
| `app-i18n/ibus` | [iBus](https://github.com/ibus/ibus/wiki) | Intelligent Input Bus for Linux/Unix | version 1.4.x / GitHub version |
| `mate-extra/topmenu-gtk` | [topmenu-gtk](https://git.javispedro.com/cgit/topmenu-gtk.git/about/) | A Gtk+ module and Mate/Xfce panel applets for a global menubar. | |
| `www-misc/webtaku` | [webtaku](https://github.com/shimataro/webtaku) | webpage snapshot image generator | |
| `x11-misc/ktsuss` | [ktsuss](https://github.com/nomius/ktsuss) | Graphical version of su written in C and GTK+ 2 | append `sudo` USE flag |

# How to use

1. Delete below code in `/etc/portage/make.conf`


    PORTDIR="..."

2. Copy `shimataro.conf` to `/etc/portage/repos.conf`
(create if directory doesn't exist)

# How to build manifest file

    $ ebuild path/to/ebuild digest

# Project page

https://github.com/shimataro/portage-overlay
