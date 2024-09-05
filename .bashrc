#
# ~/.bashrc
#
# to reload: . ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for FILE in ~/.bashrc.d/*; do
    source $FILE
done

export PATH="$PATH:$HOME/.local/bin"
