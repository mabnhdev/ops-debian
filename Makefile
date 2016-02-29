DISTRO ?= openswitch
export DISTRO
CONFIGURED_PLATFORM ?= debian
export CONFIGURED_PLATFORM

export BUILD_ROOT:=$(CURDIR)
ifneq ($(VERBOSE),)
 export VERBOSE
endif
export BUILDDIR:=$(BUILD_ROOT)/build
export SHADOW:=$(BUILDDIR)/shadow
export SRCDIR:=$(BUILD_ROOT)/src
export PATCHDIR:=$(BUILD_ROOT)/patches
export PKG_CONFIG_PATH:=$(BUILDDIR)/usr/lib/pkgconfig:$(BUILDDIR)/usr/local/lib/pkgconfig

export DEBEMAIL:="ops-dev@lists.openswitch.net"
export DEBFULLNAME:="OpenSwitch Developers"
export DH_VERBOSE=1

AAA-UTILS_REP:=ops-aaa-utils
AAA-UTILS_VERSION:=1.0-1
AAA-UTILS_DEB_TYPE:=all
AAA-UTILS_DEB_NAME:=python-ops-aaautilspamcfg
AAA-UTILS_DEB:=$(AAA-UTILS_DEB_NAME)_$(AAA-UTILS_VERSION)_$(AAA-UTILS_DEB_TYPE).deb
AAA-UTILS_TARGET:=$(SHADOW)/$(AAA-UTILS_REP)/deb_dist/$(AAA-UTILS_DEB)
AAA-UTILS_INSTALL:=$(BUILDDIR)/$(AAA-UTILS_DEB)

ARPMGRD_REP:=ops-arpmgrd
ARPMGRD_VERSION:=0.1.1
ARPMGRD_DEB_TYPE:=Linux
ARPMGRD_DEB_NAME:=$(ARPMGRD_REP)
ARPMGRD_DEB:=$(ARPMGRD_DEB_NAME)-$(ARPMGRD_VERSION)-$(ARPMGRD_DEB_TYPE).deb
ARPMGRD_TARGET:=$(SHADOW)/$(ARPMGRD_REP)/$(ARPMGRD_DEB)
ARPMGRD_INSTALL:=$(BUILDDIR)/$(ARPMGRD_DEB)

CFGD_REP:=ops-cfgd
CFGD_VERSION:=1.0-1
CFGD_DEB_TYPE:=all
CFGD_DEB_NAME:=python-ops-cfgd
CFGD_DEB:=$(CFGD_DEB_NAME)_$(CFGD_VERSION)_$(CFGD_DEB_TYPE).deb
CFGD_TARGET:=$(SHADOW)/$(CFGD_REP)/deb_dist/$(CFGD_DEB)
CFGD_INSTALL:=$(BUILDDIR)/$(CFGD_DEB)

CLI_REP:=ops-cli
CLI_VERSION:=0.1.0
CLI_PKG_VERSION=$(CLI_VERSION)-1
CLI_DEB_TYPE:=amd64
CLI_DEB_NAME:=$(CLI_REP)
CLI_DEV_DEB_NAME:=$(CLI_REP)-dev
CLI_DEB:=$(CLI_DEB_NAME)_$(CLI_PKG_VERSION)_$(CLI_DEB_TYPE).deb
CLI_DEV_DEB:=$(CLI_DEV_DEB_NAME)_$(CLI_PKG_VERSION)_$(CLI_DEB_TYPE).deb
CLI_TARGET:=$(SHADOW)/$(CLI_DEB)
CLI_DEV_TARGET:=$(SHADOW)/$(CLI_DEV_DEB)
CLI_INSTALL:=$(BUILDDIR)/$(CLI_DEB)
CLI_PC:=ops-cli.pc
CLI_PC_INSTALL:=$(BUILDDIR)/usr

CONFIG-YAML_REP:=ops-config-yaml
CONFIG-YAML_VERSION:=0.1.1
CONFIG-YAML_DEB_TYPE:=Linux
CONFIG-YAML_DEB_NAME:=config-yaml
CONFIG-YAML_DEB:=$(CONFIG-YAML_DEB_NAME)-$(CONFIG-YAML_VERSION)-$(CONFIG-YAML_DEB_TYPE).deb
CONFIG-YAML_TARGET:=$(SHADOW)/$(CONFIG-YAML_REP)/$(CONFIG-YAML_DEB)
CONFIG-YAML_INSTALL:=$(BUILDDIR)/$(CONFIG-YAML_DEB)
CONFIG-YAML_PC:=ops-config-yaml.pc
CONFIG-YAML_PC_INSTALL:=$(BUILDDIR)/usr/local

FAND_REP:=ops-fand
FAND_VERSION:=0.1.1
FAND_DEB_TYPE:=Linux
FAND_DEB_NAME:=$(FAND_REP)
FAND_DEB:=$(FAND_DEB_NAME)-$(FAND_VERSION)-$(FAND_DEB_TYPE).deb
FAND_TARGET:=$(SHADOW)/$(FAND_REP)/$(FAND_DEB)
FAND_INSTALL:=$(BUILDDIR)/$(FAND_DEB)

INTFD_REP:=ops-intfd
INTFD_VERSION:=0.1.1
INTFD_DEB_TYPE:=Linux
INTFD_DEB_NAME:=$(INTFD_REP)
INTFD_DEB:=$(INTFD_DEB_NAME)-$(INTFD_VERSION)-$(INTFD_DEB_TYPE).deb
INTFD_TARGET:=$(SHADOW)/$(INTFD_REP)/$(INTFD_DEB)
INTFD_INSTALL:=$(BUILDDIR)/$(INTFD_DEB)

LEDD_REP:=ops-ledd
LEDD_VERSION:=0.1.1
LEDD_DEB_TYPE:=Linux
LEDD_DEB_NAME:=$(LEDD_REP)
LEDD_DEB:=$(LEDD_DEB_NAME)-$(LEDD_VERSION)-$(LEDD_DEB_TYPE).deb
LEDD_TARGET:=$(SHADOW)/$(LEDD_REP)/$(LEDD_DEB)
LEDD_INSTALL:=$(BUILDDIR)/$(LEDD_DEB)

OPENSWITCH_REP:=openswitch
OPENSWITCH_VERSION:=1.1.5
OPENSWITCH_PKG_VERSION:=$(OPENSWITCH_VERSION)-1
OPENSWITCH_DEB_TYPE:=amd64
OPENSWITCH_DEB_NAME:=$(OPENSWITCH_REP)
OPENSWITCH_DEB:=$(OPENSWITCH_DEB_NAME)_$(OPENSWITCH_PKG_VERSION)_$(OPENSWITCH_DEB_TYPE).deb
OPENSWITCH_TARGET:=$(SHADOW)/$(OPENSWITCH_DEB)
OPENSWITCH_INSTALL:=$(BUILDDIR)/$(OPENSWITCH_DEB)

