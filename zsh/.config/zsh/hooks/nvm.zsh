# place this after nvm initialization!
autoload -U add-zsh-hook

nvm_echo() {
  command printf %s\\n "$*" 2>/dev/null || {
    nvm_echo() {
      # shellcheck disable=SC1001
      \printf %s\\n "$*" # on zsh, `command printf` sometimes fails
    }
    nvm_echo "$@"
  }
}

# Traverse up in directory tree to find containing folder
nvm_find_up() {
  local lpath
  lpath="${PWD}"
  while [ "${lpath}" != "" ] && [ ! -f "${lpath}/${1-}" ]; do
    lpath=${lpath%/*}
  done
  nvm_echo "${lpath}"
}

nvm_find_nvmrc() {
  local dir
  dir="$(nvm_find_up '.nvmrc')"
  if [ -e "${dir}/.nvmrc" ]; then
    nvm_echo "${dir}/.nvmrc"
  fi
}

load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    nvmrc_loaded=true
    nvm use 
  elif [ "$nvmrc_loaded" = true ]; then
    echo "Reverting to nvm default version"
    nvm use default
    nvmrc_loaded=false
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
