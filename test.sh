#!/usr/bin/env bash

# pomme=$(cat << EOF
# 	do shell script "say Hello"
# EOF
# )

# echo $pomme | xargs -I _ osascript -e _
# osascript -e $(echo $pomme)

osascript << EOF > /dev/null 2>&1
	do shell script "say Hello"
	beep
	delay 1
	return "Hello from return"
--	error "kamakura" number 1192
EOF