OPENVSWITCH_REP:=ops-openvswitch
OPENVSWITCH_VERSION:=2.3.90-1
OPENVSWITCH_DEB_TYPE:=amd64
OPENVSWITCH_DEB_NAME:=openvswitch-common
OPENVSWITCH_DEB:=$(OPENVSWITCH_DEB_NAME)_$(OPENVSWITCH_VERSION)_$(OPENVSWITCH_DEB_TYPE).deb
OPENVSWITCH_TARGET:=$(SHADOW)/$(OPENVSWITCH_DEB)
OPENVSWITCH_INSTALL:=$(BUILDDIR)/$(OPENVSWITCH_DEB)
OPENVSWITCH_SW_DEB_NAME:=openvswitch-switch
OPENVSWITCH_SW_DEB:=$(OPENVSWITCH_SW_DEB_NAME)_$(OPENVSWITCH_VERSION)_$(OPENVSWITCH_DEB_TYPE).deb
OPENVSWITCH_SW_TARGET:=$(SHADOW)/$(OPENVSWITCH_SW_DEB)
OPENVSWITCH_SW_INSTALL:=$(BUILDDIR)/$(OPENVSWITCH_SW_DEB)
OPENVSWITCH_PC:=libovscommon.pc
OPENVSWITCH_DB_PC:=libovsdb.pc
OPENVSWITCH_PC_INSTALL:=$(BUILDDIR)/usr

PMD_REP:=ops-pmd
PMD_VERSION:=0.1.1
PMD_DEB_TYPE:=Linux
PMD_DEB_NAME:=$(PMD_REP)
PMD_DEB:=$(PMD_DEB_NAME)-$(PMD_VERSION)-$(PMD_DEB_TYPE).deb
PMD_TARGET:=$(SHADOW)/$(PMD_REP)/$(PMD_DEB)
PMD_INSTALL:=$(BUILDDIR)/$(PMD_DEB)

POWERD_REP:=ops-powerd
POWERD_VERSION:=0.1.1
POWERD_DEB_TYPE:=Linux
POWERD_DEB_NAME:=$(POWERD_REP)
POWERD_DEB:=$(POWERD_DEB_NAME)-$(POWERD_VERSION)-$(POWERD_DEB_TYPE).deb
POWERD_TARGET:=$(SHADOW)/$(POWERD_REP)/$(POWERD_DEB)
POWERD_INSTALL:=$(BUILDDIR)/$(POWERD_DEB)

PORTD_REP:=ops-portd
PORTD_VERSION:=0.1.1
PORTD_DEB_TYPE:=Linux
PORTD_DEB_NAME:=$(PORTD_REP)
PORTD_DEB:=$(PORTD_DEB_NAME)-$(PORTD_VERSION)-$(PORTD_DEB_TYPE).deb
PORTD_TARGET:=$(SHADOW)/$(PORTD_REP)/$(PORTD_DEB)
PORTD_INSTALL:=$(BUILDDIR)/$(PORTD_DEB)

RESTD_REP:=ops-restd
RESTD_VERSION:=1.0-1
RESTD_DEB_TYPE:=all
RESTD_DEB_NAME:=python-restd
RESTD_DEB:=$(RESTD_DEB_NAME)_$(RESTD_VERSION)_$(RESTD_DEB_TYPE).deb
RESTD_TARGET:=$(SHADOW)/$(RESTD_REP)/deb_dist/$(RESTD_DEB)
RESTD_INSTALL:=$(BUILDDIR)/$(RESTD_DEB)

SYSD_REP:=ops-sysd
SYSD_VERSION:=0.1.1
SYSD_DEB_TYPE:=Linux
SYSD_DEB:=$(SYSD_REP)-$(SYSD_VERSION)-$(SYSD_DEB_TYPE).deb
SYSD_TARGET:=$(SHADOW)/$(SYSD_REP)/$(SYSD_DEB)
SYSD_INSTALL:=$(BUILDDIR)/$(SYSD_DEB)

UTILS_REP:=ops-utils
UTILS_VERSION:=0.1.1
UTILS_DEB_TYPE:=Linux
UTILS_DEB_NAME:=opsutils
UTILS_DEB:=$(UTILS_DEB_NAME)-$(UTILS_VERSION)-$(UTILS_DEB_TYPE).deb
UTILS_TARGET:=$(SHADOW)/$(UTILS_REP)/$(UTILS_DEB)
UTILS_INSTALL:=$(BUILDDIR)/$(UTILS_DEB)
UTILS_PC:=opsutils.pc
UTILS_PC_INSTALL:=$(BUILDDIR)/usr/local

SWITCHD-CONTAINER_REP:=ops-switchd-container-plugin
SWITCHD-CONTAINER_VERSION:=0.1.1
SWITCHD-CONTAINER_DEB_TYPE:=Linux
SWITCHD-CONTAINER_DEB_NAME:=ovs_sim_plugin
SWITCHD-CONTAINER_DEB:=$(SWITCHD-CONTAINER_DEB_NAME)-$(SWITCHD-CONTAINER_VERSION)-$(SWITCHD-CONTAINER_DEB_TYPE).deb
SWITCHD-CONTAINER_TARGET:=$(SHADOW)/$(SWITCHD-CONTAINER_REP)/$(SWITCHD-CONTAINER_DEB)
SWITCHD-CONTAINER_INSTALL:=$(BUILDDIR)/$(SWITCHD-CONTAINER_DEB)

TEMPD_REP:=ops-tempd
TEMPD_VERSION:=0.1.1
TEMPD_DEB_TYPE:=Linux
TEMPD_DEB_NAME:=$(TEMPD_REP)
TEMPD_DEB:=$(TEMPD_DEB_NAME)-$(TEMPD_VERSION)-$(TEMPD_DEB_TYPE).deb
TEMPD_TARGET:=$(SHADOW)/$(TEMPD_REP)/$(TEMPD_DEB)
TEMPD_INSTALL:=$(BUILDDIR)/$(TEMPD_DEB)

VLAND_REP:=ops-vland
VLAND_VERSION:=0.1.1
VLAND_DEB_TYPE:=Linux
VLAND_DEB_NAME:=$(VLAND_REP)
VLAND_DEB:=$(VLAND_DEB_NAME)-$(VLAND_VERSION)-$(VLAND_DEB_TYPE).deb
VLAND_TARGET:=$(SHADOW)/$(VLAND_REP)/$(VLAND_DEB)
VLAND_INSTALL:=$(BUILDDIR)/$(VLAND_DEB)

WEBUI_REP:=ops-webui
WEBUI_VERSION:=0.1.1
WEBUI_DEB_TYPE:=Linux
WEBUI_DEB_NAME:=$(WEBUI_REP)
WEBUI_DEB:=$(WEBUI_DEB_NAME)-$(WEBUI_VERSION)-$(WEBUI_DEB_TYPE).deb
WEBUI_TARGET:=$(SHADOW)/$(WEBUI_REP)/build

PYPI_LIBS:=python-tornado python-certifi python-inflect python-backports_abc
PYPI_BUILD:=$(patsubst python-%,$(BUILDDIR)/python-%-*.deb,$(PYPI_LIBS))
PYPI_SHADOW:=$(patsubst python-%,$(SHADOW)/python-%,$(PYPI_LIBS))
PYPI_CLEAN:=$(patsubst python-%,clean-python-%,$(PYPI_LIBS))
PYPI_CLEAN:=$(subst clean-python-backports_abc,,$(PYPI_CLEAN))
PYPI_DEBS:=$(subst python-backports_abc,python-backports-abc,$(PYPI_LIBS))

