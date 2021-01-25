ENABLE_CORRECTION="true"
export EDITOR=nvim
setopt appendhistory autocd beep extendedglob nomatch notify
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000

source ~/.config/aliases
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/opt/lampp
export PATH=$PATH:/snap/bin
export PATH=$PATH:~/programs/bin
export PATH="$PATH:/home/kacper/programs/bin/eagle"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/home/kacper/.local/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH
#PROMPT="%B%F{yellow}[%f%F{cyan}%?%f%F{yellow}][%n%f %F{cyan}%1~%f%F{yellow}]%#%f%F{cyan}:%f%b "
~/.scripts/bible-pi

case $(hostname) in 
    rpi4)
        PROMPT="%B%F{red}[%f%F{cyan}%?%f%F{red}][%n%f %F{cyan}%1~%f%F{red}]%#%f%F{cyan}:%f%b "
    ;;
    pop-os)
        PROMPT="%B%F{yellow}[%f%F{cyan}%?%f%F{yellow}][%n%f %F{cyan}%1~%f%F{yellow}]%#%f%F{cyan}:%f%b "
    ;;
    jerusalem)
        PROMPT="%B%F{green}[%f%F{cyan}%?%f%F{green}][%n%f %F{cyan}%1~%f%F{green}]%#%f%F{cyan}:%f%b "
    ;;
    alpine)
        PROMPT="%B%F{blue}[%f%F{cyan}%?%f%F{blue}][%n%f %F{cyan}%1~%f%F{blue}]%#%f%F{cyan}:%f%b "
    ;;
    *)
    ;;
esac
