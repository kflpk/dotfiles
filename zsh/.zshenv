#!/bin/zsh

# XDG env variables

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# ZSH configuration
#
#zsh config dotfiles
#compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION # zsh autocomplete cache
export ZDOTDIR="$HOME/.config/zsh" # zsh dotfiles location
#export HISTFILE="$XDG_DATA_HOME"/zsh/history # zsh history file

# adb variables, shamelessly copied from archwiki, not sure if it's gonna be useful ever

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"

# Path
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/opt/lampp"
export PATH="$PATH:$HOME/node_modules/.bin"

if [ -e $HOME/.cargo/env ]; then
	source "$HOME/.cargo/env" 2>/dev/null
fi

# Other stuff
export TERM='xterm-256color'
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # disables dotnet telemetry
. "$HOME/.cargo/env"
