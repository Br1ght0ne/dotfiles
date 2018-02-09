#!/bin/bash
#set -e

SRCDIR=`dirname $0`
NEEDED=`cat $SRCDIR/packages.list`
STOWS=`find $SRCDIR -maxdepth 1 -not -name '_*' -not -name '.*' -type d -printf "%f\n" | sort`

command_exists() {
	type $1 &>/dev/null
	return $?
}

pkg_installed() {
	$HELPER -Q $1 &>/dev/null
	return $?
}

install_trizen() {
	git clone https://aur.archlinux.org/trizen.git
	cd trizen
	makepkg -si
	cd ..
	rm -rf trizen
}

get_aur_helper() {
	if command_exists trizen; then
		HELPER=trizen
	elif command_exists pacaur; then
		HELPER=pacaur
	else
		echo "No supported AUR helper found. Install trizen? [Y/n]: "
		read choice
		case choice in
			n|N)
				exit 2
				;;
			*)
				install_trizen
				HELPER=trizen
				;;
		esac
	fi
}

aur_install_pkg() {
	printf "%s is not installed. Install? [Y/n]: " $1
	read choice
	case "$choice" in
		n|N)
			return 1
			;;
		*)
			$HELPER -S $1 --noconfirm
			return 0
			;;
	esac
}

s() {
	printf 'Stowing %s...\n' $1
	stow -t $HOME $1
}

install_dirs() {
	for p in $NEEDED; do
		if ! pkg_installed $p; then
			if aur_install_pkg $p; then
				s $p
			fi
		else
			s $p
		fi
	done
}

check_stow() {
	if ! pkg_installed stow; then
		if ! aur_install_pkg "stow"; then
			echo "Can't install without stow. Aborting..."
			exit 1
		fi
	else
		return 0
	fi
}

get_aur_helper
check_stow
install_dirs

echo "Done. Happy usage!"
exit 0
