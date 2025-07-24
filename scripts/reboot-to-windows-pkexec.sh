#!/bin/sh

case "$1" in
    "set-boot")
        efibootmgr -n "$2"
        ;;
    "reboot")
        echo "Rebooting system..."
        # systemctl reboot
        ;;
    *)
        echo "Usage: $0 {set-boot <boot_id>|reboot}"
        exit 1
        ;;
esac
