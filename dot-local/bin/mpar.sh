#!/bin/bash

# This script wasN'T written by me.
# Original author: https://gist.github.com/kanliot/0187f7aad0a45be8c624a41ebb705f40
# runs mpv --vid=no
# Do you want to play 10 albums, shuffling the albums, but not shuffling t the songs on the albums?
# pass each album as a dirname or zipname to this script
# or pass the directory containing the albums
# or call this script with no args

# no args:  loops through current dir in random order, calls  mpv to play each item in alphab. order
# if called with mpar arg1 arg2; then this script calls mpv with each arg in random order, but treats directories as something to take items from and randomize the items

#once every item is played, this script exits.



hash unsort || { echo pls install unsort so I can randomize things;exit;}


terminal_title () { # pass one filename with path
title=`basename "$1"`
cape_code="\033]0;${title:0:72}\007" #echo "$title"  #get escape codes for title change, then use bash parameter expansion to select only first few dozen characters
printf %b "${cape_code}";
}



echo '**** typing q  quits mpv to next track/dir ****'
echo '**** control-c  quits mpv and this script  ****'

mpar () # new way of doing this this works: ls | mpv --playlist=-
{
    if [ $# = 1 ]; then
        shimt "$1"/* | unsort -r | parallel -m --tty mpv --vid=no;
    else
        shimt * | unsort -r | parallel -m --tty mpv --vid=no;
    fi
}
thingis () {  #basically take each argument, and echo to stdout a globbed result,
	if [ $# = 0 ]; then
		shimt *|unsort -r   #actually random sort later also
	else
		for a
		do
			if [ -d "$a" ]
			then shimt "$a"/*  # ha
			else echo "$PWD/$a"
			fi
		done
	fi;}


shimt ()  #echo each argument to stdout
{
    for a in "$@"
    do     if  [[ ${a:0:1} == "/" ]]  # handle full paths, so we don't try and fix them up
   	 then echo "$a"
	 else echo "$PWD/$a"
	fi
    done
}

# this loop reads though the pipe, randomizes and calls mpv for each line
while read -r line  # -r because my files have backslashes.
do
#echo "$line" ;continue
	terminal_title "$line"
	mpv "$line" --vid=no --load-scripts=no $mpv_audiofilter
        retval=$?  #4 is ctrl-c; 2 is file err
        if [ 4 = $retval ]
        then exit
        fi

done < <( thingis "$@"|unsort -r )

exit # played everything
