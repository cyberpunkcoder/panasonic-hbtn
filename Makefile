obj-m = panasonic-hbtn.o

KVERSION ?= $(shell uname -r)

all:
	make -C /lib/modules/$(KVERSION)/build M=$(shell pwd) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(shell pwd) clean
install:
	sudo mkdir -p /lib/modules/$KVERSION/kernel/drivers/panasonic-hbtn/
	sudo cp $(pwd)panasonic-hbtn.ko /lib/modules/$KVERSION/kernel/drivers/panasonic-hbtn/
	sudo cp $(pwd)panasonic-hbtn.conf /etc/modules-load.d/
	sudo cp $(pwd)rotate-screen.sh /usr/local/bin/
	sudo cp $(pwd)toggle-screen-keyboard.sh /usr/local/bin/

	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'MenuKB'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'/usr/local/bin/toggle-screen-keyboard.sh'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Toggle Screen Keyboard'"

	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'DOS'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'/usr/local/bin/rotate-screen.sh'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Rotate Screen'"

	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

	sudo depmod -a
	sudo modprobe panasonic-hbtn
	sudo update-initramfs -u
