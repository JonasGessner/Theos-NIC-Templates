ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:@@DEPLOYMENT_TARGET@@

THEOS_BUILD_DIR = Packages

include @@THEOS@@/makefiles/common.mk

TWEAK_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_CFLAGS = @@CFLAGS@@
@@PROJECTNAME@@_FILES = @@PROJECTNAME@@.xm
@@PROJECTNAME@@_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

@@KILL_RULE@@
