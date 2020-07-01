#!/bin/bash

# On screen keyboard shortcut
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'MenuKB'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'/usr/local/bin/toggle-screen-keyboard.sh'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Toggle Screen Keyboard'"

# Rotate screen shortcut
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'DOS'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'/usr/local/bin/rotate-screen.sh'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Rotate Screen'"

# Bind
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
