These scripts are obtained from https://askubuntu.com/questions/1045744/urgent-notifications-not-showing-up-in-fullscreen-mode

steps

1. copy batteryInfoNotify.sh to /etc/init.d
2. copy other files to /etc/init
3. remember to give all the required permissions 
4. then you need to edit the crontab 
5. run the command crontab -e
6. then choose a fileeditor
7. then add the command @reboot /etc/init.d/batteryInfoNotify.sh (path to the script)
