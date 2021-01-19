ENABLE_CORRECTION="true"
export EDITOR=nvim


#ALIASES
#alias sdn="shutdown now"
#alias build="g++ ./main.cpp -o executable"
#alias run="./executable"
#alias ls=="exa"
#alias ll="exa -lah"
#alias md="mkdir -v -p"
#alias zshrc="$EDITOR ~/.config/zsh/.zshrc"
#alias yt="youtube-dl --add-metadata -ic" 
#alias ytaudio="youtube-dl --add-metadata -xic"
#alias pi="ssh -X pi@192.168.1.146"
#alias pacman="pacman --color always"
#alias tmux="tmux -2"
#alias si="sudo snap install"
#alias ai="sudo apt install" 
#alias update="yes | sudo apt update  && yes | sudo apt upgrade"
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
