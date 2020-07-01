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
