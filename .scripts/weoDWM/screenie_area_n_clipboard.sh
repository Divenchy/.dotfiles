#!/bin/sh

scrot -s '/home/weoweo/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png' -e 'xclip -selection clipboard -t image/png -i $f'
