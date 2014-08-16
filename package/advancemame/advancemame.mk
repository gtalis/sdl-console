################################################################################
#
# AdvanceMAME
#
################################################################################

ADVANCEMAME_VERSION = 1.2
ADVANCEMAME_SITE = http://downloads.sourceforge.net/project/advancemame/advancemame/$(ADVANCEMAME_VERSION)
ADVANCEMAME_LICENSE = GPLv2+
ADVANCEMAME_LICENSE_FILES = COPYING
ADVANCEMAME_DEPENDENCIES = expat sdl zlib ncurses freetype

ADVANCEMAME_CONF_ENV += ac_cv_path_ac_lib_freetype_config=$(STAGING_DIR)/usr/bin/freetype-config \
	ac_cv_path_ac_lib_sdl_config=$(STAGING_DIR)/usr/bin/sdl-config \
	INSTALL_PROGRAM_DIR="$(TARGET_DIR)"

ADVANCEMAME_CONF_OPT += --datarootdir=$(TARGET_DIR)/usr/share \
			--docdir=$(TARGET_DIR)/usr \
			--bindir=$(TARGET_DIR)/usr/bin \
			--mandir=$(TARGET_DIR)/usr/man \
			--htmldir=$(TARGET_DIR)/usr

$(eval $(autotools-package))