OPS_REP:=ops
HW_CONFIG_REP:=ops-hw-config
BUILD_REP:=ops-build
RESTAPI_REP:=ops-restapi
SHADOW_ONLY:=$(OPS_REP) $(HW_CONFIG_REP) $(BUILD_REP) $(RESTAPI_REP)
SHADOW_ONLY_SHADOW:=$(patsubst %,$(SHADOW)/%,$(SHADOW_ONLY))

ALL_REPOSITORIES:=$(SHADOW_ONLY) $(FAND_REP) $(ARPMGRD_REP) $(INTFD_REP) $(LEDD_REP) $(PMD_REP) $(POWERD_REP) $(PORTD_REP) $(SYSD_REP) $(TEMPD_REP) $(VLAND_REP) $(UTILS_REP) $(CONFIG-YAML_REP) $(SWITCHD-CONTAINER_REP) $(AAA-UTILS_REP) $(CFGD_REP) $(RESTD_REP) $(CLI_REP) $(OPENVSWITCH_REP) $(WEBUI_REP)
CHECKOUT_REPOSITORIES:=$(patsubst %,checkout-%,$(ALL_REPOSITORIES))
CLEAN_REPOSITORIES:=$(patsubst %,clean-%,$(ALL_REPOSITORIES)) clean-$(OPENSWITCH_REP)

ALL_APT_REPOS:=$(PYPI_DEBS) $(OPENSWITCH_DEB_NAME) $(OPENVSWITCH_DEB_NAME) $(OPENVSWITCH_SW_DEB_NAME) $(CLI_DEB_NAME) $(CLI_DEV_DEB_NAME) $(FAND_DEB_NAME) $(ARPMGRD_DEB_NAME) $(INTFD_DEB_NAME) $(LEDD_DEB_NAME) $(PMD_DEB_NAME) $(POWERD_DEB_NAME) $(PORTD_DEB_NAME) $(SYSD_DEB_NAME) $(TEMPD_DEB_NAME) $(VLAND_DEB_NAME) $(UTILS_DEB_NAME) $(CONFIG-YAML_DEB_NAME) $(SWITCHD-CONTAINER_DEB_NAME) $(AAA-UTILS_DEB_NAME) $(CFGD_DEB_NAME) $(RESTD_DEB_NAME) $(CLI_DEB_NAME) $(CLI_DEV_DEB_NAME)

# Useful variables
SHELL=/bin/bash
V=$(if $(VERBOSE),,@)
ECHO:=echo -e
MAKE=make $(if $(VERBOSE),,-s)
SUDO:=/usr/bin/sudo -E

ifneq ($(VERBOSE),)
 export VERBOSE
endif

define FATAL_ERROR
	$(ECHO) ; \
	 $(ECHO) "$(RED)ERROR:$(GRAY) $(1)" ; \
	 $(ECHO) ; \
	 exit 1
endef

# Console color escape sequences for bold/bright colors
ifeq ($(MAKE_TERMOUT),)
RED=\033[1;31m
BLUE=\033[1;34m
PURPLE=\033[1;35m
CYAN=\033[1;36m
#This is actually "reset"
GRAY=\033[0m
else
RED=
BLUE=
PURPLE=
CYAN=
GRAY=
endif

define BREAK_LINK
	test -L $(1) || cp -L $(1) /tmp/breaklink && unlink $(1) && mv /tmp/breaklink $(1)
endef

PROJECT:="OpenSwitch Debian project"
define CLONE
	git clone git://git.openswitch.net/openswitch/$(1) $(2)/$(1) ; \
	case $(1) in										\
	ops) commit=f2726d91757af1d9af873793d05c512f3b7f2c3e ;;					\
	ops-aaa-utils) commit=3d39be131a69e6f051daa7e9db447aeaa3989bb2 ;;			\
	ops-arpmgrd) commit=ea1fd6ea1a2fb03d602b9a0f8644ab0e508e4125 ;;				\
	ops-build) commit=987c2cc9597b315d718f61150f5666c0b4b1afec ;;				\
	ops-cfgd) commit=5c47886a92b9dcb96109dab9d4aab06c2932317a ;;				\
	ops-cli) commit=88347bf891076c7c45dcfd47a91ebadd31cb5c69 ;;				\
	ops-config-yaml) commit=3f931fe8ec25fb361fd84a09ec1aa0c39d8f82ff ;;			\
	ops-fand) commit=4df409e31b622dc70820b096b84ffce3248d39a2 ;;				\
	ops-hw-config) commit=f30626e39e0261e1fef323e75e6e9370c0daf6c8 ;;			\
	ops-intfd) commit=01f45eac388eb4a4b67e315c747807088370a6b3 ;;				\
	ops-ledd) commit=7b8e254a9bbbf857cef35f968731080ebd37e5aa ;;				\
	ops-openvswitch) commit=24f24bb73da413ba322b0bab1419fc6c9846ba94 ;;			\
	ops-pmd) commit=199386ebee8bf030813434492c2107878c30a28d ;;				\
	ops-portd) commit=4ae8acbee6cb224d8c3f634ed5b6711be6c6157d ;;				\
	ops-powerd) commit=f17b175c3000052f34f1af13798f53e4bde9e016 ;;				\
	ops-restapi) commit=f052b17043e8adaccacaaa7f1fe49847d98fcbab ;;				\
	ops-restd) commit=7fcfe8daae526d9302e5fc83837c0f6238336d1d ;;				\
	ops-switchd-container-plugin) commit=9bf84463dd5e1d2065790bc507f7376933741965 ;;	\
	ops-sysd) commit=f0c9b5c75d6b85f47598228ac26a1398e2ae8882 ;;				\
	ops-tempd) commit=ab49827ee980ea81481b7f5c3c753320f9f998f0 ;;				\
	ops-utils) commit=36eb102e120f8fea05080f344d23201d510e23a2 ;;				\
	ops-vland) commit=d2f81f2c721e7210fb1dec432bbb6e8857251d44 ;;				\
	ops-webui) commit=5c2baf6e0acb7466a42d98b598e56134e1b7b0e5 ;;				\
	esac ; \
	if [ ! -z "$$commit" ] ; then \
		$(ECHO) "$(CYAN)Rolling back $(1) to $(PROJECT) base $$commit.$(GRAY)" ; \
		cd $(2)/$(1) && git checkout $$commit . ; \
	fi ; \
	if [ -f $(PATCHDIR)/$(1).diff ] ; then							\
		$(ECHO) "$(PURPLE)Patch $(1) to $(PROJECT).$(GRAY)" ;				\
		cd $(2)/$(1) && patch -p 1 < $(PATCHDIR)/$(1).diff ;				\
	fi
endef

