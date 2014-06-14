################################################################################
#
# c-dogs
#
################################################################################

C_DOGS_VERSION = 0.5.5.1
C_DOGS_SITE = $(call github,cxong,cdogs-sdl)
C_DOGS_SOURCE = $(C_DOGS_VERSION).tar.gz
C_DOGS_DEPENDENCIES = sdl sdl_image sdl_net sdl_mixer

# c-dogs needs other packages that must be downloaded
# from same github
define C_DOGS_GET_OTHER_DEPENDENCIES
	if test ! -d $(@D)/src/cdogs/hqx/src; then \
		cd $(@D)/src/cdogs && git clone https://github.com/cxong/hqx; \
	fi;

	if test ! -e $(@D)/src/tests/cbehave/CMakeLists.txt; then \
		cd $(@D)/src/tests && git clone https://github.com/cxong/cbehave  \
		&& cd $(@D)/src/tests/cbehave && git clone https://github.com/cxong/rlutil; \
	fi;

	if test ! -d ${STAGING_DIR}/usr/include/tinydir; then \
		cd ${STAGING_DIR}/usr/include && git clone https://github.com/cxong/tinydir; \
	fi;
endef

C_DOGS_PRE_CONFIGURE_HOOKS += C_DOGS_GET_OTHER_DEPENDENCIES

$(eval $(cmake-package))
