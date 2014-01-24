ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:@@DEPLOYMENT_TARGET@@

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TOOL_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_CFLAGS = @@CFLAGS@@
@@PROJECTNAME@@_FILES = main.m
@@PROJECTNAME@@_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tool.mk

after-@@PROJECTNAME@@-stage::
	$(ECHO_NOTHING)$(FAKEROOT) chown root:wheel $(THEOS_STAGING_DIR)/Library/LaunchDaemons/@@PACKAGENAME@@.plist$(ECHO_END)
