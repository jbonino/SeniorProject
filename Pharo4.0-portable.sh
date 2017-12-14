#!/bin/bash

# path
DIR=`readlink -f $0` #resolve symlink
ROOT=`dirname $DIR` #obtain dir of the resolved path
LINUX="$ROOT/Contents/Linux"
RESOURCES="$ROOT/Contents/Resources"

# icon (note: gvfs-set-attribute is found in gvfs-bin on Ubuntu
# systems and it seems to require an absolute filename)
gvfs-set-attribute \
	"$0" \
	"metadata::custom-icon" \
	"file://$RESOURCES/Pharo.png" \
		2> /dev/null

# zenity is part of GNOME
image_count=`ls "$RESOURCES"/*.image 2>/dev/null |wc -l`
if which zenity &>/dev/null && [ "$image_count"  -ne 1 ]; then
	image=`zenity --title 'Select an image' --file-selection --filename "$RESOURCES/" --file-filter '*.image' --file-filter '*'`
else
	image="$RESOURCES/Pharo4.0-portable.image"
fi

# execute
exec "$LINUX/pharo" \
	-plugins "$LINUX" \
	-encoding utf8 \
	-vm-display-X11 \
	"$image"
