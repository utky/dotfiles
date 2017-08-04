.PHONY: build archlinux X11 dots prezto vundle nix xmonad lein install_package save_package stack standard_dirs wallpapers

PKGLIST := pacman-pkgs.txt
SCRIPTS := ${CURDIR}/scripts
NIX := ${CURDIR}/nix
XMONAD := ${CURDIR}/xmonad
XMONADDIR := ${HOME}/.xmonad
LEIN := ${CURDIR}/lein
LEINDIR := ${HOMST}/.lein
NIX_URL := https://nixos.org/nix/install
VUNDLE_URL := https://github.com/gmarik/Vundle.vim.git
VIM_BUNDLE_PATH := ${HOME}/.vim/bundle
LINK := ln -sf
ETC := ${CURDIR}/etc
XCONF := /X11/xorg.conf.d
FONTCONFIG := ${HOME}/.config/fontconfig
FONTDIR := ${HOME}/.local/share/fonts
STACKDIR := ${HOME}/.stack

build: archlinux dots font xmonad lein nix vundle stack standard_dirs wallpapers

archlinux: install_package X11 

install_package:
	$(shell sudo pacman -S - < ${PKGLIST})

save_package:
	$(shell pacman -Qqe > ${PKGLIST})

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

lein:
	mkdir -p ${LEINDIR}
	${LINK} ${LEIN}/project.clj ${LEINDIR}/project.clj

font:
	mkdir -p ${FONTCONFIG}
	${LINK} ${CURDIR}/font/fonts.conf ${FONTCONFIG}/fonts.conf
	mkdir -p ${FONTDIR}
	tar xzf ${CURDIR} fonts.tar.gz -C ${FONTDIR}

stack:
	mkdir -p ${STACKDIR}
	${LINK} ${CURDIR}/stack/config.yaml ${STACKDIR}/config.yaml

standard_dirs:
	mkdir -p ${HOME}/downloads
	mkdir -p ${HOME}/pictures/wallpapers
	mkdir -p ${HOME}/documents
	mkdir -p ${HOME}/videos

wallpapers:
	tar xzf ${CURDIR} wallpapers.tar.gz -C ${HOME}/pictures/wallpapers
