#Date & Time:

use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);

#Deployment Target:

NIC->variable("DEPLOYMENT_TARGET") = "7.0";

#ARC:

my $ARC_Setting = NIC->prompt("Use ARC? (Y/N)", {default => "Y"});


if (uc($ARC_Setting) eq "Y" || uc($ARC_Setting) eq "YES") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
    
    NIC->variable("STRONG_PROPERTY") = "strong";
    
    NIC->variable("DEALLOC") = "";
    
    NIC->variable("BUNDLE") = "[NSBundle bundleForClass:[self class]]";
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
    
    NIC->variable("STRONG_PROPERTY") = "retain";
    
    NIC->variable("DEALLOC") = "[super dealloc];\n\t[self.view release];\n\tself.view = nil;\n\t[self.bundle release];\n\tself.bundle = nil;";
    
    NIC->variable("BUNDLE") = "[[NSBundle bundleForClass:[self class]] retain]";
}

