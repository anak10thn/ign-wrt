#!/bin/bash
sudo yum install -y ncurses-devel openssl-devel zlib-devel git svn
cd ~
svn checkout svn://svn.openwrt.org/openwrt/trunk/ mr3020
 
cd ~/mr3020
cat > ~/mr3020/feeds.conf <<EOF
src-git packages https://github.com/openwrt/packages.git
src-git luci http://git.openwrt.org/project/luci.git
EOF
 
./scripts/feeds update -a
./scripts/feeds install -a
 
mkdir ~/.openwrt
cat > ~/.openwrt/defconfig <<EOF
CONFIG_TARGET_ar71xx=y
CONFIG_TARGET_ar71xx_generic=y
CONFIG_TARGET_ar71xx_generic_TLMR3020=y
# CONFIG_TARGET_ROOTFS_JFFS2 is not set
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-proto-3g=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_usb-modeswitch-data=y
EOF
 
# select the ar71xx target before running defconfig
echo CONFIG_TARGET_ar71xx=y > .config
 
# run defconfig if you are fine with the settings from above.
# builds an image for the TP-Link TL-MR3020 including
# support for LuCI web UI, 3G USB dongels and extroot. 
make defconfig
 
# or run menuconfig if you like to make additional changes
make menuconfig
 
# build OpenWrt with
make V=99 -j4
