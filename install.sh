#!/usr/bin/env zsh

BASE_DIR=$(dirname $0)

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Set up symbolink links to the correct documents
grep -q -F 'source ~/dotfiles/src/index.sh' ~/.zshrc || echo 'source ~/dotfiles/src/index.sh' >>~/.zshrc
ln -s $BASE_DIR/.gitignore_global ~/.gitignore_global
ln -s $BASE_DIR/.vimrc ~/.vimrc
ln -s $BASE_DIR/.tmux.conf ~/.tmux.conf

# Install Vundle
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall </dev/tty
