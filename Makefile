TARGET := iphone:clang:latest:16.0
THEOS_PACKAGE_SCHEME=rootless
THEOS_PACKAGE_INSTALL_PREFIX=/var/jb

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CameraControl

CameraControl_FILES = bypass.xm
CameraControl_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += BackCamera
SUBPROJECTS += FrontCamera
include $(THEOS_MAKE_PATH)/aggregate.mk