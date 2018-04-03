#!/usr/bin/env bash


# Updating yadm submodules
yadm submodule update --recursive

if command -v nvim >/dev/null 2>&1; then
	echo "Updating nvim"
	nvim '+PlugInstall' '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+PlugUpgrade' '+qall'
fi
