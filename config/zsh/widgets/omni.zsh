omni-node-arg() {
  local machine

  machine="$(
    omnictl get machinestatus -o json |
      jq -s -r '
        .[]
        | [
            (.spec.cluster // "-"),
            (.spec.network.hostname // "-"),
            .metadata.id
          ]
        | @tsv
      ' |
      fzf \
        --prompt="Omni node> " \
        --header=$'CLUSTER\tMACHINE\tID' \
        --delimiter=$'\t' \
        --with-nth=1,2,3 \
        --preview='echo Cluster: {1}; echo Machine: {2}; echo ID: {3}' |
      cut -f3
  )" || return

  LBUFFER+="-n ${machine} "
}

zle -N omni-node-arg
bindkey '^O' omni-node-arg
