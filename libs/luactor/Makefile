#
# Copyright (C) 2014 Xiongfei Guo.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luactor
PKG_VERSION:=2014-07-29
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/xfguo/luactor.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=daa84c1dccd0b7d475e772c0feb77c7e8809ff87
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=

PKG_MAINTAINER:=Xiongfei Guo <xfguo@credosemi.com>

include $(INCLUDE_DIR)/package.mk

define Package/luactor/Default
	URL:=https://github.com/xfguo/luactor
endef

define Package/luactor/Default/description
	A pure Lua (at least for now) Actor Model framework.

	Luactor is based on coroutine in Lua.
endef

define Package/luactor
	$(call Package/luactor/Default)
	SECTION:=libs
	CATEGORY:=Libraries
	DEPENDS:=+libubox-lua
	TITLE:=LuActor - A pure Lua Actor Model framework
endef

define Package/luactor/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_INSTALL_DIR)/luactor.lua $(1)/usr/lib/lua/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luactor
	$(CP) $(PKG_INSTALL_DIR)/luactor/* $(1)/usr/lib/lua/luactor/
	$(CP) ./files/config.lua $(1)/usr/lib/lua/luactor/
endef

$(eval $(call BuildPackage,luactor))

