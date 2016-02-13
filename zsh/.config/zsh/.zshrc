# main zsh configuration

zprompt="$ZDOTDIR/zprompt"
zalias="$ZDOTDIR/zalias"

# prompt
[[ -f "$zprompt" ]] && source "$zprompt"

# aliases
[[ -f "$zalias" ]] && source "$zalias"

# Set options
# - history
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=5000

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

setopt extendedglob

# - zle
setopt nobeep

# - scripts & functions
setopt c_bases              # print hexidecimals in C format (0xFF)
setopt octal_zeroes         # print octals per IEEE standard (077)

# TODO:
# - job control
setopt notify
# - input / output

# completions
# TODO: configure and options
autoload -Uz compinit
compinit

# key bindings
# TODO
KEYTIMEOUT=20
bindkey -v

# insert mode
bindkey -M viins 'jj' vi-cmd-mode

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

# external program configs
eval $(dircolors ~/.dircolors)
