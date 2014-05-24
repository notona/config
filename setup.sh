#!/bin/bash

cd `dirname $0`
set -ux pipefail

chsh -s /bin/zsh

cp -r ./home/bin ~/bin
mkdir -vp ~/project
#mkdir -vp ~/work
#mkdir -vp ~/free
mkdir -vp ~/ext
mkdir -vp ~/tmp
mkdir -vp ~/tmp/vim
mkdir -vp ~/tmp/vim/swap

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ROOT_DIR=`pwd`
ln -sfn ${ROOT_DIR}/home/vimrc ~/.vimrc
ln -sfn ${ROOT_DIR}/home/globalrc ~/.globalrc
ln -sfn ${ROOT_DIR}/home/zshrc ~/.zshrc
ln -sfn ${ROOT_DIR}/home/tmux.conf ~/.tmux.conf
ln -sfn ${ROOT_DIR}/home/gitconfig ~/.gitconfig

vim -c BundleInstall! -c ":q" -c ":q"

# install vimproc
(
  cd ~/.vim/bundle/vimproc
  case ${OSTYPE} in
    cygwin*)
      make -f make_cygwin.mak
      ;;
    linux*)
      make -f make_unix.mak
      ;;
  esac
)

# ag はマルチバイトに対応していないので
# pt をインストールする
# http://blog.monochromegane.com/blog/2014/01/16/the-platinum-searcher/
case ${OSTYPE} in
  cygwin*)
    cp pt/pt.exe ~/local/bin/
    ;;
  linux*)
    cp pt/pt_linux_x64 ~/local/bin/
    ;;
esac

# gtags.vim の最新版はバグってるのでバージョンを落とす
(
  cd ~/.vim/bundle/gtags.vim
  git checkout refs/tags/0.5
)

#mkdir -vp ~/tmp/gtags
