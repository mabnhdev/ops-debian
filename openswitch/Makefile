DISTRO?=openswitch
DESTDIR?=./tmp
SHADOW?=..
BUILDDIR?=../..

.PHONY: install clean

install:
	mkdir -p $(DESTDIR)/etc/$(DISTRO)/platform
	mkdir -p $(DESTDIR)/etc/init.d
	mkdir -p $(DESTDIR)/srv/www/api
	mkdir -p $(DESTDIR)/srv/www/static
	mkdir -p $(DESTDIR)/etc/lighttpd
	mkdir -p $(DESTDIR)/etc/ssl/certs
	mkdir -p $(DESTDIR)/usr/share/openvswitch
	cp -rL $(SHADOW)/ops-hw-config/* $(DESTDIR)/etc/$(DISTRO)/platform
	cp -L openswitch.sh $(DESTDIR)/etc/init.d
	cp -rL $(SHADOW)/ops-restapi/src/* $(DESTDIR)/srv/www/api
	cp -L $(BUILDDIR)/ops-restapi.json $(DESTDIR)/srv/www/api
	cp -L $(SHADOW)/ops-build/yocto/openswitch/meta-foss-openswitch/recipes-extended/lighttpd/lighttpd/lighttpd.conf  $(DESTDIR)/etc/lighttpd/ops-lighttpd.conf
	cp -rL $(SHADOW)/ops-webui/build/* $(DESTDIR)/srv/www/static
	cp -L $(SHADOW)/ops-restd/server.crt $(DESTDIR)/etc/ssl/certs
	cp -L $(SHADOW)/ops-restd/server-private.key $(DESTDIR)/etc/ssl/certs
	cp -L $(SHADOW)/ops/schema/*.extschema $(DESTDIR)/usr/share/openvswitch

clean:
	rm -rf $(DESTDIR) || true
