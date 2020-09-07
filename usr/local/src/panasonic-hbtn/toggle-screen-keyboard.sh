#!/bin/bash

# AUTHOR: cyberpunkprogrammer (cberpunkprogrammer@gmail.com) (github.com/cyberpunkprogrammer)
# Simple bash script to toggle the on screen keyboard on or off

if [ "$(dconf read /org/gnome/desktop/a11y/applications/screen-keyboard-enabled)" == 'false' ]
then
	dconf write /org/gnome/desktop/a11y/applications/screen-keyboard-enabled true
else
	dconf write /org/gnome/desktop/a11y/applications/screen-keyboard-enabled false
fi
