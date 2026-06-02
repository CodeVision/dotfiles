# main zsh configuration

zprompt="$ZDOTDIR/zprompt"
zalias="$ZDOTDIR/zalias"
named_dirs="$ZDOTDIR/named_dirs"

completions="/home/$USER/.local/share/zsh/completions"
hooks="$ZDOTDIR/hooks"
custom_widgets="$ZDOTDIR/widgets"
plugins="$ZDOTDIR/plugins"

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
 
# load completion modules
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

## load funcs
typeset -U fpath
fpath=($ZDOTDIR/funcs $completions $fpath)
[[ -n ${fpath[1]}/* ]] && autoload -U ${fpath[1]}/*(:t)

# completions
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
bindkey -M viins '\C-i' complete-word
bindkey -M viins '\eu' undo

bindkey -M viins '^o' push-line-or-edit

# allow editing command line in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins '\ee' edit-command-line

bindkey -M viins ' ' magic-space

bindkey -M viins '\e^M' self-insert-unmeta

# list scroll
bindkey -M listscroll q send-break
bindkey -M listscroll j accept-line

# keychain
# source "$ZDOTDIR/programs/keychain.sh" $(cat ~/config/settings/.current-profile)
# source "$ZDOTDIR/programs/keychain.sh" ~/.ssh/codevision
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
fi
export GPG_TTY="${TTY:-"$(tty)"}"
gpg-connect-agent updatestartuptty /bye > /dev/null


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# plugins
[[ -s "$plugins" ]] && for f in $plugins/*.zsh; do source "$f"; done

source ~/.local/share/zsh/antidote/antidote.zsh
antidote load

## load named dirs
[[ -r $named_dirs ]] && source $named_dirs

## load custom completers
complete -C '/usr/bin/aws_completer' aws
source $completions/_az

## set programs and paths
typeset -Ux path PATH
path=($path)

# external program configs
eval $(dircolors -b)

source $ZDOTDIR/scripts/fzf-git.sh

if [[ -d $PYENV_ROOT ]]; then
  if [[ -d $PYENV_ROOT/bin ]]; then
    path=($PYENV_ROOT/bin $path)
    export NEOVIM_PYTHON="$(pyenv virtualenv-prefix neovim)/envs/neovim"
  fi
  eval "$(pyenv init -)"
fi

if [[ -d "$CARGO_HOME/bin" ]]; then
  path=($CARGO_HOME/bin $path)
fi

if [[ -d "$GOPATH/bin" ]]; then
  path=($GOPATH/bin $path)
fi

if [[ -s "$RBENV_ROOT/bin/rbenv" ]]; then
  path=($RBENV_ROOT/bin $path)
  eval "$(rbenv init -)"
fi

export FNM_DIR="$HOME/.local/share/fnm"
if [[ -s "$FNM_DIR/fnm" ]]; then
  path=($HOME/.local/share/fnm $path)
  eval "$(fnm env --use-on-cd)"
  export NEOVIM_NODE="$FNM_DIR/aliases/neovim"
fi

if [ -x "$(command -v thefuck)" ]; then
  eval $(thefuck --alias)
fi
eval "$(zoxide init zsh)"
eval $(atuin init zsh)

## load hooks
[[ -s "$hooks" ]] && for f in $hooks/*; do source "$f"; done

## load widgets
[[ -s "$custom_widgets" ]] && for f in $custom_widgets/*; do source "$f"; done


# load temp / package specific settings
if [[ -f ~/.zshrc ]]; then
  source ~/.zshrc
fi

path=($HOME/.local/bin $path)
