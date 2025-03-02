#!/bin/bash
sudo apt install -y git
git clone https://github.com/cilynx/rtl88x2bu.git
cd rtl88x2bu
VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
sudo apt install -y rsync
sudo rsync -rvhP ./ /usr/src/rtl88x2bu-${VER}
sudo apt install -y dkms
sudo dkms add -m rtl88x2bu -v ${VER}
sudo dkms build -m rtl88x2bu -v ${VER}
sudo dkms install -m rtl88x2bu -v ${VER}
sudo modprobe 88x2bu
echo "ready! , is done, go to reboot the PC"
