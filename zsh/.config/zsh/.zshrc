# main zsh configuration

zalias="$ZDOTDIR/zalias"
zprompt="$ZDOTDIR/zprompt"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set options
setopt appendhistory
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify

setopt nobeep

# key bindings
bindkey -v

bindkey -M viins 'jj' vi-cmd-mode

# completions
zstyle :compinstall filename '/home/codevision/.zshrc'

autoload -Uz compinit
compinit

# prompt
[[ -f "$zprompt" ]] && source "$zprompt"
