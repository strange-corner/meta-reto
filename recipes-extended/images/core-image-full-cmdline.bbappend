# The kernel modules were missing. So add it here:
IMAGE_INSTALL:append = " kernel-modules usbutils usb-gadget"

# append consle via usbgagdet g_serial (TODO console not working yet)
# still need to start service: systemctl enable serial-getty@ttyGS0.service
# see https://0pointer.de/blog/projects/serial-console.html
SERIAL_CONSOLES:append = " 115200;ttyGS0"

# I want a little more space on /
IMAGE_ROOTFS_EXTRA_SPACE = "262144"

# Override entry found in mety-ti/meta-ti-bsp/conf/machine/include/ti33x.inc
# because I want this image flash into eMMC. Is that the way to do it?
UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk1p2"
