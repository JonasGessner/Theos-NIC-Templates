ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:@@DEPLOYMENT_TARGET@@

THEOS_BUILD_DIR = Packages

include @@THEOS@@/makefiles/common.mk

BUNDLE_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_CFLAGS = @@CFLAGS@@
@@PROJECTNAME@@_FILES = @@PROJECTNAME@@Section.m @@PROJECTNAME@@SectionView.m
@@PROJECTNAME@@_INSTALL_PATH = /Library/CCLoader/Bundles
@@PROJECTNAME@@_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 backboardd"