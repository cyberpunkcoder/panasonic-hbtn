obj-m = panasonic-hbtn.o

KVERSION ?= $(shell uname -r)

all:
	make -C /lib/modules/$(KVERSION)/build M=$(shell pwd) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(shell pwd) clean
install:
	mkdir -p /lib/modules/$(KVERSION)/kernel/drivers/panasonic-hbtn/
	cp $(shell pwd)/panasonic-hbtn.ko /lib/modules/$(KVERSION)/kernel/drivers/panasonic-hbtn/
	echo "panasonic-hbtn" > /etc/modules-load.d/panasonic-hbtn.conf
	cp $(shell pwd)/rotate-screen.sh /usr/local/bin/
	cp $(shell pwd)/toggle-screen-keyboard.sh /usr/local/bin/

	echo "Binding hotkeys"

	# On screen keyboard shortcut
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'MenuKB'"
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'/usr/local/bin/toggle-screen-keyboard.sh'"
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Toggle Screen Keyboard'"

	# Rotate screen shortcut
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'DOS'"
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'/usr/local/bin/rotate-screen.sh'"
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Rotate Screen'"

	# Bind
	shell dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

