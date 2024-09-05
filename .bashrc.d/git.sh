# Git autocomplete
source /usr/share/git/completion/git-completion.bash

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

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "  🞂\[\e[38;2;190;97;255m\] ${BRANCH}\[\e[38;2;211;148;255m\]${STAT}\[\e[m\]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=" 🖋${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits=" 🢙${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits=" 🟉${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits=" 🟒${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits=" 🗑${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits=" 🗘${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo "${bits} "
	else
		echo ""
	fi
}