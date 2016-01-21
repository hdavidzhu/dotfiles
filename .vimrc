set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vundle manages itself
" Plugin 'Valloric/YouCompleteMe' " Autocompletion

call vundle#end()
filetype plugin indent on

set background=dark
colorscheme desert
syntax on
