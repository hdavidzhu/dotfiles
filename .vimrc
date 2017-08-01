" INSTALLS ====================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'edkolev/tmuxline.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'kchmck/vim-coffee-script' " Coffeescript support
Plugin 'rakr/vim-one'
Plugin 'scrooloose/nerdtree' " Tree
Plugin 'sheerun/vim-polyglot' " Language support
Plugin 'VundleVim/Vundle.vim' " Vundle manages itself
call vundle#end()

filetype plugin indent on


" CONFIG =====================================================================

" Theme
syntax on
set termguicolors
set background=light
let g:one_allow_italics = 1 " Comment italics
colorscheme one
let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

set noshowmode
set number " Line number on left
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " Show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " When indenting with '>', use 2 spaces width

autocmd BufWritePre * %s/\s\+$//e " Remove all trailing whitespaces

