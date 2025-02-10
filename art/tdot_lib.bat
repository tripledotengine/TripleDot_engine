@echo off
title Triple DOT!engine Libraries Setup
Start
echo Downloading libraries..
haxelib install hscript
haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install flixel-tools
haxelib install hxCodec
haxelib git hxCodec https://github.com/polybiusproxy/hxCodec.git
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc

TIMEOUT 1 >nul

echo Updating libaries...
haxelib set flixel 4.11.0 
haxelib set flixel-addons 3.2.1
haxelib set flixel-tools 1.5.1
haxelib set flixel-ui 2.5.0
haxelib set openfl 9.3.2
haxelib set lime 8.0.1
TIMEOUT 4 >nul
echo You should be all good now!
exit