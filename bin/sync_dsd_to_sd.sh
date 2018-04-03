#!/bin/sh

echo "Syncing DSD content from heatwave music dsd to AK240 SD card"
rsync -av --progress --delete /Volumes/music/dsd/* /Volumes/AK240SD/dsd/
rsync -av --progress --delete /Volumes/music/Unorganized/* /Volumes/AK240SD/unorganized/
