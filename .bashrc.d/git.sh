alias gstat='git status'
alias ga='git add .'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git push'
alias gpom='git push origin master'
alias gpod='git push origin development'
alias glo='git log --oneline'

git-ahead() {
	git rev-list --left-right --count "$1...$2"
}

git-remove-old-branches() {
	for k in $(git branch --merged | sed /\*/d); do 
	  if [ -z "$(git log -1 --since='1 month ago' -s $k)" ]; then
	    git branch -d $k
	  fi
	done
}
