# This script makes it easier to change the keyboard layout on a raspberry pi. It will reboot your pi.
#
# Add execute permission on that file with the command chmod 755 change_keyboard.sh
# Then you can run the file with ./change_keyboard.sh
#
# Look in this list to find the 2 character code for the country layout you want to use:
# https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes
#
# Written by Niels Swinkels
# Free to use and modify by everyone. Use at your own risk.

clear
echo "--------------------------------"
echo "Script to change keyboard layout"
echo "--------------------------------"
echo "Which layout should be used? tr=turkish, se=swedish, gb=english etc"
read layout

sudo sed -i 's|XKBLAYOUT=....|XKBLAYOUT="'$layout'"|g' /etc/default/keyboard

echo "Changed to"
grep "XKBLAYOUT" /etc/default/keyboard | sed 's/XKBLAYOUT=\(....\)/\1/g'
sleep 1
sudo reboot
exit 0
