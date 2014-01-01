ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:5.1.1

include @@THEOS@@/makefiles/common.mk

BUNDLE_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_CFLAGS = @@CFLAGS@@
@@PROJECTNAME@@_FILES = @@PROJECTNAME@@.m
@@PROJECTNAME@@_INSTALL_PATH = /Library/PreferenceBundles
@@PROJECTNAME@@_FRAMEWORKS = Foundation UIKit
@@PROJECTNAME@@_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/@@PROJECTNAME@@.plist$(ECHO_END)
