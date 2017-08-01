#!/usr/bin/env zsh

BASEDIR=`dirname $0`
echo $BASEDIR

# Set up symbolink links to the correct documents
ln -s $BASEDIR/.zshrc ~/.zshrc
ln -s $BASEDIR/.gitignore_global ~/.gitignore_global
ln -s $BASEDIR/.vimrc ~/.vimrc

# Install Vundle
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall < /dev/tty # necessary to avoid vim: Input not from terminal warning
