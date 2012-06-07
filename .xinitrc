##!/bin/sh
#openbox-session
xset b off &
#exec conky &
eval `cat ~/.fehbg` &
#bin/mozilla-mount &
#xscreensaver -no-splash &
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
xcompmgr -cCfF -t-5 -l-5 -r4.2 -o.55 -D6 &
#setxkbmap -rules xorg -layout "gb"
#pypanel  &
#tilda &
#sudo modprobe ath_pci &
#sudo iwlist ath0 scanning | grep Address | awk '{print $5;}' &
tpd & 
sshfs dynatron:/ dynatron &
export TERM=rxvt
#urxvt -depth 32 -fg white -bg rgba:0000/0000/0000/bbbb &
#exec startlxde
#exec awesome
lxpanel &
exec openbox-session
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation 
Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 
8 6 7 4 5
