#!/bin/bash -e
if [ ! -d ${ROOTFS_DIR} ]; then
	bootstrap jessie ${ROOTFS_DIR} http://mirror.ams1.nl.leaseweb.net/raspbian/raspbian/
fi
