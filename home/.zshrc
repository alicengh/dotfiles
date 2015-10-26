###
#   Maintainer: alicengh
#   Last modified: 10-26-15
###

##############################
# Preferences
export LANG=en_US.UTF-8

# zsh editor config
bindkey -v #vim-mode
# bindkey -M viins 'jj' vi-cmd-mode

autoload -U compinit promptinit

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
#setopt extended_glob
setopt hist_ignore_all_dups


# This config link online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help


fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# My Zshell design
autoload colors
colors
PROMPT="%{${fg[blue]}%}%m: %n%(!.#.%% )%{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[green]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%./]%{${reset_color}%}"

# Recompile
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# setting for size of history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
PATH=${PATH}:~/bin

HISTTIMEFORMAT="[%M/%D/%Y %H:%M:%S]"

# Move key bind
zmodload zsh/complist
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

# Loading my settings
[ -f ~/.zsh.d/zshrc.mac ] && source ~/.zsh.d/zshrc.mac
[ -f ~/.zsh.d/zshrc.encoding ] && source ~/.zsh.d/zshrc.encoding
[ -f ~/.zsh.d/zshrc.completion ] && source ~/.zsh.d/zshrc.completion

# Load kvm
[ -s "/Users/hijiri/.k/kvm/kvm.sh" ] && . "/Users/hijiri/.k/kvm/kvm.sh" 

# Go Lang.
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/.code/go-local
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi 
# export PATH=$PATH:/usr/local/opt/go/libexec/bin



##############################
# Aliases
alias od='od -txlz -Ax -v'
alias grep='grep -E --color=auto'

alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

# alias l='ls -lF | grep /;ls -lF | grep -v / | tail +2'
alias l='ls -AF'
alias ll='ls -l'
alias la='ls -a'
alias lx='ll -a'

alias mkdir='mkdir -p'
 
alias ...='cd ../../'
alias ....='cd ../../../'
 

# Applications
alias vi='vim -u NONE'
alias python='python3'
alias g++='g++ --std=c++14'
alias llvm-g++='llvm-g++ --std=c++14'
alias clang++='clang++ --std=c++1y --stdlib=libc++'

# alias htop='sudo htop'
alias _cleanup='sudo purge'


# Enable alias after 'sudo' command
alias sudo='sudo '

# Global Aliases
alias -g L='| less'
alias -g G='| grep'


###
#   Copy of stdout to clip-board
###
if [ which pbcopy > /dev/null 2>&1 ]; then
    # Mac
    alias -g C='| pbcopy'
elif [ which xsel > /dev/null 2>&1 ]; then
    # Linux
    alias -g C='| xsel --input --clipboard'
fi



###
#   Other Operating Systems
###
case ${OSTYPE} in
    darwin*)
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        alias ls='ls -F --color=auto'
        ;;
esac



###
#   Display vim-mode
###
# function zle-line-init zle-keymap-select {
#   VIM_NORMAL="%K{208}%F{black}%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}%k%f"
#   VIM_INSERT="%K{075}%F{black}%k%f%K{208}%F{white} % INSERT %k%f%K{black}%F{075}%k%f" 
#   RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
#   RPS2=$RPS1
#   zle reset-prompt
# }

### END: .zshrc ###
