#!/usr/bin/env bash

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
[[ "x${OS}" = "xlinux" ]] || [[ "x${OS}" = "xdarwin" ]] || {
  echo "Unsupported OS: ${OS}"
  exit 1
}

SRC_DIR=$(dirname $(realpath $0))

[[ -L ${SRC_DIR} ]] && SRC_DIR=$(readlink ${SRC_DIR})

if [[ "x${TIMESTAMP}" == "x" ]]; then
  TIMESTAMP=$(date +%Y%m%d_%H%M%S)
fi
echo "Installation timestamp=${TIMESTAMP}"

# install latest plug.vim to ./autoload/
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
[[ -d ${SRC_DIR}/autoload ]] || mkdir -p ${SRC_DIR}/autoload
wget -q -O ${SRC_DIR}/autoload/$(basename ${VIM_PLUG_URL}) ${VIM_PLUG_URL}

# Create link to ~/.vim
if [[ -L ${HOME}/.vim ]]; then
  unlink ${HOME}/.vim
elif [[ -d ${HOME}/.vim ]] && [[ "${HOME}/.vim" ]] ; then
  echo "Backup old ${HOME}/.vim to ${HOME}/.vim_bk_${TIMESTAMP}"
  mv ${HOME}/.vim ${HOME}/.vim_bk_${TIMESTAMP}
fi

if [[ -L ${HOME}/.vimrc ]]; then
  unlink ${HOME}/.vimrc
elif [[ -e ${HOME}/.vimrc ]]; then
  echo "Backup old ${HOME}/.vimrc to ${HOME}/.vimrc_bk_${TIMESTAMP}"
  mv ${HOME}/.vimrc ${HOME}/.vimrc_bk_${TIMESTAMP}
fi

# Do installation
ln -s ${SRC_DIR} ${HOME}/.vim
ln -s ${HOME}/.vim/_vimrc ${HOME}/.vimrc

ls -lah ${HOME} | grep vim

# do plug-in installation
# using a temporary
vim -u ${SRC_DIR}/plug_deps.vim \
    -c 'PlugInstall' \
    -c 'q!' \
    -c 'q!'

# install CoC components
vim -c 'CocInstall coc-go coc-json coc-tsserver coc-css coc-clangd coc-pyright coc-html coc-lua coc-rust-analyzer' \
    -c 'q!' \
    -c 'CocUpdate' \
    -c 'q!' \
    -c 'q!'
