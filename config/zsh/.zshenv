export EDITOR=nvim
export PAGER=less
export TERMINAL=ghostty
export GPG_KEY=8528048F8DA51FE8B0EABC733180FF8AEC0AAD85
export AGE_KEY=age1e9aaw8m05rcaurwa3fgcww25hej6kzud98ythg98mkhnvz8tqcuq9vlnw0

export XDG_CONFIG_DIR=~/.config
export XDG_CACHE_DIR=~/.cache
export XDG_DATA_DIR=~/.local/share
export XDG_DOWNLOAD_DIR=~/temp/downloads
export TRITON_CACHE=~/.cache/triton/

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

export BAT_THEME="Visual Studio Dark+"

export RUSTUP_HOME=~/.local/share/rustup
export CARGO_HOME=~/.local/share/cargo
export RBENV_ROOT="$HOME/.local/share/rbenv"
export PYENV_ROOT="$HOME/.local/share/pyenv"
export GOPATH="$HOME/.local/share/go"

export CLAUDE_CONFIG_DIR="$HOME/.config/claude"

export KUBECONFIG="${KUBECONFIG}:${HOME}/.kube/config:${HOME}/.kube/okeanos:${HOME}/.kube/omni/current.yaml"

export PASSWORD_STORE_DIR=~/.local/share/pass/
export SUMMON_PROVIDER=/usr/bin/gopass-summon-provider
