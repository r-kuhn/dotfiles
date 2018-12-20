#!/usr/bin/env bash

# Update system
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
	brew update && brew upgrade
	nix-channel --update nixpkgs
	nix-env --set-flag priority 2 darwinEnv
	nix-env --set-flag priority 8 home-manager-path
	nix-env -i darwinEnv

	nix-env --set-flag priority 2 darwinEnv
	nix-env --set-flag priority 8 home-manager-path
	home-manager switch

	if command -v nvim >/dev/null 2>&1; then
		echo "Updating nvim"
		nvim '+PlugInstall' '+PlugUpdate' '+UpdateRemotePlugins' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
	fi
fi

