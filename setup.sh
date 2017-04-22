#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
echo $BASEDIR

# Set up symbolink links to the correct documents
ln -s $BASEDIR/.zprofile ~/.zprofile
ln -s $BASEDIR/.gitignore_global ~/.gitignore_global
ln -s $BASEDIR/.vimrc ~/.vimrc

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
