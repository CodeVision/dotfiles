export EDITOR=nvim
export PAGER=less
export TERMINAL=ghostty
export GPG_KEY=8528048F8DA51FE8B0EABC733180FF8AEC0AAD85

export XDG_CONFIG_DIR=~/.config
export XDG_CACHE_DIR=~/.cache
export XDG_DATA_DIR=~/.local/share
export XDG_DOWNLOAD_DIR=~/temp/downloads

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

export BAT_THEME="Visual Studio Dark+"

export RUSTUP_HOME=~/.local/share/rustup
export CARGO_HOME=~/.local/share/cargo
export RBENV_ROOT="$HOME/.local/share/rbenv"
export PYENV_ROOT="$HOME/.local/share/pyenv"
export GOPATH="$HOME/.local/share/go"

export KUBECONFIG="${KUBECONFIG}:${HOME}/.kube/config"

export PASSWORD_STORE_DIR=~/.local/share/pass/
