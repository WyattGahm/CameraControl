export ARCHS = arm64e arm64

THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BackCameraCCButton
BackCameraCCButton_BUNDLE_EXTENSION = bundle
BackCameraCCButton_FILES = BackCameraCCButton.m
BackCameraCCButton_CFLAGS = -fobjc-arc
BackCameraCCButton_PRIVATE_FRAMEWORKS = ControlCenterUIKit
BackCameraCCButton_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
