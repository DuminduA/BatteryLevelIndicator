upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep state | sed -r 's/.*\:\ +(.*)/\1/'
