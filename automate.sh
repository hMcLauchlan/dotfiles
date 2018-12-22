#!/bin/sh

# set -e

cd "$(dirname "%0")"

if [ "$(pwd)" != ~/dotfiles ]; then
	echo "This script depends on things being in ~/dotfiles" >&2
	exit 1
fi

sudo pacman -Sy

sudo pacman --noconfirm -S --needed base-devel

sudo pacman -S expac yajl git --noconfirm --needed

if ! pacman -Q package-query >/dev/null 2>&1; then
	cd /tmp
	curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
	tar -xvf package-query.tar.gz
	cd package-query
	makepkg -s
	sudo pacman --noconfirm -U package-query-*.pkg.tar.xz
	rm -rf /tmp/package-query /tmp/package-query.tar.gz
fi

if ! pacman -Q yaourt >/dev/null 2>&1; then
	cd /tmp
	curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
	tar -xvf yaourt.tar.gz
	cd yaourt
	makepkg -s
	sudo pacman --noconfirm -U yaourt-*.pkg.tar.xz
	rm -rf /tmp/yaourt /tmp/yaourt.tar.gz
fi

PACKAGES=(
	adobe-source-han-sans-jp-fonts
	adobe-source-han-sans-cn-fonts
	adobe-source-han-sans-tw-fonts
	alsa-lib
	bc
	dmenu
	evince
	feh
	google-chrome
	librsvg # redshift
	openssh
	perl-authen-sasl # send-email
	perl-net-smtp-ssl # send-email
	perl-mime-tools # send-email
	pulseaudio
	python
	python-gobject # redshift
	python-xdg # redshift
	redshift
	ttf-dejavu
	xclip
	xorg-server
	xorg-xrandr
	xterm
	terminator
	vim
)

yaourt --noconfirm -S --needed "${PACKAGES[@]}"

#hackiness for feh/i3
echo "feh --bg-fill \"\$WP\" 2> /dev/null" >> ~/.config/variety/scripts/set_wallpaper

~/dotfiles/install.sh -a
