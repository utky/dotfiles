#!/bin/zsh
ANTIGEN_DIR="${HOME}/.local/share/antigen"
ANTIGEN_PATH="${ANTIGEN_DIR}/antigen.zsh"

if [ ! -d "${ANTIGEN_DIR}" ]; then
  mkdir -p "${ANTIGEN_DIR}"
fi

if [ ! -f "${ANTIGEN_PATH}" ]; then
  curl -L git.io/antigen > "${ANTIGEN_PATH}"
fi
