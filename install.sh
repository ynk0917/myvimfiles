#!/bin/sh

mv ~/.vimrc ~/.vimrc.bak
mv ~/.bashrc ~/.bashrc.bak
mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.bashrc ~/.bashrc
ln -s ~/.vim/.gitconfig  ~/.gitconfig
sh ~/.vim/update.sh
