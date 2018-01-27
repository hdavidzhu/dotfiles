#!/usr/bin/env zsh

BASEDIR=`dirname $0`

# Set up symbolink links to the correct documents
ln -s $BASEDIR/.zshrc ~/.zshrc
ln -s $BASEDIR/.gitignore_global ~/.gitignore_global
ln -s $BASEDIR/.vimrc ~/.vimrc
ln -s $BASEDIR/.tmux.conf ~/.tmux.conf

# Install Vundle
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall < /dev/tty
