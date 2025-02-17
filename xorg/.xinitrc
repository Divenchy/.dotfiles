/home/weoweo/suckless/weo3goMonitor.sh
/home/weoweo/suckless/scaleGTK_QT.sh

xset -dpms
xset s off

feh --bg-scale ~/Pictures/wallpapers/prarie_mountains.jpg
slstatus &
picom &
pipewire &

firefox &

exec dbus-run-session dwm


