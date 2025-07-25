#!/bin/sh

modprobe g_multi
udevadm settle -t 5 || :

GADGET_DIR=/sys/kernel/config/usb_gadget/g1

mkdir -p ${GADGET_DIR}
cd ${GADGET_DIR}

echo 0x1d6b > idVendor  # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice
echo 0x0200 > bcdUSB

echo 0xEF > bDeviceClass
echo 0x02 > bDeviceSubClass
echo 0x01 > bDeviceProtocol

mkdir -p strings/0x409
echo "deadbeef9100" > strings/0x409/serialnumber
echo "reto's BBB" > strings/0x409/manufacturer
echo "USB Device" > strings/0x409/product

mkdir -p configs/c.1/strings/0x409
echo 120 > configs/c.1/MaxPower

# Don't mix the parts (do all for rndis, then acm, ... or it will not work)

# rndis (ethernet) part
mkdir -p functions/rndis.usb0
# alternative: functions/ecm.usb0
# linux host: mkdir -p functions/ncm.usb0

# OS descriptors
echo 1 > os_desc/use
echo 0xcd > os_desc/b_vendor_code
echo MSFT100 > os_desc/qw_sign
echo ef > functions/rndis.usb0/class
echo 04 > functions/rndis.usb0/subclass
echo 01 > functions/rndis.usb0/protocol
echo "RNDIS" > functions/rndis.usb0/os_desc/interface.rndis/compatible_id
echo "5162001" > functions/rndis.usb0/os_desc/interface.rndis/sub_compatible_id

ln -s functions/rndis.usb0 configs/c.1/

# acm (serial) part
mkdir -p functions/acm.usb0
ln -s functions/acm.usb0 configs/c.1/

ln -s configs/c.1 os_desc

echo musb-hdrc.0 > UDC
