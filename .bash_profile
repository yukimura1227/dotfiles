if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi

if type "rbenv" > /dev/null 2>&1
then
  eval "$(rbenv init -)"
fi

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

if type "pyenv" > /dev/null 2>&1
then
  PYENV_ROOT=~/.pyenv
  export PATH=$PATH:$PYENV_ROOT/bin
  eval "$(pyenv init -)"
fi

export GOPATH=~/go

if type "ndenv" > /dev/null 2>&1
then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi
