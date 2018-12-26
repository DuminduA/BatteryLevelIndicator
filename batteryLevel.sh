upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | sed -r 's/[^0-9]*([0-9]+).*/\1/'


