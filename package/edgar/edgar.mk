################################################################################
#
# edgar
#
################################################################################

EDGAR_VERSION = 1.16
EDGAR_SOURCE = edgar-$(EDGAR_VERSION)-1.tar.gz
EDGAR_SITE = http://sourceforge.net/projects/legendofedgar/files/$(EDGAR_VERSION)
EDGAR_DEPENDENCIES = sdl sdl_image sdl_mixer sdl_ttf host-gettext

define EDGAR_MAKE_OPT
	CC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) HOST_BINDIR=$(HOST_DIR)/usr/bin \
	SDL_PREFIX=$(STAGING_DIR)/usr/bin
endef

define EDGAR_BUILD_CMDS
	$(MAKE) $(EDGAR_MAKE_OPT) -C $(@D) edgar; $(MAKE) -C $(@D) buildpak
endef

define EDGAR_INSTALL_TARGET_CMDS
	$(MAKE) $(EDGAR_MAKE_OPT) -C $(@D) install
endef

define EDGAR_CLEAN_CMDS
	$(MAKE) $(EDGAR_MAKE_OPT) -C $(@D) clean
endef

$(eval $(generic-package))
