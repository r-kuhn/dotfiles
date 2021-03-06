#!/usr/bin/env bash

# Update system
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
	# Homebrew
	brew update && brew upgrade && brew cask upgrade
	cd ~ && brew bundle

	# Nix
	if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then
		nix-channel --update nixpkgs
	fi

	npm install -g npm
	npm config set update-notifier false

  "${HOME}/bin/install-more-tools.sh"

  # Upgrade all pip packages
  pip3 freeze — local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
fi


if [ "$system_type" = "Linux" ]; then
  yay -Syu
	npm install -g npm
	npm config set update-notifier false

  "${HOME}/bin/install-more-tools.sh"

  # Upgrade all pip packages
  pip3 freeze — local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U --user
fi

# Neovim
if command -v nvim >/dev/null 2>&1; then
	echo "Updating nvim"
	nvim '+PlugInstall' '+PlugUpdate' '+UpdateRemotePlugins' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
fi
