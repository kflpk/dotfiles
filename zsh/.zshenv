#!/bin/zsh

# XDG env variables

export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# $HOME cleanup
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export WINEPREFIX="$XDG_DATA_HOME"/wine
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK2RC_FILE="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK2RC_KDE4=/usr/share/kde-settings/kde-profile/default/gtkrc-2.0-kde4
export GTK2RC_KDE4_HOME=${XDG_CONFIG_HOME}/gtk-2.0-kde4/.gtkrc-2.0-kde4

export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# ZSH configuration
#
#zsh config dotfiles

export ZDOTDIR="$HOME/.config/zsh" # zsh dotfiles location
#
#export HISTFILE="$XDG_DATA_HOME"/zsh/history # zsh history file

# adb variables, shamelessly copied from archwiki, not sure if it's gonna be useful ever

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"

# Path
#export PATH="$CARGO_HOME/bin"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/node_modules/.bin"
export PATH="$PATH:$HOME/.config/emacs/bin/"

if [ -e $CARGO_HOME/env ]; then
	source "$CARG_HOME//env" 2>/dev/null
fi

# Other stuff
export TERM='xterm-256color'
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # disables dotnet telemetry

