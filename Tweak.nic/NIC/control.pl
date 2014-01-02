#Date & Time:

use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);


#ARC:

my $ARC_Setting = NIC->prompt("Use ARC? (Y/N)", {default => "Y"});


if (uc($ARC_Setting) eq "Y" || uc($ARC_Setting) eq "YES") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
}


#Kill Rule:

my $default_kill = "backboardd";

NIC->variable("KILL_RULE") = "";

my $kill_apps = NIC->prompt("KILL_APPS", "List of applications to terminate upon installation (space-separated, '-' for none)", {default => $default_kill});

if ($kill_apps ne "-") {
	my @apps = split(/\s+/, $kill_apps);
	my @commands = map {"killall -9 $_"} @apps;
    
	NIC->variable("KILL_RULE") = "after-install::\n\tinstall.exec \"".join("; ", @commands)."\"";
}
