#!/bin/bash

createSymbolicLinkIfNotExist () {
  linkFrom=$1
  linkTo=$2
  if [ -L ${linkTo} ]; then
    if [ -e ${linkTo} ]; then
      echo "already linked... [${linkTo}]"
    else
      echo "[ERROR] ${linkTo} is Broken!!!" >&2
    fi
  elif [ -e ${linkTo} ]; then
    echo "[ERROR] ${linkTo} is not a link!!!" >&2
  else
    echo "ln -sf ${linkFrom} ${linkTo}"
    ln -sf ${linkFrom} ${linkTo}
  fi
}

# careate symbolic link
mkdir -p ~/.config
createSymbolicLinkIfNotExist ~/dotfiles/.vimrc ~/.vimrc
createSymbolicLinkIfNotExist ~/dotfiles/.gvimrc ~/.gvimrc
createSymbolicLinkIfNotExist ~/dotfiles/.ideavimrc ~/.ideavimrc
createSymbolicLinkIfNotExist ~/dotfiles/.vim ~/.vim
createSymbolicLinkIfNotExist ~/dotfiles/.gitconfig ~/.gitconfig
createSymbolicLinkIfNotExist ~/dotfiles/.gitignore_global ~/.gitignore_global
createSymbolicLinkIfNotExist ~/dotfiles/.bashrc ~/.bashrc
createSymbolicLinkIfNotExist ~/dotfiles/.bash_profile ~/.bash_profile
createSymbolicLinkIfNotExist ~/dotfiles/.tigrc ~/.tigrc
createSymbolicLinkIfNotExist ~/dotfiles/.matplotlib ~/.matplotlib
createSymbolicLinkIfNotExist ~/dotfiles/.jupyter ~/.jupyter
createSymbolicLinkIfNotExist ~/dotfiles/.batconfig ~/.batconfig
createSymbolicLinkIfNotExist ~/dotfiles/.ssh/aws_ssm.sh ~/.ssh/aws_ssm.sh
createSymbolicLinkIfNotExist ~/dotfiles/.terraformrc ~/.terraformrc
createSymbolicLinkIfNotExist ~/dotfiles/.tmux.conf ~/.tmux.conf
createSymbolicLinkIfNotExist ~/dotfiles/.nbrc ~/.nbrc

mkdir -p ~/.config
createSymbolicLinkIfNotExist ~/dotfiles/.config/wezterm ~/.config/wezterm
createSymbolicLinkIfNotExist ~/dotfiles/.config/gh ~/.config/gh

mkdir -p ~/.nodebrew/src

mkdir -p ~/backup

createSymbolicLinkIfNotExist ~/dotfiles/raycast_scripts ~/raycast_scripts