define MAKE_SHADOW
	$(V) if [ ! -d $(SHADOW) ] ; then mkdir -p $(SHADOW); fi
	$(V)cd $(SHADOW);								\
	if [ ! -d $(1) ] ; then								\
		if [ ! -d $(SRCDIR)/$(1) ] ; then					\
			$(call CLONE,$(1),$(SHADOW)) ;					\
		else									\
			if [[ "$(2)" == "COPY" ]] ; then				\
				cp -r $(SRCDIR)/$(1) $(SHADOW)/$(1);			\
			else								\
				mkdir $(1);						\
				lndir -silent $(SRCDIR)/$(1) $(1);			\
			fi								\
		fi ;									\
		case $(1) in								\
		ops-sysd)								\
			$(V)$(call BREAK_LINK,$(SHADOW)/ops-sysd/files/image.manifest);	\
			;;								\
		esac ;									\
	fi ;										\
	cd - > /dev/null
endef

CONFIG_PREFIX=/usr

DEBUG ?= 1
SIMULATION ?= 0

OPS_CMAKE_ARGS:=-DCMAKE_PREFIX_PATH:INTERNAL=$BUILD_BASE_DIR -DCMAKE_C_FLAGS=-DOPS -DCMAKE_CXX_FLAGS=-DOPS
ifeq ($(SIMULATION),1)
	OPS_CMAKE_ARGS+= -DPLATFORM_SIMULATION=ON
endif
ifeq ($(DEBUG),1)
	OPS_CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_FLAGS_DEBUG=-DO0 -DCMAKE_CXX_FLAGS_DEBUG=-DO0 
endif

define BUILD_OPS
	$(V)make -C $(SHADOW)/$(1) VERBOSE=1
	$(V)make -C $(SHADOW)/$(1) install DESTDIR=$(BUILDDIR)
	$(V)make -C $(SHADOW)/$(1) package
endef

define CLEAN_OPS
	$(V)make -C $(SHADOW)/$(1) clean > /dev/null || true
	$(V)rm -f $(2) $(3) > /dev/null || true
endef

define BUILD_AUTO
	$(V)cd $(SHADOW)/$(1) && (fakeroot debian/rules binary || true)
endef

define CLEAN_AUTO
	$(V)(cd $(SHADOW)/$(1) && fakeroot debian/rules clean > /dev/null) || true
	$(V)rm -f $(2) $(3) > /dev/null || true
endef

# TODO: dpkg-buildpackage requires superuser privileges and fakeroot won't run the python command
#       Need to figure out how to do this without a sudo...
define BUILD_PYTHON
	$(V)cd $(SHADOW)/$(1) && sudo python setup.py --command-packages=stdeb.command install_deb
endef

define CLEAN_PYTHON
	$(V)sudo rm -rf $(SHADOW)/$(1)/deb_dist > /dev/null || true
	$(V)sudo rm -rf $(SHADOW)/$(1)/dist > /dev/null || true
	$(V)sudo rm -rf $(SHADOW)/$(1)/*.egg-info > /dev/null || true
	$(V)rm -f $(2) $(3) > /dev/null || true
endef

define MAKE_TGZ
	tar -czf $(BUILDDIR)/$(1)_$(2).orig.tar.gz -X tar_exclude -C src/ $(1)
endef

# TODO - can't figure out how to prevent 'dpkg -x' from running for every *.pc
#        target, so fixup all *.pc every time.
define FIXUP_PC
	$(V)sed -i -- "/^prefix=*/c\prefix=$(shell echo $(1) | sed 's/\//\\\//g')" $(1)/lib/pkgconfig/*.pc || true
	$(V)sed -i -- "/^exec_prefix=*/c\exec_prefix=$$\{prefix\}" $(1)/lib/pkgconfig/*.pc || true
	$(V)sed -i -- "/^libdir=*/c\libdir=$$\{prefix\}/lib" $(1)/lib/pkgconfig/*.pc || true
	$(V)sed -i -- "/^includedir=*/c\includedir=$$\{prefix\}/include" $(1)/lib/pkgconfig/*.pc || true
	$(V)sed -i -- "s/ \/usr\/lib/ $(shell echo $(1)/lib | sed 's/\//\\\//g')/g" $(1)/lib/*.la || true
	$(V)sed -i -- "/^libdir=*/c\libdir=\'$(shell echo $(1)/lib | sed 's/\//\\\//g')\'" $(1)/lib/*.la || true
endef

.PHONY: all openswitch $(ALL_REPOSITORIES)
.PHONY: libovscommon.pc libovsdb.pc $(UTILS_PC) $(CONFIG-YAML_PC) $(CLI_PC)
.PHONY: clean distclean $(CLEAN_REPOSITORIES) $(CHECKOUT_REPOSITORIES) checkout-all

all: openswitch

#
# Shadows only
#

$(SHADOW_ONLY_SHADOW): $(SHADOW)/%:
	$(V)$(call MAKE_SHADOW,$*)

$(SHADOW_ONLY): %: $(SHADOW)/%

$(SHADOW_ONLY_CLEAN):

#
# ops
#

$(SHADOW)/ops/schema/dhcp_leases.extschema $(SHADOW)/ops/schema/vswitch.extschema $(SHADOW)/ops/schema/dhcp_leases.xml $(SHADOW)/ops/schema/vswitch.xml:  $(SHADOW)/ops

# ops-aaa-utils

$(SHADOW)/$(AAA-UTILS_REP):
	$(call MAKE_SHADOW,$(AAA-UTILS_REP))

$(SHADOW)/$(AAA-UTILS_REP)/setup.py: $(SHADOW)/$(AAA-UTILS_REP)

$(AAA-UTILS_TARGET): $(SHADOW)/$(AAA-UTILS_REP)/setup.py
	$(V)$(call BUILD_PYTHON,$(AAA-UTILS_REP))

$(AAA-UTILS_REP): $(AAA-UTILS_TARGET)
	$(V)cp $(AAA-UTILS_TARGET) $(AAA-UTILS_INSTALL)

clean-$(AAA-UTILS_REP):
	$(V)$(call CLEAN_PYTHON,$(AAA-UTILS_REP),$(AAA-UTILS_TARGET),$(AAA-UTILS_INSTALL))

# ops-arpmgrd

$(SHADOW)/$(ARPMGRD_REP):
	$(call MAKE_SHADOW,$(ARPMGRD_REP))

$(SHADOW)/$(ARPMGRD_REP)/CMakeLists.txt: $(SHADOW)/$(ARPMGRD_REP)

