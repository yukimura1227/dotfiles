if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi
eval "$(rbenv init -)"
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
