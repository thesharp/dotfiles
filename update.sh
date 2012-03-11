#!/bin/bash

function dotfile {
	if [ -f $HOME/.$1 ] ; then
		echo "File exists: $1"
	else
		ln -s $HOME/dotfiles/$1 $HOME/.$1
	fi
}

function dotdir {
	if [ -d $HOME/.$1 ] ; then
		echo "Directory exists: $1"
	else
		ln -s $HOME/dotfiles/$1 $HOME/.$1
	fi
}


dotfile vimrc
dotfile gitconfig
dotfile bashrc
dotfile Xresources

dotdir vim
dotdir mplayer
