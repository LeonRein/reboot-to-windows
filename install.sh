#!/bin/sh

if [ $UID == 0 ]; then
	ICON_LOCATION=/usr/share/pixmaps/
	EXECUTABLE_LOCATION=/usr/bin/reboot-to-windows
	WRAPPER_LOCATION=/usr/lib/reboot-to-windows-pkexec.sh
	DESKTOP_FILE=reboot-to-windows.root.desktop
	DESKTOP_FILE_LOCATION=/usr/share/applications/reboot-to-windows.desktop
	POLICY_FILE_LOCATION=/usr/share/polkit-1/actions/wartybix.reboot-to-windows.policy
	install -Dm644 polkit/wartybix.reboot-to-windows.policy "$POLICY_FILE_LOCATION"
else
	ICON_LOCATION=~/.local/share/icons/
	EXECUTABLE_LOCATION=~/.local/bin/
	WRAPPER_LOCATION=~/.local/lib/reboot-to-windows-pkexec.sh
	DESKTOP_FILE=reboot-to-windows.user.desktop
	DESKTOP_FILE_DIR=~/.local/share/applications/
	DESKTOP_FILE_LOCATION=$DESKTOP_FILE_DIR/reboot-to-windows.desktop

	mkdir -p $ICON_LOCATION $EXECUTABLE_LOCATION $DESKTOP_FILE_DIR $(dirname $WRAPPER_LOCATION)
fi

install -Dm644 icons/reboot-to-windows.svg "$ICON_LOCATION/reboot-to-windows.svg"
install -Dm755 scripts/reboot-to-windows.sh "$EXECUTABLE_LOCATION"
install -Dm755 scripts/reboot-to-windows-pkexec.sh "$WRAPPER_LOCATION"
install -Dm644 desktop/$DESKTOP_FILE "$DESKTOP_FILE_LOCATION"

if [ "$DESKTOP_SESSION" = "plasma" ]; then # If user running KDE Plasma:
# Check for 'qdbus' command. If empty, set to -1.
QDBUS=`which qdbus 2>/dev/null || echo -1`
if [ "$QDBUS" = "-1" ]; then # If qdbus command not found:
	echo "Install the 'qt' or 'qt5-tools' or similar package from your package manager to provide support for KDE's reboot prompt."
fi
fi

if [ $UID == 0 ]; then
	echo "**********************************************************************"
	echo "To allow wheel users to reboot to Windows without a password, copy the rules file:"
	echo "  sudo cp /usr/share/doc/reboot-to-windows-git/rules.d/50-wartybix.reboot-to-windows.rules /etc/polkit-1/rules.d/"
	echo "**********************************************************************"
fi
