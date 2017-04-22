# SETUP ========================================================================

# ulimit -n 65536
# ulimit -u 2048


# BASIC ========================================================================

plugins=(
  git \
  ruby \
  gem \
  history \
  history-substring-search \
  terminalapp brew nanoc \
  zsh-syntax-highlighting \
)

alias ss='source ~/dotfiles/.zprofile'
alias zupd='cd ~/dotfiles && ga && git commit --amend && gpo -f master && cd -'
alias lh='ls -a'
alias sof='xset dpms force off' # Turn off screen (on linux).
alias ccc='clear'

export EDITOR="/usr/bin/vim"

# KEYBINDINGS ==================================================================

# Allows for Ctrl-Z to toggle background processes.
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# COLORS =======================================================================

autoload colors; colors;

LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32';
LSCOLORS='ExGxFxDxCxDxDxhbhdacEc';

# Do we need Linux or BSD Style?
if ls --color -d . &>/dev/null 2>&1
then
  # Linux Style
  export LS_COLORS=$LS_COLORS
  # alias ls='ls --color=tty'
  alias ls='ls --color -h --group-directories-first'
else
  # BSD Style
  export LSCOLORS=$LSCOLORS
  alias ls='ls -G'
fi

# Use same colors for autocompletion
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# GIT ==========================================================================

# Status.
alias gs='git status'
alias gb='git branch'
alias gba='git branch -a'

# New.
alias gco='git checkout'
alias gcob='git checkout -b'

# Making a commit.
alias ga='git add .'
alias gr='git reset'
alias gd='git diff'
alias gds='git diff --staged'
alias gcm='git commit -m'
alias gpo='git push -u origin'
alias gg='git pull origin'

# Rebasing.
alias gfa='git fetch --all'
alias gri='git rebase -i'
alias grc='git rebase --continue'

# Stashing.
alias gst='git stash'
alias gsl='git stash list'
gsshow() { command git stash show -p stash@{$1} }
gsp() {
  if [ $# -eq 0 ]
    then
      command git stash pop
    else
      command git stash pop stash@{$1}
  fi
}

# Housecleaning.
alias gconf='git diff --name-only --diff-filter=U'
alias gcl='git remote prune origin'
gitbranchclear() { git branch --merged | grep -v '\*' | xargs -n 1 git branch -d }
alias gclb='gitbranchclear && gcl'

# Update dotfiles.
alias gitglobe='git config --global core.excludesfile ~/dotfiles/.gitignore_global'


# TEXT EDITORS =================================================================

alias am='atom ./'
alias sb='subl ./'


# WEB ==========================================================================

alias psv='python -m SimpleHTTPServer 8000'
alias gp='gulp'


# NODE =========================================================================

# List of linked npm packages.
alias nlinks='\ls -F node_modules | sed -n 's/@$//p' | xargs npm ls -g --depth 0'


# DOCKER =======================================================================

alias dm='docker-machine'
alias dc='docker-compose'


# PYTHON =======================================================================

# added by Miniconda3 4.3.11 installer
export PATH="/Users/hdavidzhu/miniconda3/bin:$PATH"
