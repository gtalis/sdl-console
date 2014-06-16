################################################################################
#
# hexen2: Hammer Of Thyrion
#
################################################################################

HEXEN2_VERSION = 1.5.6
HEXEN2_SITE = http://downloads.sourceforge.net/project/uhexen2/Hammer%20of%20Thyrion/$(HEXEN2_VERSION)/Source
HEXEN2_SOURCE = hexen2source-$(HEXEN2_VERSION).tgz
HEXEN2_DEPENDENCIES = sdl sdl_mixer

HEXEN2_MAKE_OPT += CC=$(TARGET_CC) \
		USE_MIDI=no \
		USE_SOUND=no \
		USE_SDL=yes \
		SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config

define HEXEN2_BUILD_CMDS
	$(MAKE) $(HEXEN2_MAKE_OPT) h2 \
	 -C $(@D)/engine/hexen2
endef

define HEXEN2_CLEAN_CMDS
	$(MAKE) $(HEXEN2_MAKE_OPT) clean \
	 -C $(@D)/engine/hexen2
endef

define HEXEN2_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(@D)/engine/hexen2/hexen2 \
		$(TARGET_DIR)/usr/games/hexen2
endef

$(eval $(generic-package))
