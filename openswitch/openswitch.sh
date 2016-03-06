#!/bin/sh
# set -x
### BEGIN INIT INFO
# Provides:          openswitch
# Required-Start:    $local_fs $network $named $time $syslog
# Required-Stop:     $local_fs $network $named $time $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Description:       Standalone OpenSwitch controls and monitors a whitebox network switch.
### END INIT INFO

SERVICES="ovsdb-server ops-init ops-sysd aaautils ops-fand ops-intfd ops-ledd ops-pmd ops-powerd ops-tempd ops-vland switchd_bcm ops-arpmgrd ops-portd cfgd restd ops-webui"

start() {
    for svc in $SERVICES ; do
        systemctl start $SERVICES &
        sleep 1
    done
    return 0
}

stop() {
    REV_SERVICES="$(echo "$SERVICES" | awk '{for(i=NF;i>0;--i) printf("%s ",$i); }')"
    systemctl stop $REV_SERVICES  
    return 0
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
esac
