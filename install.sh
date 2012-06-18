#!/bin/sh

mv ~/.vimrc ~/.vimrc.bak
ln -s ~/.vim/.vimrc ~/.vimrc
sh ~/.vim/update.sh
