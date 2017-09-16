if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi
eval "$(rbenv init -)"
export PATH=$PATH:$HOME/.nodebrew/current/bin
