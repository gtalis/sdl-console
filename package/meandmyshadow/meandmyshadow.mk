################################################################################
#
# meandmyshadow
#
################################################################################

MEANDMYSHADOW_VERSION = 0.4
MEANDMYSHADOW_SOURCE = meandmyshadow-$(MEANDMYSHADOW_VERSION)-src.tar.gz
MEANDMYSHADOW_SITE = http://downloads.sourceforge.net/project/meandmyshadow/$(MEANDMYSHADOW_VERSION)
MEANDMYSHADOW_DEPENDENCIES = libarchive libcurl openssl sdl sdl_gfx sdl_image sdl_mixer sdl_ttf

MEANDMYSHADOW_CONF_OPT += -DHARDWARE_ACCELERATION=OFF -DUSE_X11=OFF

$(eval $(cmake-package))
