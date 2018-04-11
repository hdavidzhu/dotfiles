alias niu='npm install && npm update'
alias niu0='niu --depth 0'
alias nlinks='\ls -F node_modules | sed -n 's/@$//p' | xargs npm ls -g --depth 0'
alias zmocha='./node_modules/.bin/mocha'
