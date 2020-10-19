#!/bin/bash

KVERSION=$(uname -r)

# Check to make sure script is being run as a non-root user
if ! [[ $EUID -ne 0 ]]; then
        echo "You must run this script as a non-root user for keyboard shortcuts to work, try './install.sh'"
        exit 1
fi

sudo mkdir -p /lib/modules/$KVERSION/kernel/drivers/panasonic-hbtn/
sudo cp $(pwd)/panasonic-hbtn.ko /lib/modules/$KVERSION/kernel/drivers/panasonic-hbtn/
sudo cp $(pwd)/panasonic-hbtn.conf /etc/modules-load.d/
sudo cp $(pwd)/rotate-screen.sh /usr/local/bin/
sudo cp $(pwd)/toggle-screen-keyboard.sh /usr/local/bin/

# On screen keyboard shortcut
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'MenuKB'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'/usr/local/bin/toggle-screen-keyboard.sh'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Toggle Screen Keyboard'"

# Rotate screen shortcut
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'DOS'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'/usr/local/bin/rotate-screen.sh'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Rotate Screen'"

# Bind keyboard shortcuts
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

sudo depmod
sudo modprobe panasonic-hbtn
sudo update-initramfs -u
