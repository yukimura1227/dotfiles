export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad
export GREP_OPTIONS="--color=auto"
# zsh prompt expansion document : https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# %F〜%f: set text color. %1~: display 1 directory.
PS1="🍥 %F{cyan}%B%2~%b%f %(!.#.$)${reset_color} "

# enable comment on command line mode
setopt interactivecomments

# Git
if type "git" > /dev/null 2>&1; then
  alias g='git'
fi

# docker
if type "docker" > /dev/null 2>&1; then
  alias d='docker'
  alias dc='docker compose'
fi

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

export RUBYOPT='-W:deprecated'

export BAT_CONFIG_PATH=~/.batconfig
# for lazy git directory
export LG_CONFIG_FILE="${HOME}/.config/lazygit/config.yaml" lazygit

eval "$(mise activate zsh)"
