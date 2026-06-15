#!/usr/bin/env bash
#

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
[[ "${OS}" = "linux" || "${OS}" = "darwin" ]] || {
  echo "Unsupported OS: ${OS}"
  exit 1
}

if [[ "${OS}" = "darwin" ]]; then
  brew install llvm fzf node python
  pip3 install cmake-language-server
  npm install -g bash-language-server
fi

