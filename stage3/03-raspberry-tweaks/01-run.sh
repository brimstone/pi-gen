#!/bin/bash -e

# override interfaces with version that supports a usb bridge
install -m 644 files/interfaces "${ROOTFS_DIR}/etc/network/interfaces"

# modify cmdline.txt to include g_ether and g_serial bits
install -m 644 files/cmdline.txt "${ROOTFS_DIR}/boot/"

# modify config.txt to support overlays
install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"

on_chroot << \EOF
systemctl enable getty@ttyGS0.service
EOF

# Setup rc.local to do the right thing with usb0
install -m 755 files/rc.local "${ROOTFS_DIR}/etc/rc.local"

# Setup dnsmasq
install -m 644 files/dnsmasq.conf "${ROOTFS_DIR}/etc/"

# modify /etc/issue to have code to not disable the screen
