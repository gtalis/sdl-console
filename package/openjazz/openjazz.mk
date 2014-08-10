################################################################################
#
# openjazz
#
################################################################################

OPENJAZZ_VERSION = 160214
OPENJAZZ_SITE = http://www.alister.eu/jazz/oj
OPENJAZZ_SOURCE = OpenJazz-src-$(OPENJAZZ_VERSION).zip
OPENJAZZ_DEPENDENCIES = sdl zlib

define OPENJAZZ_EXTRACT_CMDS
	unzip $(DL_DIR)/$(OPENJAZZ_SOURCE) -d $(@D)
endef

define OPENJAZZ_BUILD_CMDS
	$(MAKE) \
		CXX="$(TARGET_CXX)" \
		CXXFLAGS="`$(STAGING_DIR)/usr/bin/sdl-config --cflags` -Isrc" \
		LDFLAGS="`$(STAGING_DIR)/usr/bin/sdl-config --libs` -lz" \
	 -C $(@D)
endef

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
endef

$(eval $(generic-package))
