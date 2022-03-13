if [ -f /opt/homebrew/bin/brew ]
then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  if [ -f $(brew --prefix)/etc/bash_completion ]
  then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi

if type "rbenv" > /dev/null 2>&1
then
  eval "$(rbenv init -)"
fi

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

if type "pyenv" > /dev/null 2>&1
then
  PYENV_ROOT=~/.pyenv
  export PATH=$PATH:$PYENV_ROOT/bin
  eval "$(pyenv init -)"
fi

export GOPATH=~/go

if type "nodenv" > /dev/null 2>&1
then
  eval "$(nodenv init -)"
fi
export RUBYOPT='-W:deprecated'
