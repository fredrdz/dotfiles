#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type bws >/dev/null 2>&1 && exit

if [ -f /etc/os-release ]; then
	# Source the OS release file to get distribution information
	. /etc/os-release

	case $ID in
	# fedora/rhel systems; tested on amazon linux 2, fedora 39, and nobara 39
	amzn)
		sudo yum update -y
		sudo yum install -y perl perl-App-cpanminus.noarch
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
		~/.cargo/bin/cargo install bws
		;;
	fedora)
		sudo dnf update -y
		sudo dnf install perl -y
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
		~/.cargo/bin/cargo install bws
		;;
	nobara)
		sudo dnf update rpmfusion-nonfree-release rpmfusion-free-release fedora-repos nobara-repos --refresh && sudo dnf distro-sync --refresh && sudo dnf update --refresh
		sudo dnf install perl -y
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
		~/.cargo/bin/cargo install bws
		;;
	*)
		echo "Unsupported OS: $ID"
		exit 1
		;;
	esac
else
	echo "Unable to detect the operating system."
	exit 1
fi
