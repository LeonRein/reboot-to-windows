#!/bin/sh

if [ "$UID" == 0 ]; then # If root:
    ICON_FILE=/usr/share/pixmaps/reboot-to-windows.svg
    EXECUTABLE=/usr/bin/reboot-to-windows
    WRAPPER_FILE=/usr/lib/reboot-to-windows-pkexec.sh
    DESKTOP_FILE=/usr/share/applications/reboot-to-windows.desktop
    POLICY_FILE=/usr/share/polkit-1/actions/wartybix.reboot-to-windows.policy
    rm $POLICY_FILE
else #If user:
    ICON_FILE=~/.local/share/icons/reboot-to-windows.svg
    EXECUTABLE=~/.local/bin/reboot-to-windows.sh
    WRAPPER_FILE=~/.local/lib/reboot-to-windows-pkexec.sh
    DESKTOP_FILE=~/.local/share/applications/reboot-to-windows.desktop
fi

rm $ICON_FILE
rm $EXECUTABLE
rm $WRAPPER_FILE
rm $DESKTOP_FILE
