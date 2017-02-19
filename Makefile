.PHONY: build archlinux X11 dots prezto vundle nix xmonad install_package save_package

PKGLIST := pacman-pkgs.txt
SCRIPTS := ${CURDIR}/scripts
NIX := ${CURDIR}/nix
XMONAD := ${CURDIR}/xmonad
XMONADDIR := ${HOME}/.xmonad
NIX_URL := https://nixos.org/nix/install
VUNDLE_URL := https://github.com/gmarik/Vundle.vim.git
VIM_BUNDLE_PATH := ${HOME}/.vim/bundle
LINK := ln -s
ETC := ${CURDIR}/etc
XCONF := /X11/xorg.conf.d
FONTCONFIG := ${HOME}/.config/fontconfig
FONTDIR := ${HOME}/.local/share/fonts

build: archlinux dots xmonad nix vundle

archlinux: install_package X11 

install_package:
	$(shell sudo pacman -S - < ${PKGLIST})

save_package:
	$(pacman -Qqe > ${PKGLIST})

X11:
	sudo ${LINK} ${ETC}/locale.conf /etc/locale.conf
	sudo ${LINK} ${ETC}/ntp.conf /etc/ntp.conf
	sudo ${LINK} ${ETC}${XCONF}/10-keybord.conf /etc${XCONF}/10-keybord.conf
	sudo ${LINK} ${ETC}${XCONF}/20-thinkpad.conf /etc${XCONF}/20-thinkpad.conf

dots:
	${SCRIPTS}/install-dots.sh install


prezto:
	${SCRIPTS}/install-zfiles.sh

vundle:
	mkdir -p ${VIM_BUNDLE_PATH}
	git clone ${VUNDLE_URL} ${VIM_BUNDLE_PATH}/Vundle.vim

nix: prezto
	$(shell sh -c 'curl ${NIX_URL} | sh')
	mkdir -p ${NIX}
	${LINK} ${NIX}/config.nix ${HOME}/.nixpkgs/config.nix

xmonad:
	mkdir -p ${XMONADDIR}
	${LINK} ${XMONAD}/xmonad.hs ${XMONADDIR}/xmonad.hs
	${LINK} ${XMONAD}/.xmobarrc ${XMONADDIR}/.xmobarrc

font:
	mkdir -p ${FONTCONFIG}
	mkdir -p ${FONTDIR}
	${LINK} ${CURDIR}/font/fonts.conf ${FONTCONFIG}/fonts.conf
