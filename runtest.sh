#!/usr/bin/fish
Xephyr :1 -softCursor -screen 1024x768 &; sleep 1; DISPLAY=:1.0 ./obj/troodon &; sleep 1; DISPLAY=:1.0 xterm &; DISPLAY=:1.0 xeyes &; DISPLAY=:1.0 xcalc &
