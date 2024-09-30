#!/usr/bin/env bash

# requires imagemagick

mkdir -p $HOME/.cache/solarizer
system_profiler SPDisplaysDataType |
grep Resolution |
tr -dc '0-9x\n' |
xargs -I _ magick -size _ "xc:#002b36" $HOME/.cache/solarizer/wallpaper.png # or "xc:#073642"
