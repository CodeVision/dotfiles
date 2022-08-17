# main zsh configuration

zprompt="$ZDOTDIR/zprompt"
zalias="$ZDOTDIR/zalias"
named_dirs="$ZDOTDIR/named_dirs"

completions="/home/$USER/.local/share/zsh/completions"
hooks="$ZDOTDIR/hooks"

# prompt
[[ -f "$zprompt" ]] && source "$zprompt"

# aliases
[[ -f "$zalias" ]] && source "$zalias"

# Set options
# - history
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_all_dups # don't write duplicates to history file
setopt hist_ignore_space    # don't write commands starting with space to history
setopt hist_no_store        # don't write history commands to history
setopt hist_reduce_blanks   # trim commands before writing history
setopt hist_verify          # recalled history commands don't execute immediately
setopt inc_append_history   # write to history file immediately
setopt extended_history     # write extended history entries

# - directories & paths
DIRSTACKSIZE=16

setopt autocd               # change dirs by typing the path on its own
setopt auto_pushd           # auto push directories onto stack
setopt pushd_silent         # don't print stack on pushes
setopt pushd_ignore_dups    # don't push duplicates onto stack

# - expansion & globbing
setopt csh_null_glob        # don't print error on partial match, only null match
setopt magic_equal_subst    # expand unquoted filenames after equal signs
setopt rc_expand_param      # expand array parameters into multiple arguments
setopt numeric_glob_sort    # sort 'numeric' filenames by number instead of lexico-
                            #  graphically
setopt correct              # enable spelling correction

# setopt extendedglob

# - zle
setopt nobeep

# - scripts & functions
setopt c_bases              # print hexidecimals in C format (0xFF)
# setopt octal_zeroes         # print octals per IEEE standard (077)
                            # (affects 0 prefixed strings such as timestamps)

# TODO:
# - job control
setopt notify
# - input / output

# completions
# TODO: configure and options
autoload -Uz compinit
compinit

setopt list_ambiguous       # show completion list on ambigious input
setopt complete_in_word     # allow completion inside words

zstyle ':completion:::::' completer _expand _complete _approximate _ignored

zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-separator " "
zstyle ':completion:*' auto-description 'specification: %d'

zstyle ':completion:*' ignore-parents parent pwd

zstyle ':completion:*:expand:*' accept-exact continue

zstyle ':completion::*:(cvs-add|less|rm|vi):*' ignore-line true

zstyle ':completion::complete:^rm:*files' ignored-patterns '*?.o' '*?~' '*?.swp'
zstyle ':completion:*:complete:cd:*' ignored-patterns '(*/|)(CVS|SCCS|.git|.hg)'

zstyle ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX + $#SUFFIX) / 4 )) )'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

zstyle ':completion:*:(^approximate):*' matcher-list '' 'm:{a-z}={A-Z}'

zstyle ':completion:*:messages' format %d
zstyle ':completion:*:warnings' format 'No matches'
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:manuals' separate-sections true

zmodload zsh/complist
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# custom function completions
compdef _files mcd

# key bindings
# TODO
KEYTIMEOUT=25
bindkey -v

# insert mode
bindkey -M viins 'jj' vi-cmd-mode

bindkey -M viins '\C-i' complete-word
bindkey -M viins '\eu' undo

bindkey -M viins '^o' push-line-or-edit

# allow editing command line in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins '\ee' edit-command-line

bindkey -M viins ' ' magic-space

bindkey -M viins '\e^M' self-insert-unmeta
bindkey -M viins '\eh' run-help

bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^?' backward-delete-char

# normal mode
bindkey -M vicmd '\eh' run-help

# list scroll
bindkey -M listscroll q send-break
bindkey -M listscroll j accept-line

## load funcs
typeset -U fpath
fpath=( $ZDOTDIR/funcs $fpath )
[[ -n ${fpath[1]}/* ]] && autoload -U ${fpath[1]}/*(:t)

## load named dirs
[[ -r $named_dirs ]] && source $named_dirs

## load completions
[[ -r $completions ]] && for f in $completions/*; do source $f; done

## set path
typeset -U path
path=(~/bin $HOME/.local/share/fnm $PYENV_ROOT/bin $CARGO_HOME/bin /usr/local/heroku/bin /opt/cuda/bin $path)

# external program configs
eval $(dircolors -b)

# keychain
source "$ZDOTDIR/programs/keychain.sh" $(cat ~/config/settings/.current-profile)

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FNM_DIR="$HOME/.local/share/fnm"
if [ -s "$FNM_DIR/fnm" ]; then
  eval "$(fnm env --use-on-cd)"
  export NEOVIM_NODE="$FNM_DIR/aliases/neovim/bin"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ -s "$HOME/.local/share/pyenv/bin/pyenv" ]]; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

## load hooks
[[ -s "$hooks" ]] && for f in $hooks/*; do source "$f"; done

# load temp / package specific settings
[ -f ~/.zshrc ] && source ~/.zshrc

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
