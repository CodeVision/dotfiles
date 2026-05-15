find-up() {
	path=$(pwd)
	while [[ "$path" != "" && ! -e "$path/$1" ]]; do
		path=${path%/*}
	done
	echo "$path"
}

FNM_USING_LOCAL_VERSION=0

_fnm_use() {
  current=$(fnm current)
  if [[ "$current" != "$1"* ]]; then
    fnm use $1
  fi
}

autoload -U add-zsh-hook
_fnm_autoload_hook() {
	nvmrc_path=$(find-up .node-version | tr -d '[:space:]')

	if [ -n "$nvmrc_path" ]; then
		FNM_USING_LOCAL_VERSION=1
		nvm_version=$(cat $nvmrc_path/.node-version)
		_fnm_use $nvm_version
	elif [ $FNM_USING_LOCAL_VERSION -eq 1 ]; then
		FNM_USING_LOCAL_VERSION=0
		_fnm_use default
	fi
}

add-zsh-hook chpwd _fnm_autoload_hook && _fnm_autoload_hook
