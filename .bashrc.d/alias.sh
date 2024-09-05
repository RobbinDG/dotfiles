alias ls='ls --color=auto'
alias removeorphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias reloadsxhkd='killall -s SIGUSR1 sxhkd'
lsd() {
	ls -t ${1:-.} | less
}

alias splatstats='python ~/Documents/gaming/splatoon/splatnet2statink/splatnet2statink.py -M 200 -r -s'

alias dock='xrandr --output DP1 --scale 2x2 --mode 1920x1080 --fb 3840x4320 --pos 0x0'

alias cgrep="grep --color=always"

alias intellij='/home/robbin/.local/share/JetBrains/Toolbox/apps/IDEA-U/ch-0/203.5981.155/bin/idea.sh'
alias pycharm='/home/robbin/.local/share/JetBrains/Toolbox/apps/PyCharm-P/ch-0/202.7319.64/bin/pycharm.sh'
alias clion='/home/robbin/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/202.7319.72/bin/clion.sh'