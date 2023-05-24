#!/bin/bash

cd `dirname $0`
set -ux pipefail

chsh -s /bin/zsh

cp -r ./home/local ~/
mkdir -vp ~/project
#mkdir -vp ~/work
#mkdir -vp ~/free
mkdir -vp ~/ext
mkdir -vp ~/tmp
mkdir -vp ~/tmp/vim
mkdir -vp ~/tmp/vim/swap

mkdir -p ~/.vim/bundle

# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ROOT_DIR=`pwd`
ln -sfn ${ROOT_DIR}/home/vimrc ~/.vimrc
ln -sfn ${ROOT_DIR}/home/zshrc ~/.zshrc
ln -sfn ${ROOT_DIR}/home/tmux.conf ~/.tmux.conf
ln -sfn ${ROOT_DIR}/home/gitconfig ~/.gitconfig

# ag はマルチバイトに対応していないので
# pt をインストールする
# http://blog.monochromegane.com/blog/2014/01/16/the-platinum-searcher/
case ${OSTYPE} in
  cygwin*)
    cp pt/pt.exe ~/local/bin/
    ;;
  linux*)
    cp pt/pt_linux_x64 ~/local/bin/pt
    ;;
  darwin*)
    cp pt/pt_maxosx_64 ~/local/bin/pt
    ;;
esac
