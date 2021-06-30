bindkey -v

alias ccc='clear'
alias editor="vim"
alias sof='xset dpms force off' # Turn off screen (on linux).
alias ss='source ~/.zshrc'

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

# Run a command multiple times
function run() {
  number=$1
  shift
  for n in $(seq $number); do
    $@
  done
}
