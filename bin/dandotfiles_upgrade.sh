#!/usr/bin/env bash

# Update system
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
	brew update && brew upgrade
	nix-channel --update nixpkgs
	nix-env -u '*'
fi

if [ "$system_type" = "Linux" ]; then
	if [ -e "/etc/arch-release" ]; then
		yay -Syyu
	else
		sudo apt-get update && sudo apt-get upgrade -u
	fi
fi

# Updating yadm submodules
yadm submodule update --recursive

if command -v nvim >/dev/null 2>&1; then
	echo "Updating nvim"
	nvim '+PlugInstall' '+PlugUpdate' '+UpdateRemotePlugins' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
fi

