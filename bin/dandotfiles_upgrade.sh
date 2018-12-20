#!/usr/bin/env bash

# Update system
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
	# Homebrew
	brew update && brew upgrade
	xargs brew install < ~/.brewlist.txt
	xargs brew cask install < ~/.brewlist.txt

	# Nix
	nix-channel --update nixpkgs

	# Neovim
	if command -v nvim >/dev/null 2>&1; then
		echo "Updating nvim"
		nvim '+PlugInstall' '+PlugUpdate' '+UpdateRemotePlugins' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
	fi
fi

