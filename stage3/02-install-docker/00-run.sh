#!/bin/bash -ex

install -m 644 files/docker.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

on_chroot apt-key add - < files/docker.gpg.key
on_chroot << EOF
apt-get update
apt-get install -y docker-ce=17.07.0~ce~rc1-0~raspbian
EOF

on_chroot  << EOF
usermod -aG docker pi
EOF
