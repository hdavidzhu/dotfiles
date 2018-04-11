#!/usr/bin/env zsh

source `dirname $0`/../libs/antigen.zsh

antigen use oh-my-zsh
antigen bundle history-substring-search
antigen bundle git
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply
