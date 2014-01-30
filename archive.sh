#! /bin/bash

rm -rf Archived\ Templates

mkdir Archived\ Templates

cd Archived\ Templates

~/Developer/Jailbreak/theos/bin/nicify.pl ../CCLoader_Plugin.nic

~/Developer/Jailbreak/theos/bin/nicify.pl ../Flipswitch_Toggle.nic

~/Developer/Jailbreak/theos/bin/nicify.pl ../Notification_Center_Widget.nic

~/Developer/Jailbreak/theos/bin/nicify.pl ../Preference_Bundle.nic

~/Developer/Jailbreak/theos/bin/nicify.pl ../XPC_Service.nic

~/Developer/Jailbreak/theos/bin/nicify.pl ../Tweak.nic

cd ..