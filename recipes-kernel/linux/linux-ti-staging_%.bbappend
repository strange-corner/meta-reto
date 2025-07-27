FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append := " file://procconfig.cfg"

KERNEL_CONFIG_FRAGMENTS:append := " ${WORKDIR}/procconfig.cfg"
# geht auch...? KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragment.cfg"
