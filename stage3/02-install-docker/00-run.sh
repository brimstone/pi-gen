#!/bin/bash -ex

install -m 644 files/docker.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

install -m 644 files/docker.service "${ROOTFS_DIR}/etc/systemd/system/docker.service"

on_chroot apt-key add - < files/docker.gpg.key
on_chroot << EOF
apt-get update
apt-get install -y docker-engine
EOF

on_chroot  << EOF
usermod -aG docker pi
EOF
