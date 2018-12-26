mkdir /home/akalanka/Desktop/batteryTest
upperThreshold=99
lowerThreshold=15

echo upperThreshold=$upperThreshold
echo lowerThreshold=$lowerThreshold

zenity --info --text='Battery level monitoring started...' --no-wrap 2>&1 >/dev/null

while [[ true ]]; do
    status=$(/etc/init/batteryStatus.sh)
    level=$(/etc/init/batteryLevel.sh)
    msg="Battery Level now is $level%"

    echo "Battery $level% and $status"

    case $status in
        charging | fully-charged)
            if [[ $level -gt $upperThreshold ]]; then
                echo 'Upper threshold crossed...'
                zenity --warning --text="$msg" --no-wrap --timeout=8 2>&1 >/dev/null
                espeak -v en+m7 -p 60 "$msg"
            fi
            ;;
        discharging)
            if [[ $level -lt $lowerThreshold ]]; then
                echo 'Lower threshold crossed...'
                zenity --warning --text="$msg" --no-wrap --timeout=8 2>&1 >/dev/null
                espeak -v en+m7 -p 60 "$msg"
            fi
            ;;
        *)
            echo unexpected battery status
            ;;
    esac

    sleep 30s
done
