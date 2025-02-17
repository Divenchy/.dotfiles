#!/bin/bash

EXTERNAL_DISPLAY="HDMI-0"

if xrandr | grep -q "$EXTERNAL_DISPLAY connected"; then
  # Both displays are connected
  xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 3440x1440 --primary --pos 3840x0 --rotate normal --output eDP-1-0 --off
else
  # Only the internal display is connected
  xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --off --output eDP-1-0 --primary --mode 1920x1200 --pos 0x0 --rotate normal
fi
