#! /usr/local/bin/perl

#Date & Time:

use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);


#Deployment Target:

NIC->prompt("DEPLOYMENT_TARGET", "Deployment Target?", {default => "5.0"});

#ARC:

my $ARC_Setting = NIC->prompt("Use ARC? (Y/N)", {default => "Y"});


if (uc($ARC_Setting) eq "Y" || uc($ARC_Setting) eq "YES") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
    NIC->variable("BUNDLE_LOADER") = "[NSBundle bundleForClass:[self class]]";
    NIC->variable("UNLOAD_VIEW_CONTROLLER") = "[self.view removeFromSuperview];\n\tself.view = nil;";
    NIC->variable("UNLOAD_VIEW") = "[_backgroundImageView removeFromSuperview];\n\t\t_backgroundImageView = nil;";
    NIC->variable("STRONG_PROPERTY") = "strong";
    NIC->variable("DEALLOC") = "";
    NIC->variable("SUPER_DEALLOC") = "";
    NIC->variable("TOUCH_FIX_CLEANUP") = "";
    NIC->variable("DEALLOC_BG_IMAGE_VIEW") = "";
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
    NIC->variable("BUNDLE_LOADER") = "[[NSBundle bundleForClass:[self class]] retain]";
    NIC->variable("UNLOAD_VIEW_CONTROLLER") = "[self.view removeFromSuperview];\n\t[self.view release];\n\tself.view = nil;";
    NIC->variable("UNLOAD_VIEW") = "[_backgroundImageView removeFromSuperview];\n\t\t[_backgroundImageView release];\n\t\t_backgroundImageView = nil;";
    NIC->variable("STRONG_PROPERTY") = "retain";
    
    NIC->variable("DEALLOC") = "\n- (void)dealloc {\n\t[super dealloc];\n\t[self.bundle release];\n\tself.bundle = nil;\n}";
    NIC->variable("SUPER_DEALLOC") = "[super dealloc];\n\t";
    NIC->variable("TOUCH_FIX_CLEANUP") = "[eventDown release];\n\t[eventUp release];\n\t[touch release];";
    NIC->variable("DEALLOC_BG_IMAGE_VIEW") = "[_backgroundImageView release];";
}

#iOS 7 Notification Center Section

my $Section_Human = NIC->prompt("iOS 7 Notification Center section (Today, All or Both)", {default => "Both"});

my $Project_Name = NIC->variable("PROJECTNAME");


if (uc($Section_Human) eq "TODAY") {
    NIC->variable("SECTIONS") = "<key>SBUIWidgetIdiomNotificationCenterToday</key>\n\t\t<string>" . $Project_Name . "ViewControllerNew</string>";
}
elsif (uc($Section_Human) eq "ALL") {
    NIC->variable("SECTIONS") = "<key>SBUIWidgetIdiomNotificationCenter</key>\n\t\t<string>" . $Project_Name . "ViewControllerNew</string>";
}
else {
    NIC->variable("SECTIONS") = "<key>SBUIWidgetIdiomNotificationCenterToday</key>\n\t\t<string>" . $Project_Name .  "ViewControllerNew</string>\n\t\t<key>SBUIWidgetIdiomNotificationCenter</key>\n\t\t<string>" . $Project_Name . "ViewControllerNew</string>";
}

