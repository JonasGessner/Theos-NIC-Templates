ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:@@DEPLOYMENT_TARGET@@

THEOS_BUILD_DIR = Packages

include @@THEOS@@/makefiles/common.mk

BUNDLE_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_CFLAGS = @@CFLAGS@@
@@PROJECTNAME@@_FILES = @@PROJECTNAME@@Switch.x
@@PROJECTNAME@@_FRAMEWORKS = Foundation UIKit
@@PROJECTNAME@@_LDFLAGS = -weak_library libflipswitch.dylib
@@PROJECTNAME@@_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "rm -rf /tmp/FlipswitchCache; killall -9 backboardd"
