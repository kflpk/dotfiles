#!/bin/zsh

# XDG env variables

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# zsh config dotfiles

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION # zsh autocomplete cache
export ZDOTDIR="$HOME/.config/zsh" # zsh dotfiles location
export HISTFILE="$XDG_DATA_HOME"/zsh/history # zsh history file

#adb variables, shamelessly copied from archwiki, not sure if it's gonna be useful ever

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android

