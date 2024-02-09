export PATH="$HOME/bin:$PATH"
export PATH=$PATH:$HOME/Library/Python/3.11/bin

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

# usage:
# dop mix test
# dop iex -S mix phx.server
# dop mix format
function dop() {
  cmd="$*"
  eval "doppler run --command \"$cmd\""
}


setopt autocd

eval "$(/opt/homebrew/bin/brew shellenv)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

