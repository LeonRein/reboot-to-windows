#!/bin/sh

if [ $UID != 0 ]; then
    echo "Please run this uninstaller as root."
    exit 1
fi

ICON_FILE=/usr/share/pixmaps/reboot-to-windows.svg
EXECUTABLE=/usr/bin/reboot-to-windows
WRAPPER_FILE=/usr/lib/reboot-to-windows-pkexec.sh
DESKTOP_FILE=/usr/share/applications/reboot-to-windows.desktop
POLICY_FILE=/usr/share/polkit-1/actions/wartybix.reboot-to-windows.policy

rm $ICON_FILE
rm $EXECUTABLE
rm $WRAPPER_FILE
rm $DESKTOP_FILE
rm $POLICY_FILE