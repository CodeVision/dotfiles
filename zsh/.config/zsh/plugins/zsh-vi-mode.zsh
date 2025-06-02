function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
}

function zvm_after_init() {
  zvm_bindkey viins '^y' autosuggest-accept
  zvm_bindkey viins "^P" up-line-or-beginning-search
  zvm_bindkey viins "^N" down-line-or-beginning-search
  for o in files branches tags remotes hashes stashes each_ref; do
      eval "zvm_bindkey viins '^g^${o[1]}' fzf-git-$o-widget"
      eval "zvm_bindkey viins '^g${o[1]}' fzf-git-$o-widget"
  done

  # fzf
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh

  eval "$(atuin init zsh --disable-up-arrow)"
}


# Set keybindings for zsh-vi-mode normal and visual modes
function zvm_after_lazy_keybindings() {
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey vicmd '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey vicmd '^g${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g${o[1]}' fzf-git-$o-widget"
    done
}
