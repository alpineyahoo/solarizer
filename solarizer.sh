#!/usr/bin/env bash

# requires imagemagick

cd "$(dirname "$(readlink -f "$0")")"
mkdir -p $HOME/.cache/solarizer
system_profiler SPDisplaysDataType |
grep Resolution |
tr -dc '0-9x\n' |
xargs -I _ magick -size _ "xc:#002b36" $HOME/.cache/solarizer/wallpaper.png # or "xc:#073642"

# osascript solarizer.applescript # > /dev/null 2>&1

osascript << EOF > /dev/null 2>&1
	try
		with timeout of 0.1 seconds
			tell application "Mission Control" to activate
		end timeout
	end try
	tell application "System Events"
		set x to (group 2 of group 1 of group 1 of process "Dock")
		perform action 1 of button 1 of x
		perform action 1 of last button of list 1 of x
		delay 4 -- depends on how laggy your machine is
		set picture of current desktop to POSIX file (do shell script "echo ~/.cache/solarizer/wallpaper.png")
	end tell
EOF
