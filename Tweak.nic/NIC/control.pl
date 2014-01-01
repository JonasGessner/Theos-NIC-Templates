my $default_kill = "SpringBoard";

NIC->variable("KILL_RULE") = "";

use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);

if (lc(NIC->variable("ARC_ENABLED")) eq "y" || lc(NIC->variable("ARC_ENABLED")) eq "yes") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
}

my $kill_apps = NIC->prompt("KILL_APPS", "List of applications to terminate upon installation (space-separated, '-' for none)", {default => $default_kill});
if($kill_apps ne "-") {
	my @apps = split(/\s+/, $kill_apps);
	my @commands = map {"killall -9 $_"} @apps;
	NIC->variable("KILL_RULE") = "after-install::\n\tinstall.exec \"".join("; ", @commands)."\"";
}