$(SHADOW)/$(ARPMGRD_REP)/Makefile: $(SHADOW)/$(ARPMGRD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(ARPMGRD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(ARPMGRD_TARGET): $(SHADOW)/$(ARPMGRD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(ARPMGRD_REP))

$(ARPMGRD_REP): libovscommon.pc libovsdb.pc $(ARPMGRD_TARGET)
	$(V)cp $(ARPMGRD_TARGET) $(ARPMGRD_INSTALL)

clean-$(ARPMGRD_REP):
	$(V)$(call CLEAN_OPS,$(ARPMGRD_REP),$(ARPMGRD_TARGET),$(ARPMGRD_INSTALL))

# ops-cfgd

$(SHADOW)/$(CFGD_REP):
	$(call MAKE_SHADOW,$(CFGD_REP))

$(SHADOW)/$(CFGD_REP)/setup.py: $(SHADOW)/$(CFGD_REP)

$(CFGD_TARGET): $(SHADOW)/$(CFGD_REP)/setup.py
	$(V)$(call BUILD_PYTHON,$(CFGD_REP))

$(CFGD_REP): $(CFGD_TARGET)
	$(V)cp $(CFGD_TARGET) $(CFGD_INSTALL)

clean-$(CFGD_REP):
	$(V)$(call CLEAN_PYTHON,$(CFGD_REP),$(CFGD_TARGET),$(CFGD_INSTALL))

# ops-cli

$(SHADOW)/$(CLI_REP):
#	$(V)$(call MAKE_SHADOW,$(CLI_REP))
#
# TODO - I have not been able to figure out why the debhelper ONLY succeeds if the shadow
#	 dir is generated from dh_make rather than just cp'd or lndir'd from the source
#	 directory.  A diff -r of a directory generated from a 'cp' or 'lndir' shows that
#	 they are identical in content to the dir generated by dh_make, but dh_install
#	 fails on the former.  Since the content is identical, I assume it is an issue
#        with some file attributes, but I'm stumped at the moment.
#
#        A clue may be that ops-cli-dev.* cannot be symbolic links.
#
#        NOTE WELL!!!!  $(SRCDIR)/ops-cli must exist for this to work.
#
	$(V)if [ ! -d $(SRCDIR)/$(CLI_REP) ] ; then			\
		echo ;							\
		echo "Must have \"$(SRCDIR)/$(CLI_REP)\" checked out.";	\
		echo ;							\
		exit 1;							\
	fi
	chmod 755 $(SRCDIR)/$(CLI_REP)/debian/rules
	$(V)$(call MAKE_TGZ,ops-cli,$(CLI_VERSION))
	$(V)tar -C $(SHADOW) -xzf $(BUILDDIR)/$(CLI_REP)_$(CLI_VERSION).orig.tar.gz
	$(V)cd $(SHADOW)/$(CLI_REP) && yes | dh_make -l -p $(CLI_REP)_$(CLI_VERSION) -f $(BUILDDIR)/$(CLI_REP)_$(CLI_VERSION).orig.tar.gz || true
	$(V)rm -f $(SHADOW)/$(CLI_REP)/debian/$(CLI_REP)1.*
	$(V)rm -f $(SHADOW)/$(CLI_REP)/debian/rules && ln -s $(SRCDIR)/$(CLI_REP)/debian/rules $(SHADOW)/$(CLI_REP)/debian/rules
#	$(V)cp -r $(SRCDIR)/$(CLI_REP)/debian/rules $(SHADOW)/$(CLI_REP)/debian
	$(V)rm -f $(SHADOW)/$(CLI_REP)/debian/changelog && ln -s $(SRCDIR)/$(CLI_REP)/debian/changelog $(SHADOW)/$(CLI_REP)/debian/changelog
#	$(V)cp -r $(SRCDIR)/$(CLI_REP)/debian/changelog $(SHADOW)/$(CLI_REP)/debian
	$(V)rm -f $(SHADOW)/$(CLI_REP)/debian/control && ln -s $(SRCDIR)/$(CLI_REP)/debian/control $(SHADOW)/$(CLI_REP)/debian/control
#	$(V)cp -r $(SRCDIR)/$(CLI_REP)/debian/control $(SHADOW)/$(CLI_REP)/debian
#	$(V)rm -f $(SHADOW)/$(CLI_REP)/debian/$(CLI_DEB_NAME).* && ln -s $(SRCDIR)/$(CLI_REP)/debian/$(CLI_DEB_NAME).* $(SHADOW)/$(CLI_REP)/debian
	$(V)cp -r $(SRCDIR)/$(CLI_REP)/debian/$(CLI_DEB_NAME).* $(SHADOW)/$(CLI_REP)/debian
#	$(V)rm -f $(SHADOW)/$(CLI_REP)/debian/$(CLI_DEV_DEB_NAME).* && ln -s $(SRCDIR)/$(CLI_REP)/debian/$(CLI_DEV_DEB_NAME).* $(SHADOW)/$(CLI_REP)/debian
	$(V)cp -r $(SRCDIR)/$(CLI_REP)/debian/$(CLI_DEV_DEB_NAME).* $(SHADOW)/$(CLI_REP)/debian

$(SHADOW)/$(CLI_REP)/Makefile.in: $(SHADOW)/$(CLI_REP)

$(CLI_DEV_TARGET) $(CLI_TARGET): $(SHADOW)/$(CLI_REP)/Makefile.in
	$(call BUILD_AUTO,$(CLI_REP))

$(CLI_REP): libovscommon.pc libovsdb.pc $(CLI_TARGET) $(CLI_DEV_TARGET)
	$(V)cp $(CLI_TARGET) $(BUILDDIR)
	$(V)cp $(CLI_DEV_TARGET) $(BUILDDIR)

clean-$(CLI_REP):
	$(call CLEAN_AUTO,$(CLI_REP),$(CLI_DEV_TARGET),$(CLI_INSTALL))
	$(V)rm -f $(CLI_TARGET) > /dev/null || true
	$(V)rm -f $(CLI_PC_INSTALL)/lib/pkgconfig/$(CLI_PC) > /dev/null || true

$(CLI_PC_INSTALL)/lib/pkgconfig/$(CLI_PC): $(CLI_DEV_TARGET)
	$(V)dpkg -x $(CLI_DEV_TARGET) $(BUILDDIR)
	$(V)$(call FIXUP_PC,$(CLI_PC_INSTALL),$@)

$(CLI_PC): $(CLI_PC_INSTALL)/lib/pkgconfig/$(CLI_PC)

# ops-config-yaml

$(SHADOW)/$(CONFIG-YAML_REP):
	$(call MAKE_SHADOW,$(CONFIG-YAML_REP))

$(SHADOW)/$(CONFIG-YAML_REP)/CMakeLists.txt: $(SHADOW)/$(CONFIG-YAML_REP)

$(SHADOW)/$(CONFIG-YAML_REP)/Makefile: $(SHADOW)/$(CONFIG-YAML_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(CONFIG-YAML_REP) && cmake $(OPS_CMAKE_ARGS) .

$(CONFIG-YAML_TARGET): $(SHADOW)/$(CONFIG-YAML_REP)/Makefile
	$(V)$(call BUILD_OPS,$(CONFIG-YAML_REP))

$(CONFIG-YAML_REP): libovscommon.pc libovsdb.pc $(CONFIG-YAML_TARGET)
	$(V)cp $(CONFIG-YAML_TARGET) $(CONFIG-YAML_INSTALL)

clean-$(CONFIG-YAML_REP):
	$(V)$(call CLEAN_OPS,$(CONFIG-YAML_REP),$(CONFIG-YAML_TARGET),$(CONFIG-YAML_INSTALL))
	$(V)rm -f $(CONFIG-YAML_PC_INSTALL)/lib/pkgconfig/$(CONFIG-YAML_PC) > /dev/null || true

$(CONFIG-YAML_PC_INSTALL)/lib/pkgconfig/$(CONFIG-YAML_PC): $(CONFIG-YAML_TARGET)
	$(V)dpkg -x $(CONFIG-YAML_TARGET) $(BUILDDIR)
	$(V)$(call FIXUP_PC,$(CONFIG-YAML_PC_INSTALL),$@)

$(CONFIG-YAML_PC): $(CONFIG-YAML_PC_INSTALL)/lib/pkgconfig/$(CONFIG-YAML_PC)

# ops-fand

$(SHADOW)/$(FAND_REP):
	$(call MAKE_SHADOW,$(FAND_REP))

$(SHADOW)/$(FAND_REP)/CMakeLists.txt: $(SHADOW)/$(FAND_REP)

$(SHADOW)/$(FAND_REP)/Makefile: $(SHADOW)/$(FAND_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(FAND_REP) && cmake $(OPS_CMAKE_ARGS) .

$(FAND_TARGET): $(SHADOW)/$(FAND_REP)/Makefile
	$(V)$(call BUILD_OPS,$(FAND_REP))

$(FAND_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc ops-cli.pc $(FAND_TARGET)
	$(V)cp $(FAND_TARGET) $(FAND_INSTALL)

clean-$(FAND_REP):
	$(V)$(call CLEAN_OPS,$(FAND_REP),$(FAND_TARGET),$(FAND_INSTALL))

# ops-intfd

$(SHADOW)/$(INTFD_REP):
	$(call MAKE_SHADOW,$(INTFD_REP))

$(SHADOW)/$(INTFD_REP)/CMakeLists.txt: $(SHADOW)/$(INTFD_REP)

$(SHADOW)/$(INTFD_REP)/Makefile: $(SHADOW)/$(INTFD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(INTFD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(INTFD_TARGET): $(SHADOW)/$(INTFD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(INTFD_REP))

$(INTFD_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc opsutils.pc $(INTFD_TARGET)
	$(V)cp $(INTFD_TARGET) $(INTFD_INSTALL)

clean-$(INTFD_REP):
	$(V)$(call CLEAN_OPS,$(INTFD_REP),$(INTFD_TARGET),$(INTFD_INSTALL))

# ops-ledd

$(SHADOW)/$(LEDD_REP):
	$(call MAKE_SHADOW,$(LEDD_REP))

$(SHADOW)/$(LEDD_REP)/CMakeLists.txt: $(SHADOW)/$(LEDD_REP)

$(SHADOW)/$(LEDD_REP)/Makefile: $(SHADOW)/$(LEDD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(LEDD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(LEDD_TARGET): $(SHADOW)/$(LEDD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(LEDD_REP))

$(LEDD_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc ops-cli.pc $(LEDD_TARGET)
	$(V)cp $(LEDD_TARGET) $(LEDD_INSTALL)

clean-$(LEDD_REP):
	$(V)$(call CLEAN_OPS,$(LEDD_REP),$(LEDD_TARGET),$(LEDD_INSTALL))

# ops-openvswitch

$(SHADOW)/$(OPENVSWITCH_REP):
	$(V)$(call MAKE_SHADOW,$(OPENVSWITCH_REP))

$(SHADOW)/$(OPENVSWITCH_REP)/Makefile.in: $(SHADOW)/$(OPENVSWITCH_REP)

$(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.xml $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.xml: $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/%.xml: $(SHADOW)/$(OPS_REP)/schema/%.xml
	$(V)ln -f $(SHADOW)/$(OPS_REP)/schema/$*.xml $@

$(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/configdb.ovsschema: $(SHADOW)/$(OPS_REP)/schema/configdb.ovsschema
	$(V)ln -f $(SHADOW)/$(OPS_REP)/schema/configdb.ovsschema $@

$(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.ovsschema $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.ovsschema: $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/%.ovsschema : $(SHADOW)/$(OPS_REP)/schema/%.extschema
	$(V)python $(SHADOW)/$(OPS_REP)/schema/sanitize.py $(SHADOW)/$(OPS_REP)/schema/$*.extschema $@

$(OPENVSWITCH_SW_TARGET) $(OPENVSWITCH_TARGET): $(SHADOW)/$(OPENVSWITCH_REP)/Makefile.in $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.ovsschema $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.ovsschema $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/configdb.ovsschema $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.xml $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.xml
	$(V)$(call BUILD_AUTO,$(OPENVSWITCH_REP))
	$(V)cp $(OPENVSWITCH_TARGET) $(BUILDDIR)
	$(V)cp $(OPENVSWITCH_SW_TARGET) $(BUILDDIR)

$(OPENVSWITCH_REP): $(OPENVSWITCH_SW_TARGET) $(OPENVSWITCH_TARGET)

$(OPENVSWITCH_PC_INSTALL)/lib/pkgconfig/$(OPENVSWITCH_PC) $(OPENVSWITCH_PC_INSTALL)/lib/pkgconfig/$(OPENVSWITCH_DB_PC): $(OPENVSWITCH_TARGET) $(OPENVSWITCH_DB_TARGET)
	$(V)dpkg -x $(OPENVSWITCH_TARGET) $(BUILDDIR)
	$(V)dpkg -x $(OPENVSWITCH_SW_TARGET) $(BUILDDIR)
	$(V)$(call FIXUP_PC,$(OPENVSWITCH_PC_INSTALL),$@)

$(OPENVSWITCH_PC) $(OPENVSWITCH_DB_PC): libovs%.pc: $(OPENVSWITCH_PC_INSTALL)/lib/pkgconfig/libovs%.pc

clean-$(OPENVSWITCH_REP):
	$(V)$(call CLEAN_AUTO,$(OPENVSWITCH_REP),$(OPENVSWITCH_TARGET),$(OPENVSWITCH_INSTALL))
	$(V)rm -f $(OPENVSWITCH_SW_INSTALL) > /dev/null || true
	$(V)rm -f $(OPENVSWITCH_SW_TARGET) > /dev/null || true
	$(V)rm -f $(SHADOW)/openvswitch-ipsec_*.deb > /dev/null || true
	$(V)(test -L $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.xml && unlink $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.xml > /dev/null) || true
	$(V)(test -L $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.xml && unlink $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.xml > /dev/null) || true
	$(V)(test -L $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/configdb.ovsschema && unlink $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/configdb.ovsschema > /dev/null) || true
	$(V)rm -f $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.xml > /dev/null || true
	$(V)rm -f $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.ovsschema > /dev/null || true
	$(V)rm -f $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/vswitch.ovsschema > /dev/null || true
	$(V)rm -f $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/configdb.ovsschema > /dev/null || true
	$(V)rm -f $(SHADOW)/$(OPENVSWITCH_REP)/vswitchd/dhcp_leases.xml > /dev/null || true

# ops-pmd

$(SHADOW)/$(PMD_REP):
	$(call MAKE_SHADOW,$(PMD_REP))

$(SHADOW)/$(PMD_REP)/CMakeLists.txt: $(SHADOW)/$(PMD_REP)

$(SHADOW)/$(PMD_REP)/Makefile: $(SHADOW)/$(PMD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(PMD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(PMD_TARGET): $(SHADOW)/$(PMD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(PMD_REP))

$(PMD_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc $(PMD_TARGET)
	$(V)cp $(PMD_TARGET) $(PMD_INSTALL)

clean-$(PMD_REP):
	$(V)$(call CLEAN_OPS,$(PMD_REP),$(PMD_TARGET),$(PMD_INSTALL))

# ops-powerd

$(SHADOW)/$(POWERD_REP):
	$(call MAKE_SHADOW,$(POWERD_REP))

$(SHADOW)/$(POWERD_REP)/CMakeLists.txt: $(SHADOW)/$(POWERD_REP)

$(SHADOW)/$(POWERD_REP)/Makefile: $(SHADOW)/$(POWERD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(POWERD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(POWERD_TARGET): $(SHADOW)/$(POWERD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(POWERD_REP))

$(POWERD_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc ops-cli.pc $(POWERD_TARGET)
	$(V)cp $(POWERD_TARGET) $(POWERD_INSTALL)

clean-$(POWERD_REP):
	$(V)$(call CLEAN_OPS,$(POWERD_REP),$(POWERD_TARGET),$(POWERD_INSTALL))

# ops-portd

$(SHADOW)/$(PORTD_REP):
	$(call MAKE_SHADOW,$(PORTD_REP))

$(SHADOW)/$(PORTD_REP)/CMakeLists.txt: $(SHADOW)/$(PORTD_REP)

$(SHADOW)/$(PORTD_REP)/Makefile: $(SHADOW)/$(PORTD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(PORTD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(PORTD_TARGET): $(SHADOW)/$(PORTD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(PORTD_REP))

$(PORTD_REP): libovscommon.pc libovsdb.pc $(PORTD_TARGET)
	$(V)cp $(PORTD_TARGET) $(PORTD_INSTALL)

clean-$(PORTD_REP):
	$(V)$(call CLEAN_OPS,$(PORTD_REP),$(PORTD_TARGET),$(PORTD_INSTALL))

# ops-restd

$(SHADOW)/$(RESTD_REP):
	$(call MAKE_SHADOW,$(RESTD_REP))

$(SHADOW)/$(RESTD_REP)/setup.py: $(SHADOW)/$(RESTD_REP)

$(RESTD_TARGET): $(SHADOW)/$(RESTD_REP)/setup.py
	$(V)$(call BUILD_PYTHON,$(RESTD_REP))

$(RESTD_REP): $(BUILDDIR)/ops-restapi.json $(RESTD_TARGET)
	$(V)cp $(RESTD_TARGET) $(RESTD_INSTALL)

clean-$(RESTD_REP):
	$(V)$(call CLEAN_PYTHON,$(RESTD_REP),$(RESTD_TARGET),$(RESTD_INSTALL))
	$(V)rm -f $(BUILDDIR)/ops-restapi.json > /dev/null || true

$(BUILDDIR)/ops-restapi.json: $(SHADOW)/$(RESTD_REP) $(SHADOW)/$(OPS_REP)/schema/vswitch.extschema $(SHADOW)/$(OPS_REP)/schema/vswitch.xml
	$(V)cd $(SHADOW)/$(RESTD_REP)/opslib && python apidocgen.py $(SHADOW)/$(OPS_REP)/schema/vswitch.extschema $(SHADOW)/$(OPS_REP)/schema/vswitch.xml > $@

# ops-sysd

$(SHADOW)/$(SYSD_REP):
	$(call MAKE_SHADOW,$(SYSD_REP))

$(SHADOW)/$(SYSD_REP)/CMakeLists.txt: $(SHADOW)/$(SYSD_REP)

$(SHADOW)/$(SYSD_REP)/Makefile: $(SHADOW)/$(SYSD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(SYSD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(SYSD_TARGET): $(SHADOW)/$(SYSD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(SYSD_REP))

$(SYSD_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc opsutils.pc $(SYSD_TARGET)
	$(V)cp $(SYSD_TARGET) $(SYSD_INSTALL)

clean-$(SYSD_REP):
	$(V)$(call CLEAN_OPS,$(SYSD_REP),$(SYSD_TARGET),$(SYSD_INSTALL))

# ops-switchd-container-plugin

$(SHADOW)/$(SWITCHD-CONTAINER_REP):
	$(call MAKE_SHADOW,$(SWITCHD-CONTAINER_REP))

$(SHADOW)/$(SWITCHD-CONTAINER_REP)/CMakeLists.txt: $(SHADOW)/$(SWITCHD-CONTAINER_REP)

$(SHADOW)/$(SWITCHD-CONTAINER_REP)/Makefile: $(SHADOW)/$(SWITCHD-CONTAINER_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(SWITCHD-CONTAINER_REP) && cmake $(OPS_CMAKE_ARGS) .

$(SWITCHD-CONTAINER_TARGET): $(SHADOW)/$(SWITCHD-CONTAINER_REP)/Makefile
	$(V)$(call BUILD_OPS,$(SWITCHD-CONTAINER_REP))

$(SWITCHD-CONTAINER_REP): libovscommon.pc libovsdb.pc $(SWITCHD-CONTAINER_TARGET)
	$(V)cp $(SWITCHD-CONTAINER_TARGET) $(SWITCHD-CONTAINER_INSTALL)

clean-$(SWITCHD-CONTAINER_REP):
	$(V)$(call CLEAN_OPS,$(SWITCHD-CONTAINER_REP),$(SWITCHD-CONTAINER_TARGET),$(SWITCHD-CONTAINER_INSTALL))

# ops-tempd

$(SHADOW)/$(TEMPD_REP):
	$(call MAKE_SHADOW,$(TEMPD_REP))

$(SHADOW)/$(TEMPD_REP)/CMakeLists.txt: $(SHADOW)/$(TEMPD_REP)

$(SHADOW)/$(TEMPD_REP)/Makefile: $(SHADOW)/$(TEMPD_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(TEMPD_REP) && cmake $(OPS_CMAKE_ARGS) .

$(TEMPD_TARGET): $(SHADOW)/$(TEMPD_REP)/Makefile
	$(V)$(call BUILD_OPS,$(TEMPD_REP))

$(TEMPD_REP): libovscommon.pc libovsdb.pc ops-config-yaml.pc ops-cli.pc $(TEMPD_TARGET)
	$(V)cp $(TEMPD_TARGET) $(TEMPD_INSTALL)

clean-$(TEMPD_REP):
	$(V)$(call CLEAN_OPS,$(TEMPD_REP),$(TEMPD_TARGET),$(TEMPD_INSTALL))

# ops-utils

$(SHADOW)/$(UTILS_REP):
	$(call MAKE_SHADOW,$(UTILS_REP))

$(SHADOW)/$(UTILS_REP)/CMakeLists.txt: $(SHADOW)/$(UTILS_REP)

$(SHADOW)/$(UTILS_REP)/Makefile: $(SHADOW)/$(UTILS_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(UTILS_REP) && cmake $(OPS_CMAKE_ARGS) .

$(UTILS_TARGET): $(SHADOW)/$(UTILS_REP)/Makefile
	$(V)$(call BUILD_OPS,$(UTILS_REP))

$(UTILS_REP): libovscommon.pc libovsdb.pc $(UTILS_TARGET)
	$(V)cp $(UTILS_TARGET) $(UTILS_INSTALL)

clean-$(UTILS_REP):
	$(V)$(call CLEAN_OPS,$(UTILS_REP),$(UTILS_TARGET),$(UTILS_INSTALL))
	$(V)rm -f $(UTILS_PC_INSTALL)/lib/pkgconfig/$(UTILS_PC) > /dev/null || true

$(BUILDDIR)/usr/local/lib/pkgconfig/$(UTILS_PC): $(UTILS_TARGET)
	$(V)dpkg -x $(UTILS_TARGET) $(UTILS_PC_INSTALL)
	$(V)$(call FIXUP_PC,$(UTILS_PC_INSTALL),$@)

$(UTILS_PC): $(UTILS_PC_INSTALL)/lib/pkgconfig/$(UTILS_PC)

# ops-vland

$(SHADOW)/$(VLAND_REP):
	$(call MAKE_SHADOW,$(VLAND_REP))

$(SHADOW)/$(VLAND_REP)/CMakeLists.txt: $(SHADOW)/$(VLAND_REP)

$(SHADOW)/$(VLAND_REP)/Makefile: $(SHADOW)/$(VLAND_REP)/CMakeLists.txt
	$(V)cd $(SHADOW)/$(VLAND_REP) && cmake $(OPS_CMAKE_ARGS) .

$(VLAND_TARGET): $(SHADOW)/$(VLAND_REP)/Makefile
	$(V)$(call BUILD_OPS,$(VLAND_REP))

$(VLAND_REP): libovscommon.pc libovsdb.pc $(VLAND_TARGET)
	$(V)cp $(VLAND_TARGET) $(VLAND_INSTALL)

clean-$(VLAND_REP):
	$(V)$(call CLEAN_OPS,$(VLAND_REP),$(VLAND_TARGET),$(VLAND_INSTALL))

# ops-webui

$(SHADOW)/$(WEBUI_REP):
	@echo
	@$(ECHO) "$(PURPLE)Preparing build environment for $(BLUE)$(WEBUI_REP) shadow dir.$(GRAY)"
	@echo
	$(V)(npm -v > /dev/null && node -v > /dev/null && sass -v > /dev/null) || $(ECHO) "You must run \'setup_debian\' scipt." || false
	$(call MAKE_SHADOW,$(WEBUI_REP),COPY)
	$(V)cd $(SHADOW)/$(WEBUI_REP) && tools/scripts/extract-node-tars
	$(V)cd $(SHADOW)/$(WEBUI_REP) && npm rebuild node-sass

$(SHADOW)/$(WEBUI_REP)/build.config.js: $(SHADOW)/$(WEBUI_REP)

$(WEBUI_TARGET): $(SHADOW)/$(WEBUI_REP)/build.config.js
	$(V)cd $(SHADOW)/$(WEBUI_REP) && npm run build

$(WEBUI_REP): $(WEBUI_TARGET)
	$(V)test -d $(SRCDIR)/$(WEBUI_REP) || $(ECHO) "$(BLUE)Warning:$(CYAN) \"$(WEBUI_REP)\" Shadow is a $(RED)COPY$(CYAN) of the source directory.  Changes made in the source will not be reflected in the build output.$(GRAY)"

clean-$(WEBUI_REP):
	$(V)(test -d $(WEBUI_TARGET) && rm -rf $(WEBUI_TARGET) > /dev/null) || true

# Python Index Libs

$(PYPI_SHADOW): $(SHADOW)/python-%:
	$(V)mkdir -p $(SHADOW)/python-$*
	$(V)cd $(SHADOW)/python-$* && pypi-download $* 

$(PYPI_BUILD): $(BUILDDIR)/python-%-*.deb: $(SHADOW)/python-%
	$(V)cd $(SHADOW)/python-$* && py2dsc-deb $*-*.tar.gz
	$(V)cp $(SHADOW)/python-$*/deb_dist/*.deb $(BUILDDIR)

$(PYPI_LIBS): python-%: $(BUILDDIR)/python-%-*.deb

$(PYPI_CLEAN): clean-python-%:
	$(V)rm -rf $(BUILDDIR)/python-$*_*.deb
	$(V)rm -rf $(SHADOW)/python-$*/deb_dist

clean-python-backports_abc:
	$(V)rm -rf $(BUILDDIR)/python-backports*.deb
	$(V)rm -rf $(SHADOW)/python-backports_abc/deb_dist

# openswitch

$(SHADOW)/$(OPENSWITCH_REP):
	$(V)if [ ! -d $@ ] ; then mkdir $@ && lndir -silent $(BUILD_ROOT)/$(OPENSWITCH_REP) $@; fi

$(OPENSWITCH_TARGET): $(SHADOW)/$(OPENSWITCH_REP)
	$(V)$(call BUILD_AUTO,$(OPENSWITCH_REP))

$(OPENSWITCH_REP): checkout-$(CLI_REP) $(SHADOW)/$(BUILD_REP) $(ALL_REPOSITORIES) $(OPENSWITCH_TARGET)
	$(V)cp $(OPENSWITCH_TARGET) $(OPENSWITCH_INSTALL)

clean-$(OPENSWITCH_REP):
	$(V)$(call CLEAN_AUTO,$(OPENSWITCH_REP),$(OPENSWITCH_INSTALL),$(OPENSWITCH_TARGET))

# cleanup

clean: $(CLEAN_REPOSITORIES) clean-$(OPENSWITCH_REP)
	$(V)rm -rf $(BUILDDIR)/usr || true
	$(V)rm -rf $(BUILDDIR)/etc || true
	$(V)rm -rf $(BUILDDIR)/var || true
	$(V)rm -rf $(BUILDDIR)/ops-cli_*.tar.gz || true

distclean: clean
	$(V)rm -rf build || true

update-all: distclean
	$(V)for i in $(ALL_REPOSITORIES) ; do					\
		if [ -d $(SRCDIR)/$$i ] ; then					\
			$(ECHO) "$(CYAN)Updating $(SRCDIR)/$$i$(GRAY)" ;	\
			git -C $(SRCDIR)/$$i pull --rebase ;			\
		fi ;								\
	done

$(CHECKOUT_REPOSITORIES): checkout-%:
	$(V)if [ ! -d $(SRCDIR)/$* ] ; then					\
		test -d $(SHADOW)/$* && make clean-$* && rm -rf $(SHADOW)/$* ;	\
		$(call CLONE,$*,$(SRCDIR));					\
	else									\
		$(ECHO) "$(PURPLE)$* already checked out.$(GRAY)" ;		\
	fi

checkout-all: $(CHECKOUT_REPOSITORIES)

# apt repository

apt-repo:
	$(V)reprepro -Vb /var/www/html/apt remove ecos $(ALL_APT_REPOS)
	$(V)reprepro -Vb /var/www/html/apt includedeb ecos $(BUILDDIR)/*.deb

