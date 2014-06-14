################################################################################
#
# rezerwar
#
################################################################################

REZERWAR_VERSION = 0.4.2
REZERWAR_SITE = http://tamentis.com/projects/rezerwar/files
REZERWAR_DEPENDENCIES = sdl sdl_mixer

# This is not a true autotools package.
define REZERWAR_CONFIGURE_CMDS
	cd $(@D) && ./configure Linux
endef

define REZERWAR_BUILD_CMDS
	$(MAKE) \
		CC="$(TARGET_CC)" \
		CFLAGS="`$(STAGING_DIR)/usr/bin/sdl-config --cflags`" \
		LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --libs` -lSDL_mixer" \
	 -C $(@D)
endef

define REZERWAR_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
