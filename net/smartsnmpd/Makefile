#
# Copyright (C) 2014 Credo Semiconductor Inc.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=smartsnmpd
PKG_VERSION:=2014-07-18
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/credosemi/smartsnmp.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=fa9f12b29bd05d512316898009b1c1d1b1c78617
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=


PKG_MAINTAINER:=Xiongfei Guo <xfguo@credosemi.com>,Leo Ma <leoma@credosemi.com>


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/scons.mk

define Package/smartsnmpd/Default
	URL:=http://support.credosemi.com/gitlab/nmsgroup/snmp-agent
endef

define Package/smartsnmpd/Default/description
		TBD
endef

define Package/smartsnmpd
	$(call Package/smartsnmpd/Default)
	SECTION:=net
	CATEGORY:=Network
	DEPENDS+= +liblua +libubox
	TITLE:=Smart-SNMP (Agent)
endef

SCONS_OPTIONS += --transport=uloop

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		$(SCONS_VARS) \
		scons \
			prefix=/usr \
			$(SCONS_OPTIONS) \
	)
endef

define Package/smartsnmpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/snmpd $(1)/usr/sbin/smartsnmpd

	$(INSTALL_DIR) $(1)/usr/lib/lua/smartsnmp
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/smartsnmp/core.so $(1)/usr/lib/lua/smartsnmp/core.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lualib/smartsnmp/*.lua $(1)/usr/lib/lua/smartsnmp/

	$(INSTALL_DIR) $(1)/usr/lib/lua/smartsnmp/mibs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mibs/*.lua $(1)/usr/lib/lua/smartsnmp/mibs/

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/smartsnmpd.conf $(1)/etc/config/smartsnmpd

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/smartsnmpd.init $(1)/etc/init.d/smartsnmpd

endef

$(eval $(call BuildPackage,smartsnmpd))

