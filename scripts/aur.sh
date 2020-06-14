#!/usr/bin/env bash
source "$DOTS_SOURCE/base/bash/environment"

if ! hash yay 2>/dev/null; then
  if [[ -d XDG_CACHE_HOME/yay/yay ]]; then
    rm -rf $XDG_CACHE_HOME/yay/yay
  fi
  echo -e "\\033[0;32m==>\\033[0m dependencies/yay"
  echo -e "\\033[0;32m***\\033[0m Installing yay package manager"
  git clone https://aur.archlinux.org/yay.git $XDG_CACHE_HOME/yay/yay
  (cd $XDG_CACHE_HOME/yay/yay/ && makepkg -si --noconfirm)
fi
