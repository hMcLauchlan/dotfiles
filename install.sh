#!/bin/sh

# shamelessly taken (mostly) from osandov

cd "$(dirname "$0")"

if [ "$(pwd)" != ~/dotfiles ]; then
	echo "This script depends on things being in ~/dotfiles" >&2
	exit 1
fi

usage () {
	USAGE_STRING="Usage: $0 [-avdgsw]
$0 -h

Optional:
	-a	install all
	-v	install vim
	-d	install dircolors
	-g	install git
	-s	install shell (bash)
	-w	install wm (i3)
	-b	install bin

By default, existing configs will be overwritten. Be careful.

Misc:
-h	display this message and exit"

	case "$1" in 
		out)
			echo "$USAGE_STRING"
			exit 0
			;;
		err)
			echo "$USAGE_STRING" >&2
			exit 1
			;;
	esac
}

if [ $# -eq 0 ]; then
	usage "err"
fi

while getopts "avdgswb" OPT; do
	case "$OPT" in
		a)
			DO_ALL=1
			;;
		v)
			DO_VIM=1
			;;
		d)
			DO_DIRCOLORS=1
			;;
		g)
			DO_GIT=1
			;;
		s)
			DO_SHELL=1
			;;
		w)
			DO_WM=1
			;;
		b)
			DO_BIN=1
			;;
		h)
			usage "out"
			;;
		*)
			usage "err"
			;;
	esac
done

install_file() {
	ln -Tfns "$1" "$2"
}

do_install () {
	! [ -z "$DO_ALL" -a -z "$1" ]
}

if do_install "$DO_VIM"; then
	install_file ~/dotfiles/vimrc ~/.vimrc
	install_file ~/dotfiles/vim/colors ~/.vim/colors
	install_file ~/dotfiles/vim/plugin ~/.vim/plugin
	install_file ~/dotfiles/vim/after ~/.vim/after
fi

if do_install "$DO_SHELL"; then
	install_file ~/dotfiles/bashrc ~/.bashrc
fi

if do_install "$DO_DIRCOLORS"; then
	install_file ~/dotfiles/dircolors ~/.dircolors
fi

if do_install "$DO_GIT"; then
	install_file ~/dotfiles/gitconfig ~/.gitconfig
fi

if do_install "$DO_WM"; then
	mkdir -p ~/.config/i3
	install_file ~/dotfiles/desktop_config ~/.config/i3/config
	if [ -d /proc/acpi/battery/BAT* ]; then
		install_file ~/dotfiles/config ~/.config/i3/config
	fi
	install_file ~/dotfiles/wm/xinitrc ~/.xinitrc
fi

if do_install "$DO_BIN"; then
	install_file ~/dotfiles/bin ~/bin
fi
