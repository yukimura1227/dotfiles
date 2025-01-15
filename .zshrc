export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad
export GREP_OPTIONS="--color=auto"
# zsh prompt expansion document : https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# %F〜%f: set text color. %1~: display 1 directory.
PS1="🍥 %F{cyan}%B%2~%b%f %(!.#.$)${reset_color} "

# Git
if type "git" > /dev/null 2>&1; then
  alias g='git'
fi

# docker
if type "docker" > /dev/null 2>&1; then
  alias d='docker'
  alias dc='docker compose'
fi

export RUBYOPT='-W:deprecated'

export BAT_CONFIG_PATH=~/.batconfig
