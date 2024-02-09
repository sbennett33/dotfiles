export PATH="/Users/sbennett/bin:$PATH"
export PATH=$PATH:/Users/sbennett/Library/Python/3.11/bin

export ERL_AFLAGS="-kernel shell_history enabled"

alias vim=nvim
alias ls="exa --all --long --header"
alias gaa="git add --all"
alias gst="git status"
alias gco='git checkout'
alias gcb='git checkout -B'
alias gl='git pull'
alias gci='git_checkout_issue.sh'

alias drs='doppler run -- iex -S mix phx.server'

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

function dop() {
  cmd="$*"
  eval "doppler run --command \"$cmd\""
}

# usage:
# dop mix test
# dop iex -S mix phx.server
# dop mix format

setopt autocd

eval "$(/opt/homebrew/bin/brew shellenv)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

