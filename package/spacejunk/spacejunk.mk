################################################################################
#
# spacejunk
#
################################################################################

SPACEJUNK_VERSION = 1.0.5
SPACEJUNK_SITE = http://downloads.sourceforge.net/spacejunk
SPACEJUNK_DEPENDENCIES = sdl sdl_mixer sdl_image

SPACEJUNK_AUTORECONF = yes
SPACEJUNK_CONF_OPT = \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--with-sdl-exec-prefix=$(STAGING_DIR)/usr

$(eval $(autotools-package))
