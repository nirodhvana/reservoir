#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # Allows you to cd into directory merely by typing the directory name.
shopt -s histappend # append to the history file, don't overwrite it
set -o vi # Enables vi mode in terminal
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
#export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nornu noma laststatus=1' -\"" # Open Manpages In Vim.

[ -f "$HOME/.local/bin/" ] && . "$HOME/.local/bin" # load shell scripts
[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc" # load aliases

export PS1="\[\033[38;5;1m\][\[$(tput sgr0)\]\[\033[38;5;3m\]\u\[$(tput sgr0)\]\[\033[38;5;156m\]@\[$(tput sgr0)\]\[\033[38;5;4m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;1m\]]\[$(tput sgr0)\]% \[$(tput sgr0)\]"
export LS_COLORS="di=33;04:tw=33;04:ow=33;04:st=33;04:fi=0:ln=36:pi=5:so=5:bd=5:cd=5:or=31:mi=37:ex=36:*.deb=31;47:*.rpm=31;47:*.png=35:*.jpg=35:*.lua=44:*.c=44:*.h=90:*.txt=97:*.odt=47:*.csv=47:*.cpp=44*.sh=41:*.html=44:*.zip=103:*.tar.gz=103:*.mp4=105:*.mp3=104:*.m4a=104:*.opus=104"
export TESSDATA_PREFIX=/usr/share/tessdata/
#export FZF_DEFAULT_OPTS='--bind=alt-j:preview-down,alt-k:preview-up'
