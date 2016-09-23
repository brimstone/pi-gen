#!/bin/bash -e

install -m 644 files/docker.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

install -m 644 files/docker.service "${ROOTFS_DIR}/etc/systemd/system/docker.service"

on_chroot apt-key add - < files/docker.gpg.key
on_chroot sh -e - << EOF
apt-get update
apt-get install -y docker-engine
EOF

on_chroot sh -e - << \EOF
for GRP in docker; do
  adduser pi $GRP
done
EOF
