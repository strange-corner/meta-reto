DESCRIPTION = "USB gadget network setup"
# just set it temporarily to closed until the LIC_FILES_CHKSUM issue is solved:
LICENSE = "CLOSED"

SRC_URI += "file://usb-gadget-setup.sh"
SRC_URI += "file://usb-gadget-setup.service"
SRC_URI += "file://usb0.network"
SRC_URI += "file://usb1.network"

SYSTEMD_SERVICE:${PN} = "usb-gadget-setup.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

SYSTEMD_SERVICE:getty-ttyGS0 = "serial-getty@ttyGS0.service"
SYSTEMD_AUTO_ENABLE:getty-ttyGS0 = "enable"

do_install() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/usb0.network ${D}${sysconfdir}/systemd/network/
    install -m 0644 ${WORKDIR}/usb1.network ${D}${sysconfdir}/systemd/network/

    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/usb-gadget-setup.sh ${D}${bindir}/usb-gadget-setup.sh
    
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/usb-gadget-setup.service ${D}${systemd_system_unitdir}/usb-gadget-setup.service
}

FILES:${PN} += "${bindir}/usb-gadget-setup.sh"
FILES:${PN} += "${systemd_system_unitdir}/usb-gadget-setup.service"
