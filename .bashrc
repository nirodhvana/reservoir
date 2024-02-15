#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q
stty werase '^H' #Delete entire word with Ctrl+BackSp
shopt -s autocd # Allows you to cd into directory merely by typing the directory name.
shopt -s histappend # append to the history file, don't overwrite it
set -o vi # Enables vi mode in terminal
export EDITOR='vi'
export VISUAL='vi'
HISTSIZE= HISTFILESIZE= # Infinite history
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PATH="$(go env GOPATH)/bin:$PATH" # Adding the GO folder to the PATH variable

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc" # load aliases

alias ls='ls --color'
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

#Use Pywal Colorscheme for all new terminals.
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

export DISPLAY=:0.0
