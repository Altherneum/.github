#!/bin/bash
# Start GNOME Keyring Daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets)
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID