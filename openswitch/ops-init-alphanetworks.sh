#!/bin/bash
set -x

# TODO: This is not the right place for this.  Must be recreated
#       after reboot since /var/run is tmpfs.
if [ ! -d /var/run/openvswitch ] ; then
    mkdir -p /var/run/openvswitch
fi

# Turn on manual fan control for SNX-60A0-486F
# TODO: Add GPIO support to OpenSwitch and set through there
if [ -d /sys/class/gpio/gpiochip452 ] ; then
    if [ ! -d /sys/class/gpio/gpio470 ] ; then
        echo '470' | tee --append /sys/class/gpio/export > /dev/null
        echo 'out' | tee --append /sys/class/gpio/gpio470/direction > /dev/null
    fi
    echo '0' | tee --append /sys/class/gpio/gpio470/value > /dev/null
fi

/usr/sbin/ops-init-namespace
