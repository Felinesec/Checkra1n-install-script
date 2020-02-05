#!/bin/bash
#   startup.sh
#   Bash shell
#   Version 0.1 "Andromeda"
#
#   Created by Francesco Masala & Jack Rendor
#   Mozilla Public License
#
VERSION="0.1 (Andromeda)"
# Root checker
function am_i_root(){
	if [[ $EUID -ne 0 ]]; then
		echo " [!] No root permission detected [!]"
		echo " [i] To run this command, you should be root"
		echo ""
		exit
	fi
}
# Usage
function usage(){
	echo " [i] Usage: "
	echo "       --help              Display this page"
	echo "       --install           Install the checkra1n apt + repo"
	echo "       --update            Update the checkra1n package"
  echo "       --jailbreak         Init bot enviroment"
	echo ""
}
# Name and intro of the Script
sleep 1
echo "[+] Checkra1n linux script [+]"
echo "Script coded by Francesco Masala (https://github.com/francescomasala)"
sleep 1
if [ -z "$1" ]; then
	echo " [!] No argument supplied. [!]"
	usage
	exit 1
elif [ "$1" = "--help" ]; then
	usage
	exit 0
elif [ "$1" = "--version" ]; then
	echo "Version $VERSION"
	echo ""
	exit 0
elif [ "$1" = "--start" ]; then
	echo "[+] Checkra1n install script [+]"
	am_i_root
	echo "[!] Using root access [!]"
  echo "deb https://assets.checkra.in/debian /" | sudo tee -a /etc/apt/sources.list
  echo" [+] All done! [+]"
  exit 0
elif [ "$1" = "--update" ]; then
	echo "[!] Using root access [!]"
  sudo apt update
  sudo apt --only-upgrade install checkra1n
  echo" [+] All done! [+]"
	exit 0
elif [ "$1" = "--init" ]; then
  echo " [!] Currently W.I.P. [!]
  exit 0
fi
