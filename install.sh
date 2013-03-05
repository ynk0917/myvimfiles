#!/bin/sh

if [ -f ~/.vimrc ];then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s 'pwd' ~/.vim
ln -s .vimrc ~/.vimrc
./update.sh
