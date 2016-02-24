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

RUNAS="root"

OVSDB_LOC="/var/run/openvswitch"
OVSDB_CFG_LOC="/var/run/openvswitch"
OVSDB_LOG_LOC="/var/log/openvswitch"
OVSDB_SCHEMA_LOC="/usr/share/openvswitch"
PIDDIR="$OVSDB_LOC"

OVSDB_LOG="-vSYSLOG:INFO"
# OVSDB_LOG="-vFILE:DBG --log-file=${OVSDB_LOG_LOC}/ovsdb-server.log"

# DAEMONS are listed in order they should be started.  They should be stopped in
# the reverse order.
DAEMONS="ovsdb-server ops-sysd ops-cfgd ops-switchd ops-arpmgrd ops-fand ops-intfd ops-ledd ops-pmd ops-portd ops-powerd ops-tempd ops-vland ops-restd"

# Debugging levels
# -v or -vdbg = maximum verbosity (very chatty)
# -voff -vemer -verr -vwarn -vinfo -vdbg
DEBUG_LVL=-vinfo
DAEMON_ARGS="$DEBUG_LVL"

start() {

    # Turn on manual fan control for SNX-60A0-486F
    # TODO: Add GPIO support to OpenSwitch and set through there
    if [ -d /sys/class/gpio/gpiochip452 ] ; then
        if [ ! -d /sys/class/gpio/gpio470 ] ; then
            echo '470' | tee --append /sys/class/gpio/export > /dev/null
            echo 'out' | tee --append /sys/class/gpio/gpio470/direction > /dev/null
        fi
        echo '0' | tee --append /sys/class/gpio/gpio470/value > /dev/null
    fi

    # Create the runtime databases
    if [ ! -f ${OVSDB_LOC}/ovsdb.db ] ; then
        ovsdb-tool create ${OVSDB_LOC}/ovsdb.db ${OVSDB_SCHEMA_LOC}/vswitch.ovsschema
    fi
    if [ ! -f ${OVSDB_CFG_LOC}/config.db ] ; then
        ovsdb-tool create ${OVSDB_CFG_LOC}/config.db ${OVSDB_SCHEMA_LOC}/configdb.ovsschema
    fi
    if [ ! -f ${OVSDB_CFG_LOC}/dhcp_leases.db ] ; then
        ovsdb-tool create ${OVSDB_CFG_LOC}/dhcp_leases.db ${OVSDB_SCHEMA_LOC}/dhcp_leases.ovsschema
    fi

    rc="1"
    for i in $DAEMONS ; do
        PIDFILE="$PIDDIR/$i.pid"
        if [ -f $PIDFILE ] ; then
            echo "$i already running" >&2
        else
            case $i in
                ovsdb-server)
                    SCRIPT="ovsdb-server --remote=punix:${OVSDB_LOC}/db.sock --no-chdir ${OVSDB_LOG} ${OVSDB_LOC}/ovsdb.db ${OVSDB_CFG_LOC}/dhcp_leases.db ${OVSDB_CFG_LOC}/config.db"
                    ;;
                ops-restd)
                    SCRIPT="python /usr/bin/restd.py"
                    ;;
                ops-switchd)
                    SCRIPT="ops-switchd $DAEMON_ARGS"
                    ;;
                *)
                    SCRIPT="/usr/bin/$i $DAEMON_ARGS"
                    ;;
            esac
            echo "Starting $i..." >&2
            local CMD="$SCRIPT & echo \$!"
            su -c "$CMD" $RUNAS > "$PIDFILE"
            echo "$i started" >&2
            rc="0"
        fi
    done

    # Save the default lighttpd home page and resplace it with the WebUI
    # then restart the web server with the new homepage.
    if [ ! -f "/etc/lighttpd/orig-lighttpd.conf" ]; then
        cp /etc/lighttpd/lighttpd.conf /etc/lighttpd/orig-lighttpd.conf
    fi
    if [ -f "/etc/lighttpd/ops-lighttpd.conf" ]; then
        cp /etc/lighttpd/ops-lighttpd.conf /etc/lighttpd/lighttpd.conf
        /etc/init.d/lighttpd restart > /dev/null
    else
        echo 'No OpenSwitch website installed.' >&2
    fi
    return $rc
}

stop() {

    rc="1"

    # Take down the daemons in revers order in which they were started.
    REV_DAEMONS=$(echo "$DAEMONS" | awk '{for(i=NF;i>0;--i) printf("%s ",$i); }')
    for i in $REV_DAEMONS ; do
        PIDFILE="$PIDDIR/$i.pid"
        if [ ! -f $PIDFILE ] ; then
            echo "$i is not running." >&2
        else
            CTLFILE="$PIDDIR/$(cat "$PIDFILE")/$i.ctl"
            echo "Stopping $i pid=$(cat "$PIDFILE")..." >&2
            kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE" && rm -f "$CTLFILE"
            echo "$i stopped" >&2
            rc="0"
        fi
    done

    # Restore the default lighttpd home page then restart the web server
    # with the new homepage.
    if [ -f "/etc/lighttpd/orig-lighttpd.conf" ]; then
        cp /etc/lighttpd/orig-lighttpd.conf /etc/lighttpd/lighttpd.conf
    fi
    if [ -f /etc/lighttpd/lighttpd.conf ] ; then
        /etc/init.d/lighttpd restart > /dev/null
    fi

    # Break any DB locks
    rm -f $OVSDB_LOC/.*.~lock~ > /dev/null || true

    # Delete the runtime databases
    rm -f $OVSDB_LOC/*.db > /dev/null || true
    rm -f $OVSDB_CFG_LOC/*.db > /dev/null || true

    # Turn off manual fan control for SNX-60A0-486F
    # TODO: Add GPIO support to OpenSwitch and set through there
    if [ -d /sys/class/gpio/gpiochip452 ] ; then
        if [ -d /sys/class/gpio/gpio470 ] ; then
            echo '1' | tee --append /sys/class/gpio/gpio470/value > /dev/null
            echo '470' | tee --append /sys/class/gpio/unexport > /dev/null
        fi
    fi

    return $rc
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
