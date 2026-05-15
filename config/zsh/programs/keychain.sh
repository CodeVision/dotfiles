# start keychain
if [ -x "$(command -v keychain)" ]; then
  trap "" SIGINT
  eval $(keychain --eval --quiet $1)
  trap - SIGINT
fi
