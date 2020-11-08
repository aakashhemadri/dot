#!/usr/bin/env bash
if ! hash yay 2>/dev/null; then
  if [[ -d XDG_CACHE_HOME/yay/yay ]]; then
    rm -rf $XDG_CACHE_HOME/yay/yay
  fi
  git clone https://aur.archlinux.org/yay.git $XDG_CACHE_HOME/yay/yay
  (cd $XDG_CACHE_HOME/yay/yay/ && makepkg -si --noconfirm)
fi
