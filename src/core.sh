bindkey -v

alias ss='source ~/.zshrc'
alias sof='xset dpms force off' # Turn off screen (on linux).
alias ccc='clear'

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
