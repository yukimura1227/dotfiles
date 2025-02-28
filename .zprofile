if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if type "rbenv" > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

export GOPATH=~/go

if type "nodenv" > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
export RUBYOPT='-W:deprecated'

if type "fzf" > /dev/null 2>&1; then
  source <(fzf --zsh) # Set up fzf key bindings and fuzzy completion
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

################################################################################
# setup auto completion                                                        #
################################################################################

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

if type "gh" > /dev/null 2>&1; then
  eval "$(gh completion -s zsh)"
fi

if type "terraform" > /dev/null 2>&1; then
  complete -C terraform terraform
fi
