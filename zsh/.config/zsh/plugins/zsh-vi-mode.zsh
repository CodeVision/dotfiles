function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
}

function zvm_after_init() {
  zvm_bindkey viins '^y' autosuggest-accept

  # fzf
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
}
