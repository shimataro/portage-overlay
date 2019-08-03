# portage-overlay

personal portage repository for [Gentoo Linux](http://www.gentoo.org/)

## Included packages

| package | name | description | note |
|---------|------|-------------|------|
| `app-crypt/veracrypt` | [VeraCrypt](https://veracrypt.codeplex.com/) | An open source disk encryption tool with strong security for the Paranoid | |
| `app-editor/atom` | [Atom](https://atom.io/) | A hackable text editor for the 21st Century | |
| `app-editor/vscode` | [Visual Studio Code](https://code.visualstudio.com/) | Code Editing. Redefined. | |
| `mate-extra/topmenu-gtk` | [topmenu-gtk](https://git.javispedro.com/cgit/topmenu-gtk.git/about/) | A Gtk+ module and Mate/Xfce panel applets for a global menubar. | |
| `net-im/caprine` | [Caprine](https://sindresorhus.com/caprine/) | Elegant Facebook Messenger desktop app | |
| `www-misc/webtaku` | [webtaku](https://github.com/shimataro/webtaku) | webpage snapshot image generator | |
| `x11-misc/plank` | [Plank](https://launchpad.net/plank) | The dock for elementary Pantheon, stupidly simple | |
| `x11-misc/vala-panel-appmenu` | [vala-panel-appmenu](https://github.com/rilian-la-te/vala-panel-appmenu) | Global Menu for Vala Panel (and xfce4-panel and mate-panel) | |
| `x11-themes/flat-remix` | [Flat Remix](https://github.com/daniruiz/flat-remix) | A flat theme with transparent elements | |
| `x11-themes/flat-remix-gnome` | [Flat Remix GNOME](https://github.com/daniruiz/flat-remix-gnome) | A flat theme with transparent elements | |
| `x11-themes/flat-remix-gtk` | [Flat Remix GTK](https://github.com/daniruiz/flat-remix-gtk) | A flat theme with transparent elements | |
| `x11-themes/mbuntu-plymouth` | [MBuntu-plymouth](https://launchpad.net/~noobslab/+archive/ubuntu/themes) | MBuntu plymouth theme | OSX-like boot splash theme |
| `x11-themes/mbuntu-y-icons` | [MBuntu-Y-icons](https://launchpad.net/~noobslab/+archive/ubuntu/themes) | MBuntu Y icons & cursors themes | OSX Yosemite-like icons & cursors |
| `x11-themes/mbuntu-y-themes` | [MBuntu-Y-themes](https://launchpad.net/~noobslab/+archive/ubuntu/themes) | MBuntu Y themes | OSX Yosemite-like themes |
| `x11-themes/mbuntu-themes` | [MBuntu-themes](https://launchpad.net/~noobslab/+archive/ubuntu/themes) | MBuntu themes | OSX-like themes |
| `x11-themes/OSX-MATE` | [OSX-MATE](https://github.com/rohithmadhavan/OSX-MATE) | OSX-MATE theme - Based on Radiant-MATE | requires `x11-themes/mate-icon-theme-faenza` |

## How to use

1. Delete below code in `/etc/portage/make.conf`

    ```conf
    PORTDIR="..."
    ```

1. Copy [`shimataro.conf`](./shimataro.conf) to `/etc/portage/repos.conf/`
(create if directory doesn't exist)

## How to build manifest file

```bash
ebuild path/to/ebuild digest
```

## Project page

<https://github.com/shimataro/portage-overlay>
