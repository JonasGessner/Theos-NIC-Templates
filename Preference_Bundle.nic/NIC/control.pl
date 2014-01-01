use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);

if (lc(NIC->variable("ARC_ENABLED")) eq "y" || lc(NIC->variable("ARC_ENABLED")) eq "yes") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
    NIC->variable("LOADER") = "[self loadSpecifiersFromPlistName:@\"" . NIC->variable("PROJECTNAME") . "\" target:self]"
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
    NIC->variable("LOADER") = "[[self loadSpecifiersFromPlistName:@\"" . NIC->variable("PROJECTNAME") . "\" target:self] retain]"
}