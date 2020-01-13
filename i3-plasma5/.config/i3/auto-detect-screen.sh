#!/bin/bash
## auto-detect-screens.sh
## version 0.1
## Basically I move between 3 different screen layouts, and I want my screens set up a specific way for i3


#sleep 60

resolution="$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')"
## Thanks to user31752 for the above xdpyinfo and its pipes
## https://superuser.com/questions/196532/how-do-i-find-out-my-screen-resolution-from-a-shell-script


## while resolution is 4920x1920

if [ "$resolution" = "4920x1920" ] ; then ## H 2020-01-13
	xrandr --output VGA-1 --mode 1920x1080 --pos 0x656 --rotate normal --output LVDS-1 --off --output HDMI-3 --off --output HDMI-2 --primary --mode 1920x1080 --pos 1920x656 --rotate normal --output HDMI-1 --off --output DP-3 --mode 1920x1080 --pos 3840x0 --rotate left --output DP-2 --off --output DP-1 --off
elif [ "$resolution" = "3840x1080" ] ; then ## K 2020-01-13
	xrandr --output VGA-1 --off --output LVDS-1 --off --output HDMI-3 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off
elif [ "$resolution" = "5760x1080" ] ; then ## H 2020-01-13
	xrandr --output VGA-1 --mode 1920x1080 --pos 0x656 --rotate normal --output LVDS-1 --off --output HDMI-3 --off --output HDMI-2 --primary --mode 1920x1080 --pos 1920x656 --rotate normal --output HDMI-1 --off --output DP-3 --mode 1920x1080 --pos 3840x0 --rotate left --output DP-2 --off --output DP-1 --off
else
		      #        "    ""#          
	#mmmm   mmm   #mmm   mmm      #     mmm  
	# # #  #" "#  #" "#    #      #    #"  # 
	# # #  #   #  #   #    #      #    #"""" 
	# # #  "#m#"  ##m#"  mm#mm    "mm  "#mm" 

	true
fi




## while resolution is 1366x768

#if [ "$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')" = "1366x768" ] ; then
#	qdbus org.kde.ActivityManager /ActivityManager/Activities SetCurrentActivity "69b75789-fe77-4c94-81a6-7c02b599da0d" ## switch to "Mobile"
#fi
