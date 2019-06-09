if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi
eval "$(rbenv init -)"
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$(pyenv init -)"
export GOPATH=~/go
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
