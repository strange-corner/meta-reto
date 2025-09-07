# disable the service, otherwise it justs fail with a timeout.
# I plan to call it manually on console for the moment.
SYSTEMD_AUTO_ENABLE:${PN} = "disable"
