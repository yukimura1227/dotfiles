# Source global definitions
if [ -f /etc/bashrc ]
then
  . /etc/bashrc
fi

export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad
export GREP_OPTIONS="--color=auto"
export PS1="\[\033[32m\]\h:\W \u\\[\033[0m\]$ "

# Git
alias g='git'
export RUBYOPT='-W:deprecated'

export BAT_CONFIG_PATH=~/.batconfig
