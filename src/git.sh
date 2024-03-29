# Update dotfiles
alias gglobal='git config --global core.excludesfile ~/dotfiles/.gitignore_global'

# Status
alias gs='git status'
alias gb='git branch'
alias gba='git branch -a'
alias glog='git log --all --decorate --oneline --graph'

gbst() {
  command git for-each-ref --format="%(refname:short) %(upstream:short)" refs/ | \
  while read local remote
  do
    if [ -x $remote ]; then
      # Ignore remote references
    else
      main="origin/main"
      git rev-list --left-right ${local}...${main} -- 2>/dev/null >/tmp/git_upstream_status_delta || continue
      LEFT_AHEAD=$(grep -c '^<' /tmp/git_upstream_status_delta)
      RIGHT_AHEAD=$(grep -c '^>' /tmp/git_upstream_status_delta)
      printf "%-25s \x1B[31m%-3s\x1B[0m \x1B[32m%-3s\x1B[0m \n" "$local" "$RIGHT_AHEAD" "$LEFT_AHEAD"
    fi;
  done  | grep -v "^origin/main" | sort | uniq
}

# New
alias gco='git checkout'
alias gcob='git checkout -b'

# Pull
alias gg='git pull -r origin'
alias ggm='gg main'
alias gpa='ls | xargs -P10 -I{} git -C {} pull'

# Making a commit
alias ga='git add .'
alias gds='git diff --staged'
alias gcm='git commit -m'
alias gpo='git push -u origin'

# Rebasing
alias gfa='git fetch --all'
alias gri='git rebase -i'
alias grc='git rebase --continue'

# Stashing
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

# Housecleaning
alias gconf='git diff --name-only --diff-filter=U'
alias gcl='git remote prune origin'
gitbranchclear() { git branch --merged | grep -v '\*' | xargs -n 1 git branch -d }
alias gclb='gcl && gitbranchclear && gcl'
alias gscb='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

