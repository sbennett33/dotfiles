source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(fzf --zsh)"

alias vim=nvim
alias ls="eza --all --long --header --icons --git"
alias gaa="git add --all"
alias gst="git status"
alias gco='git checkout'
alias gcb='git checkout -B'
alias gl='git pull'
alias gp='git push'
alias lg='lazygit'
alias ts='tailscale'

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[[1;5C" forward-word          # Ctrl+Right
bindkey "^[[1;5D" backward-word         # Ctrl+Left
bindkey "^[^?" backward-kill-word       # Option+Backspace

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

setopt autocd

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# auto-rename tmux windows for long-running commands
preexec() {
  if [[ -n "$TMUX" ]]; then
    local dir=${PWD:t}
    (( ${#dir} > 20 )) && dir="${dir:0:19}…"
    case "$1" in
      *claude*)          tmux rename-window "claude:$dir" ;;
    esac
  fi
}
precmd() {
  [[ -n "$TMUX" ]] && tmux set-option -w automatic-rename on
}

# pnpm
export PNPM_HOME="/Users/scott/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opencode
export PATH=/Users/scott/.opencode/bin:$PATH

export GITHUB_USERNAME="sbennett33"
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export MIX_OS_DEPS_COMPILE_PARTITION_COUNT=$(($(sysctl -n hw.physicalcpu) / 2))

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(mise activate zsh)"
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
