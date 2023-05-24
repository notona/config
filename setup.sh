#!/bin/bash

cd `dirname $0`
set -ux pipefail

chsh -s /bin/zsh

cp -r ./home/local ~/
mkdir -vp ~/project
#mkdir -vp ~/work
mkdir -vp ~/ext
mkdir -vp ~/tmp

# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ROOT_DIR=`pwd`
ln -sfn ${ROOT_DIR}/home/vimrc ~/.vimrc
ln -sfn ${ROOT_DIR}/home/zshrc ~/.zshrc
ln -sfn ${ROOT_DIR}/home/tmux.conf ~/.tmux.conf
ln -sfn ${ROOT_DIR}/home/gitconfig ~/.gitconfig

