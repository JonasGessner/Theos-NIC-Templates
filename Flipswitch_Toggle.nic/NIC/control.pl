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
    
    NIC->variable("STRONG_PROPERTY") = "strong";
    
    NIC->variable("WEAK_PROPERTY") = "weak";
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
    
    NIC->variable("STRONG_PROPERTY") = "retain";
    
    NIC->variable("WEAK_PROPERTY") = "assign";
}
