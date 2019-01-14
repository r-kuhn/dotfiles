#!/usr/bin/env bash

declare -a mas_apps=(
	405399194 # Kindle
	409183694 # Keynote
	587512244 # Kaleidoscope
	413965349 # Soulver
	1091189122 # Bear
	1107421413 # 1Blocker
	419330170 # Moom
	409201541 # Pages
	407963104 # Pixelmator
	1096330984 # PDFpen 8
	585829637 # Todoist
	1039633667 # Irvue
	411643860 # DaisyDisk
	409203825 # Numbers
	1333542190 # 1Password 7
)

for app in "${mas_apps[@]}"; do
	mas install "$app"
done
