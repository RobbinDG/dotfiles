function parse_venv() {
	if test -z $VIRTUAL_ENV ; then
    	echo ""
  	else
  		echo "🞂\[\e[38;2;255;81;72m\] `basename \"$VIRTUAL_ENV\"`\[\e[38;2;211;148;255m\]${STAT}\[\e[m\]  "
		# PYTHON_VIRTUALENV="${GREEN}(`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE} "
  	fi
}

function set_bash_prompt {
	PS1="$(parse_venv)🞂 \[\e[38;2;255;158;20m\]\W\[\e[m\]$(parse_git_branch) » "
}
PROMPT_COMMAND=set_bash_prompt

LS_COLORS='di=1;93:'
export LS_COLORS