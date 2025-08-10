SYSTEMD_SERVICE:${PN} += "serial-getty@ttyGS0.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install:append() {
    # serial-getty@ttyGS0 needs usb-gadget that starts later
	# Remove Default-Enable-Link to getty.target
    rm -f ${D}${systemd_unitdir}/system/getty.target.wants/serial-getty@ttyGS0.service

    # Link to multi-user.target
    install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
    ln -sf ../serial-getty@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/serial-getty@ttyGS0.service
}
