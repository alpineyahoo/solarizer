#!/usr/bin/env bash

# pomme=$(cat << EOF
# 	do shell script "say Hello"
# EOF
# )

# echo $pomme | xargs -I _ osascript -e _
# osascript -e $(echo $pomme)

osascript << EOF > /dev/null 2>&1 # return "HelloWorld" だけが出力抑制される
	do shell script "say Hello"
	beep
	delay 1
	return "HelloWorld"
--	error "kamakura" number 1192
EOF

osascript -e 'error "kamakura" number 1192'
# ヒアドキュメント内だと、2>&1を記述しても標準エラーを出力することができない、なぜだか
