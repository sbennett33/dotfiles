export PATH="$HOME/bin:$PATH"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/Users/sbennett/.local/bin
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export ERL_AFLAGS="-kernel shell_history enabled"

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Default Apps
export EDITOR="nvim"
export VISUAL="code -n"
export TERMINAL="ghostty"
export BROWSER="open"
export PAGER="less"

# Added by `rbenv init` on Mon Mar 23 11:34:25 PDT 2026
eval "$(rbenv init - --no-rehash zsh)"
