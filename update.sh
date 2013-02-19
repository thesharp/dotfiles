#!/bin/bash

OS=`uname`

function dotfile {
	if [ -f $HOME/.$1 ] ; then
		echo "File exists: $1"
	else
		ln -s $HOME/dotfiles/$1 $HOME/.$1
		echo "Linking file $1"
	fi
}

function dotdir {
	if [ -d $HOME/.$1 ] ; then
		echo "Directory exists: $1"
	else
		ln -s $HOME/dotfiles/$1 $HOME/.$1
		echo "Linking directory $1"
	fi
}

# Common
dotfile vimrc
dotfile gitconfig
dotfile bashrc
dotfile screenrc
dotdir vim

# Darwin-specific
if [ $OS == "Darwin" ] && [ ! -e $HOME/.bash_profile ] ; then
	ln -s $HOME/.bashrc $HOME/.bash_profile
fi

# Linux-specific
if [ $OS == "Linux" ] ; then
	dotfile Xresources
	dotfile muttrc
	dotdir mplayer
	dotdir mutt
fi
