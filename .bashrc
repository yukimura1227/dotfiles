# Source global definitions
if [ -f /etc/bashrc ]
then
  . /etc/bashrc
fi

export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad
export GREP_OPTIONS="--color=auto"
export PS1="🍥 \[\e[1;3;36m\]\W \\[\e[0m\]$ "

# Git
if type "git" > /dev/null 2>&1
then
  alias g='git'
fi

# docker
if type "docker" > /dev/null 2>&1
then
  alias d='docker'
  alias dc='docker compose'
fi

export RUBYOPT='-W:deprecated'

export BAT_CONFIG_PATH=~/.batconfig
