################################################################################
#
# paintown
#
################################################################################

PAINTOWN_VERSION = 3.6.0
PAINTOWN_SITE = http://downloads.sourceforge.net/project/paintown/paintown/$(PAINTOWN_VERSION)
PAINTOWN_SOURCE = paintown-$(PAINTOWN_VERSION).tar.bz2
PAINTOWN_DEPENDENCIES = sdl sdl_image sdl_net sdl_mixer libogg libvorbis \
			freetype libmpd libmad mpg123

define PAINTOWN_CONFIGURE_CMDS
	mkdir -p $(@D)/build && cd $(@D)/build
endef

# Re-define build commands.
define PAINTOWN_BUILD_CMDS
	cd $(@D)/build && \
	cmake ../ \
		-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DBUILD_TESTING=OFF \
		-DBUILD_SHARED_LIBS=ON \
		-DUSE_CCACHE=OFF \
		-DCMAKE_PREFIX_PATH=$(STAGING_DIR)/usr/include/freetype2 \
	&& make
endef

define PAINTOWN_INSTALL_TARGET_CMDS
	cp $(@D)/build/bin/paintown $(@D)
	cd $(@D) && ./install.sh -d $(TARGET_DIR)/usr/share/games/paintown \
		-b $(TARGET_DIR)/usr/games
endef

$(eval $(cmake-package))
