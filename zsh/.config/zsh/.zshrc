ENABLE_CORRECTION="true"
export EDITOR=nvim
setopt appendhistory autocd beep extendedglob nomatch notify

HISTFILE=~/.cache/zsh/history
if [[ ! -f $HISTFILE ]] then # Creates history file if it doesn't exist
	mkdir -p ~/.cache/zsh
	touch "$HISTFILE"
fi
HISTSIZE=100000000
SAVEHIST=100000000

source ~/.config/aliases
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

rm ~/.lesshst 2>/dev/null

#KEYBINDS
#bindkey ';5D' backward-word
#bindkey ';5C' forward-word
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^R' history-incremental-search-backward

function setprompt() {
	COLORFILE="$ZDOTDIR/custom_color.zsh"

	if [ -e "$COLORFILE" ]; then
		source "$COLORFILE"
	else
		PCLR="yellow"
		PACC="cyan"
	fi

	if git status > /dev/null 2>&1                                                                                                                                                                                     0.004s
	then
		BRANCH="%f%B%F{$PCLR}(%f%F{$PACC}$(git status | awk '{print $NF}' | sed 1q)%f%F{$PCLR})"
	else
		BRANCH=""
	fi

	PROMPT="%B%F{$PCLR}[%f%F{$PACC}%?%f%F{$PCLR}][%n%f %F{$PACC}%1~%f%F{$PCLR}]$BRANCH%#%f%F{$PACC}:%f%b "

	if (( ${+VIRTUAL_ENV} )); then
		PROMPT="%B%F{$PCLR}(%f%F{$PACC}$(basename "$VIRTUAL_ENV")%f%F{$PCLR})$PROMPT"
		
	fi
}

function preexec() {
	PROGRAMNAME="$1"
	timer=$(($(date +%s%0N)/1000000))
}

function precmd() {


	if [ $timer ]; then
		now=$(($(date +%s%0N)/1000000))
		elapsed=$(($now-$timer))
		seconds=$(($elapsed / 1000))
		miliseconds=$(($elapsed - $seconds * 1000))
		miliseconds=$(printf "%03d" $miliseconds)
	if [ $seconds -ge 60 ]; then
		minutes=$(($seconds / 60))
		seconds=$(($seconds - $minutes * 60))

		if [ $minutes -ge 60 ]; then
			hours=$(($minutes / 60))
			minutes=$(($minutes - $hours * 60))
			export RPROMPT="%F{cyan}${hours}h ${minutes}m ${seconds}.${miliseconds}s %{$reset_color%}"
			TIMESTR="${hours}h ${minutes}m ${seconds}.${miliseconds}s"
		else
			export RPROMPT="%F{cyan}${minutes}m ${seconds}.${miliseconds}s %{$reset_color%}"
			TIMESTR="${minutes}m ${seconds}.${miliseconds}s"
		fi
		notify-send "$PROGRAMNAME finished after $TIMESTR"
	else
		export RPROMPT="%F{cyan}${seconds}.${miliseconds}s %{$reset_color%}"
	fi
	unset timer
	fi

	setprompt
}
function gen() {
head -n 4096 /dev/urandom | strings | grep -o "[[:alnum:]]" | head -n $1 | tr -d "\n"
}

tmux
clear
setprompt

function waitForChange(){
      FILE=$1
      CMD=$2
      OLD=$(ls -la | grep $FILE | awk '{ print $8 }')
      NEW=""
 
      eval "$CMD"
      while [ True ]; do
          sleep 1
          NEW=$(ls -la | grep $FILE | awk '{ print $8 }')
          #echo Old: $OLD
          #echo New: $NEW
          if [ $OLD != $NEW ]; then
              OLD=$NEW
              eval "$CMD"
          fi
     done
 }

export TERM='xterm-256color'
