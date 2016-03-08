DISTRO?=openswitch
DESTDIR?=./tmp
SHADOW?=..
BUILDDIR?=../..

.PHONY: install clean

install:

# openswitch manual start/stop
	mkdir -p $(DESTDIR)/etc/init.d
	cp -L openswitch.sh $(DESTDIR)/etc/init.d

# ops-webui
	mkdir -p $(DESTDIR)/srv/www/static
	mkdir -p $(DESTDIR)/etc/lighttpd
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-foss-openswitch/recipes-extended/lighttpd/lighttpd/lighttpd.conf  $(DESTDIR)/etc/lighttpd/ops-lighttpd.conf
	cp -rL $(SHADOW)/ops-webui/build/* $(DESTDIR)/srv/www/static

# ops-restd
	mkdir -p $(DESTDIR)/srv/www/api
	mkdir -p $(DESTDIR)/etc/ssl/certs
	mkdir -p $(DESTDIR)/usr/share/openvswitch
	cp -rL $(SHADOW)/ops-restapi/src/* $(DESTDIR)/srv/www/api
	cp -L $(BUILDDIR)/ops-restapi.json $(DESTDIR)/srv/www/api
	cp -L $(SHADOW)/ops-restd/server.crt $(DESTDIR)/etc/ssl/certs
	cp -L $(SHADOW)/ops-restd/server-private.key $(DESTDIR)/etc/ssl/certs
	cp -L $(SHADOW)/ops/schema/*.extschema $(DESTDIR)/usr/share/openvswitch

# ops-hw-config
	mkdir -p $(DESTDIR)/etc/$(DISTRO)/platform
	cp -rL $(SHADOW)/ops-hw-config/* $(DESTDIR)/etc/$(DISTRO)/platform

# pam
	mkdir -p $(DESTDIR)/etc/pam.d
	mkdir -p $(DESTDIR)/etc/environment
	cp -L $(SHADOW)/ops-build/yocto/poky/meta/recipes-extended/pam/libpam/pam.d/common-auth $(DESTDIR)/etc/pam.d/common-auth-access
	cp -L $(SHADOW)/ops-build/yocto/poky/meta/recipes-extended/pam/libpam/pam.d/common-session $(DESTDIR)/etc/pam.d/common-session-access
	cp -L $(SHADOW)/ops-build/yocto/poky/meta/recipes-extended/pam/libpam/pam.d/common-account $(DESTDIR)/etc/pam.d/common-account-access
	cp -L $(SHADOW)/ops-build/yocto/poky/meta/recipes-extended/pam/libpam/pam.d/common-password $(DESTDIR)/etc/pam.d/common-password-access
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-foss-openswitch/recipes-extended/pam/libpam/pam.d/rest $(DESTDIR)/etc/pam.d
	chmod -R 644 $(DESTDIR)/etc/pam.d/rest
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-foss-openswitch/recipes-extended/pam/libpam/environment $(DESTDIR)/etc/environment
	chmod -R 777 $(DESTDIR)/etc/environment

# Systemd services
	mkdir -p $(DESTDIR)/usr/sbin
	mkdir -p $(DESTDIR)/lib/systemd/system
	mkdir -p $(DESTDIR)/etc/profile.d
	mkdir -p $(DESTDIR)/etc/ops/sysctl.d
	mkdir -p $(DESTDIR)/etc/raddb
	mkdir -p $(DESTDIR)/etc/sudoers.d
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/openvswitch/ops-openvswitch/ovsdb-server.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-init/ops-init.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-init/ops-profile.sh $(DESTDIR)/etc/profile.d/ops-profile
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-init/ops-vrf-sysctl-set.conf $(DESTDIR)/etc/ops/sysctl.d
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-init/ops-vrf-sysctl-unset.conf $(DESTDIR)/etc/ops/sysctl.d
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-sysd/ops-sysd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-fand/ops-fand.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-pmd/ops-pmd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-tempd/ops-tempd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-powerd/ops-powerd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-ledd/ops-ledd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/mgmt/ops-restd/restd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/mgmt/ops-cfgd/cfgd.service $(DESTDIR)/lib/systemd/system
#	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/mgmt/ops-ntpd/ops-ntpd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/l2/ops-vland/ops-vland.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/l2/ops-arpmgrd/ops-arpmgrd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/l2/ops-intfd/ops-intfd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/l3/ops-portd/ops-portd.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/openvswitch/ops-openvswitch/switchd_bcm.service $(DESTDIR)/lib/systemd/system
	sed -i -- "/^PIDFile=/c\PIDFile=/var/run/openvswitch/ops-switchd.pid" $(DESTDIR)/lib/systemd/system/switchd_bcm.service
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/utils/ops-aaa-utils/aaautils.service $(DESTDIR)/lib/systemd/system
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/utils/ops-aaa-utils/server $(DESTDIR)/etc/raddb
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/utils/ops-aaa-utils/useradd $(DESTDIR)/etc/sudoers.d
	cp -L $(SHADOW)/openswitch/ops-webui.service $(DESTDIR)/lib/systemd/system

# Insert alphanetworks-specific initialization
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-distro-openswitch/recipes-ops/platform/ops-init/ops-init.sh $(DESTDIR)/usr/sbin/ops-init-namespace
	cp -L $(SHADOW)/openswitch/ops-init-alphanetworks.sh $(DESTDIR)/usr/sbin/ops-init


# TODO
# ops-ntpd
# ops-bufmond
# ops-mgmt-intf
# ops-dhcp-tftp
# ops-ipsecd
# ops-lldpd
# ops-lacpd
# ops-quagga

clean:
	rm -rf $(DESTDIR) || true
