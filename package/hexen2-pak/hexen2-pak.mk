################################################################################
#
# hexen2-pak
#
################################################################################

HEXEN2_PAK_VERSION = 1.11
HEXEN2_PAK_SOURCE = hexen2demo-pakfiles-$(HEXEN2_PAK_VERSION).tgz
HEXEN2_PAK_SITE = http://downloads.sourceforge.net/project/uhexen2/Hexen2%20GameData/hexen2demo-pakfiles

define HEXEN2_PAK_EXTRACT_CMDS
	$(ZCAT) $(DL_DIR)/$($(PKG)_SOURCE) | tar -C $(@D) $(TAR_OPTIONS) -
endef

define HEXEN2_PAK_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/games/data1
	$(INSTALL) -m 0644 $(@D)/data1/*.* $(TARGET_DIR)/usr/games/data1
endef

$(eval $(generic-package))
