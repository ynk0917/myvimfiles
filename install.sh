#!/bin/sh

current_directory=`pwd`
cp ~/.vimrc ~/.vimrc_bak
rm ~/.vimrc

cp -r ~/.vim ~/.vim_bak
rm -rf ~/.vim

ln -s $current_directory ~/.vim
ln -s $current_directory/.vimrc ~/.vimrc
git pull origin master
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
./update.sh
