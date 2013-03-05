#!/bin/sh

current_directory=`pwd`
if [ -f ~/.vimrc ];then
    mv ~/.vimrc ~/.vimrc.bak
    rm ~/.vimrc
fi
if [ -d ~/.vim ];then
    rm -rf ~/.vim_bak
    mv ~/.vim ~/.vim_bak
elif [ -L ~/.vim ];then
    rm ~/.vim_bak
    mv ~/.vim ~/.vim_bak
fi
ln -s $current_directory ~/.vim
ln -s $current_directory/.vimrc ~/.vimrc
git pull origin master
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
./update.sh
