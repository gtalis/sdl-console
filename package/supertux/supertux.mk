#############################################################
#
# SUPERTUX
#
#############################################################
SUPERTUX_VERSION = 0.1.3
SUPERTUX_SOURCE = supertux-$(SUPERTUX_VERSION).tar.bz2
SUPERTUX_SITE = https://supertux.googlecode.com/files

SUPERTUX_DEPENDENCIES = sdl sdl_image sdl_mixer zlib

ifeq ($(BR2_PACKAGE_SUPERTUX_NOOPENGL),y)
SUPERTUX_CONF_OPT += --disable-opengl
endif

SUPERTUX_CONF_OPT += \
               --oldincludedir=$(STAGING_DIR)/usr/include \
               --with-sdl-prefix=$(STAGING_DIR)/usr \
               --with-sdl-exec-prefix=$(STAGING_DIR)/usr \
               --disable-cpu-opt \
               --disable-sdltest

$(eval $(autotools-package))
