#!/usr/bin/env bash

# Update system
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
	brew update && brew upgrade
fi

if [ "$system_type" = "Linux" ]; then
	sudo apt-get update && sudo apt-get upgrade -u
fi

# Updating yadm submodules
yadm submodule update --recursive

if command -v nvim >/dev/null 2>&1; then
	echo "Updating nvim"
	nvim '+PlugInstall' '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
fi


