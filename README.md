# juriko-wrt MR3020
## config `make menu_config`
```
- Set Target System = Atheros AR7xxx/AR9xxx
- Set Target Profile = TP-LINK TL-MR3020
Utilities->disc->
- fdisk
- swap-utils
Utilities->Filesystem->
- e2fsprogs
Base system->
- block-mount
```
## config `make kernel_menuconfig`
```
Device Drivers->SCSI device support->
- SCSI device support
- SCSI disk support
Device Drivers->USB Support->
- Support for Host-side USB
- USB announce new devices
- USB device filesystem
- EHCI HCD (USB 2.0) Support
- OHCI HCD support
- USB OHCI support for the Atheros AR71xx/AR7240 SoCs
- USB Modem (CDC ACM) support
-USB Mass Storage support

Device Drivers->Multimedia support->Video capture adapters->V4L USB devices->
- USB Video class (UVC)

File systems->
- Ext3 journalling file system support
- The extendded 4 (ext4) filesystem
```
## build image
```
make image PROFILE=TLMR3020 PACKAGES="luci nodogsplash"
```
## flashing image
```
mtd -r write image.bin firmware
```
