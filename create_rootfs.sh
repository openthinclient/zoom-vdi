#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "please run this script with the zoom vdi plugin deb as an argument"
    exit
fi
cd $(dirname $0)

rm -rf package-rootfs

dpkg -x "$1" package-rootfs

cd package-rootfs

mkdir -p usr/lib/.omnissa/vdpService
mkdir -p usr/lib/x86_64-linux-gnu/freerdp3
mkdir -p opt/Citrix/ICAClient/config

ln -s /usr/lib/zoomvdi-universal-plugin/libZoomPlugin.so usr/lib/.omnissa/vdpService/libZoomMediaHorizon.so
ln -s /usr/lib/zoomvdi-universal-plugin/libZoomPlugin.so usr/lib/x86_64-linux-gnu/freerdp3/libZoomMediaAVD-client.so
ln -s /usr/lib/zoomvdi-universal-plugin/libZoomPlugin.so opt/Citrix/ICAClient/ZoomMedia.so

rm -r etc/udev/
rm -r usr/share/
