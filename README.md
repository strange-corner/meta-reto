# meta-reto
This builds a custom Yocto image for Beaglebone Black. It adds some features to the image from meta-ti:
 * swupdate
 * usb-gadget (COM port, RNDIS)


Dependencies
============
See repo manifest at https://github.com/strange-corner/meta-reto-manifest

Contributing
=======

To contribute to this layer you should open a GitHub pull request for review.

Table of Contents
=================

  I. Adding the meta-reto layer to your build

I. Adding the meta-reto layer to your build
=================================================

Run 'bitbake-layers add-layer meta-reto'

Installing the image
====================
* Boot from SD card by holding button S2 while switching on power.
* Transfer image (core-image-full-cmdline*.wic.xz) to target with SFTP
* extract it: ``xz -d core-image-full-cmdline-am335x-evm.rootfs-20250907052752.wic.xz``
* write it to eMMC: ``sudo dd if=core-image-full-cmdline-am335x-evm.rootfs-20250907052752.wic of=/dev/mmcblk1 bs=1M status=progress``
* Transfer and run set_bl_params.sh on target (needed because open issue).