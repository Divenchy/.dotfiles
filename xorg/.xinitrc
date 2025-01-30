xmodmap ~/keymaps/.Xmodmap

xrandr --output eDP-1 --mode 2880x1620 --rate 120.00 --output HDMI-1 --same-as eDP-1 --scale-from 2880x1620

xset -dpms
xset s off

feh --bg-scale ~/.config/fall_moutainside.jpg
slstatus &
picom &

firefox &

exec dwm


