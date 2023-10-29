#!/bin/sh

OS=$(uname)

dotfile() {
	if [ -f "$HOME/.$1" ] ; then
		if [ -L "$HOME/.$1" ] ; then
			echo "File already linked: $1"
		else
			echo "File exists: $1. Probably you want to remove it and run update.sh again."
		fi
	else
		ln -s "$HOME/dotfiles/$1" "$HOME/.$1"
		echo "Linking file $1"
	fi
}

dotlaunchagent() {
	if [ -f "$HOME/Library/LaunchAgents/$1" ] ; then
		if [ -L "$HOME/Library/LaunchAgents/$1" ] ; then
			echo "LaunchAgent already linked: $1"
		else
			echo "LaunchAgent exists: $1. Probably you want to remove it and run update.sh again."
		fi
	else
		ln -s "$HOME/dotfiles/LaunchAgents/$1" "$HOME/Library/LaunchAgents/$1"
		echo "Linking file $1"
	fi
}

dotdir() {
	if [ -d "$HOME/.$1" ] ; then
		if [ -L "$HOME/.$1" ] ; then
			echo "Directory already linked: $1"
		else
			echo "Directory exists: $1. Probably you want to remove it and run update.sh again."
		fi
	else
		ln -s "$HOME/dotfiles/$1" "$HOME/.$1"
		echo "Linking directory $1"
	fi
}

dotconfigdir() {
	if [ -d "$HOME/.config/$1" ] ; then
		if [ -L "$HOME/.config/$1" ] ; then
			echo "Directory already linked: .config/$1"
		else
			echo "Directory exists: .config/$1. Probably you want to remove it and run update.sh again."
		fi
	else
		ln -s "$HOME/dotfiles/$1" "$HOME/.config/$1"
		echo "Linking directory .config/$1"
	fi
}

# Common
dotfile gitconfig
dotfile zshrc
dotfile tmux.conf
dotfile latexmkrc
dotdir vim
dotdir tmux
dotdir zsh
dotconfigdir ranger
dotconfigdir nvim

# Linux-specific
if [ "$OS" = "Linux" ] ; then
	dotfile Xresources
	dotdir mplayer
fi
