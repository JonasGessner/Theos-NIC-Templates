#! /usr/local/bin/perl

#Date & Time:

use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);

#Deployment Target:

NIC->prompt("DEPLOYMENT_TARGET", "Deployment Target?", {default => "7.0"});

#ARC:

my $ARC_Setting = NIC->prompt("Use ARC? (Y/N)", {default => "Y"});

my $Replace_ID = NIC->prompt("Stock section ID to replace? (ex. com.apple.controlcenter.settings, return \"-\" for none)", {default => "-"});

if ($Replace_ID eq "-") {
    NIC->variable("REPLACE_SECTION") = "";
}
else {
    NIC->variable("REPLACE_SECTION") = "\n\t<key>CCReplacingStockSectionID</key>\n\t<string>" . $Replace_ID . "</string>";
}

if (uc($ARC_Setting) eq "Y" || uc($ARC_Setting) eq "YES") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
    
    NIC->variable("STRONG_PROPERTY") = "strong";
    
    NIC->variable("WEAK_PROPERTY") = "weak";
    
    NIC->variable("DEALLOC") = "";
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
    
    NIC->variable("STRONG_PROPERTY") = "retain";
    
    NIC->variable("WEAK_PROPERTY") = "assign";
    
    NIC->variable("DEALLOC") = "[super dealloc];\n\t[self.view release];";
}

