export ARCHS = arm64e

THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FrontCameraCCButton
FrontCameraCCButton_BUNDLE_EXTENSION = bundle
FrontCameraCCButton_FILES = FrontCameraCCButton.m
FrontCameraCCButton_CFLAGS = -fobjc-arc
FrontCameraCCButton_PRIVATE_FRAMEWORKS = ControlCenterUIKit
FrontCameraCCButton_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
