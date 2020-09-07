# panasonic-hbtn
Panasonic Toughbook CF-19 Tablet Button driver for Linux updated Sep 7 2020

## Usage

Clone the repo into any directory.
```bash
git clone https://github.com/cyberpunkprogrammer/panasonic-hbtn.git
cd panasonic-hbtn
```
Install the panasonic-hbtn driver for Ubuntu
```bash
./install.sh
```
And done!

Source code for the driver can be found in the /src folder.
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
