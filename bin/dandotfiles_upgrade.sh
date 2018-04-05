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
curl -o ~/.zprezto/modules/prompt/functions/prompt_statusline_setup https://raw.githubusercontent.com/el1t/statusline/master/prezto/prompt_statusline_setup

if command -v nvim >/dev/null 2>&1; then
	echo "Updating nvim"
	nvim '+PlugInstall' '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
fi

