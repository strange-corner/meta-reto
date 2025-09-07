# the rootfs has to be set afterwards (open issue)
sudo mount /dev/mmcblk1p1 /mnt
sudo sed -i 's|root=PARTUUID=${uuid}|root=/dev/mmcblk1p2|' /mnt/extlinux/extlinux.conf
cat /mnt/extlinux/extlinux.conf
sudo umount /mnt
