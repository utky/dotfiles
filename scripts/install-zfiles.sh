#!/bin/zsh

ZPREZTO="${ZDOTDIR:-$HOME}/.zprezto"

if [ ! -d "${ZPREZTO}" ]; then
  git clone --recursive git@github.com:utky/prezto.git ${ZPREZTO}
fi

setopt EXTENDED_GLOB
for rcfile in ${ZPREZTO}/runcoms/^README.md(.N); do
  if [ ! -f "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]; then
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  fi
done
