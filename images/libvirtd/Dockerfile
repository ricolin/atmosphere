# SPDX-License-Identifier: Apache-2.0
# Atmosphere-Rebuild-Time: 2025-01-15T02:05:46Z

ARG REGISTRY
ARG RELEASE

FROM ${REGISTRY}/openstack-runtime:${RELEASE}
ADD --chmod=644 https://download.ceph.com/keys/release.gpg /etc/apt/trusted.gpg.d/ceph.gpg
COPY <<EOF /etc/apt/sources.list.d/ceph.list
deb http://download.ceph.com/debian-reef/ jammy main
EOF
RUN <<EOF bash -xe
apt-get update -qq
apt-get install -qq -y --no-install-recommends \
    ceph-common cgroup-tools dmidecode ebtables iproute2 ipxe-qemu kmod libtpms0 libvirt-clients libvirt-daemon-system openssh-client openvswitch-switch ovmf pm-utils qemu-block-extra qemu-efi qemu-kvm seabios swtpm swtpm-tools
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF
