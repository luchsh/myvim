#!/usr/bin/env bash
#

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
[[ "x${OS}" = "xlinux" ]] || [[ "x${OS}" = "xdarwin" ]] || {
  echo "Unsupported OS: ${OS}"
  exit 1
}

if [[ "x${OS}" = "xdarwin" ]]; then
  brew install llvm fzf node python
  pip3 install cmake-language-server
  npm install -g bash-language-server
fi

