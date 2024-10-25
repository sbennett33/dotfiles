export PATH="$HOME/bin:$PATH"
export PATH=$PATH:$HOME/Library/Python/3.11/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/Users/sbennett/.local/bin

export ERL_AFLAGS="-kernel shell_history enabled"

source $XDG_CONFIG_HOME/zsh/.private

alias vim=nvim
alias ls="exa --all --long --header --icons --git"
alias gaa="git add --all"
alias gst="git status"
alias gco='git checkout'
alias gcb='git checkout -B'
alias gl='git pull'
alias gp='git push'
alias gci='git_checkout_issue.sh'

alias drs='doppler run -- iex -S mix phx.server'
alias drm='doppler run -- iex -S mix'

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^R' history-incremental-pattern-search-backward

# usage:
# dop mix test
# dop iex -S mix phx.server
# dop mix format
function dop() {
  cmd="$*"
  eval "doppler run --command \"$cmd\""
}

setopt autocd

autoload -U compinit
compinit

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

