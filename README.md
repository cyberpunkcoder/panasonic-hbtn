# panasonic-hbtn
Panasonic Toughbook CF-19 Tablet Button driver for Linux updated Jul 1 2020

## Usage

Clone the repo into any directory.
```bash
git clone https://github.com/cyberpunkprogrammer/panasonic-hbtn.git
```

Move files to appropriate system directories they are found in this download.
```bash
cp -r panasonic-hbtn/usr/local/src/panasonic-hbtn /usr/local/src/panasonic-hbtn
cp -r panasonic-hbtn/usr/local/bin /usr/local/bin
```

Make and install the driver.
```bash
cd /usr/local/src/panasonic-hbtn
make all
make install

depmod -a
modprobe panasonic-hbtn
cd /usr/local/bin
sudo ./hotkeys.sh
```

Then try out if those buttons are in working order. 

Finally, 
```bash
update-initramfs -u
```
Tested with CF-19Z MK8 with Ubuntu 20.04

Credit to others who came before me!
https://github.com/hevz/panasonic-hbtn |
https://github.com/xylo04/panasonic-hbtn |
https://github.com/Sockb4t/panasonic-hbtn |
https://github.com/HondaRulez/panasonic-hbtn |
https://github.com/philenotfound/panasonic-hbtn
