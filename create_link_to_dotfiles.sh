#!/bin/bash
# careate symbolic link
mkdir -p ~/.config
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.matplotlib ~/.matplotlib
ln -sf ~/dotfiles/.jupyter ~/.jupyter
ln -sf ~/dotfiles/.batconfig ~/.batconfig
ln -sf ~/dotfiles/.ssh/aws_ssm.sh ~/.ssh/aws_ssm.sh
ln -sf ~/dotfiles/.terraformrc ~/.terraformrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.nbrc ~/.nbrc

mkdir -p ~/.config
ln -sf ~/dotfiles/.config/wezterm ~/.config/wezterm
ln -sf ~/dotfiles/.config/gh ~/.config/gh

mkdir -p ~/.nodebrew/src

mkdir -p ~/backup

ln -sf ~/dotfiles/raycast_scripts ~/raycast_scripts
