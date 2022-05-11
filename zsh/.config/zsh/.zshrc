ENABLE_CORRECTION="true"
export EDITOR=nvim
setopt appendhistory autocd beep extendedglob nomatch notify
HISTFILE=~/.cache/zsh/history
HISTSIZE=100000000
SAVEHIST=100000000

source ~/.config/aliases
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/opt/lampp"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:~/programs/bin"
export PATH="$PATH:/home/kacper/programs/bin/eagle"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/home/kacper/.local/bin"
export PATH="$PATH:$HOME/bin:/usr/local/bin"
#PROMPT="%B%F{yellow}[%f%F{cyan}%?%f%F{yellow}][%n%f %F{cyan}%1~%f%F{yellow}]%#%f%F{cyan}:%f%b "

rm ~/.lesshst 2>/dev/null

#KEYBINDS
#bindkey ';5D' backward-word
#bindkey ';5C' forward-word

function setprompt() {

	case $(cat /etc/hostname) in
		marcinek)
			PCLR="red"
			#PROMPT="%B%F{red}[%f%F{cyan}%?%f%F{red}][%n%f %F{cyan}%1~%f%F{red}]%#%f%F{cyan}:%f%b "
		;;
		jerusalem)
			PCLR="green"
			#PROMPT="%B%F{green}[%f%F{cyan}%?%f%F{green}][%n%f %F{cyan}%1~%f%F{green}]%#%f%F{cyan}:%f%b "
		;;
		alpine)
			PCLR="blue"
			#PROMPT="%B%F{blue}[%f%F{cyan}%?%f%F{blue}][%n%f %F{cyan}%1~%f%F{blue}]%#%f%F{cyan}:%f%b "
		;;
		*)
			PCLR="yellow"
			#PROMPT="%B%F{yellow}[%f%F{cyan}%?%f%F{yellow}][%n%f %F{cyan}%1~%f%F{yellow}]%#%f%F{cyan}:%f%b "
		;;
	esac

	if git status > /dev/null 2>&1                                                                                                                                                                                     0.004s
	then
		BRANCH="%f%B%F{$PCLR}(%f%F{cyan}$(git status | awk '{print $NF}' | sed 1q)%f%F{$PCLR})"
	else
		BRANCH=""
	fi

	PROMPT="%B%F{$PCLR}[%f%F{cyan}%?%f%F{$PCLR}][%n%f %F{cyan}%1~%f%F{$PCLR}]$BRANCH%#%f%F{cyan}:%f%b "
}



[ "$TTY" = "/dev/tty1" ] && startx

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

function picka() {
	if [ "$1" = "mrozona" ]; then
		countdown 12m && mpv ~/Muzyka/arabic.mp3
	else if [ "$1" = "donatello" ]; then
		countdown 6m && mpv ~/Muzyka/arabic.mp3
	fi
	fi
}

function sex() {
	countdown 12s && mpv ~/Muzyka/arabic.mp3
}

setprompt
