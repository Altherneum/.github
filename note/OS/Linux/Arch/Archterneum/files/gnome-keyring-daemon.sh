#!/bin/bash

# 1. Force set XDG_RUNTIME_DIR if missing (Critical for manual runs)
if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

# 2. Create the directory if it doesn't exist (Fixes "No such file" error)
# Note: In a real Hyprland session, this dir usually exists, but manual runs need this.
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi

# 3. Start the daemon (Secrets component ONLY)
# Use --foreground to prevent immediate detachment issues in some shells, 
# but daemonize is standard. The eval captures the exports.
eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets)

# 4. Fallback export if eval produced no output (e.g., daemon already running)
if [ -z "$GNOME_KEYRING_CONTROL" ]; then
    export GNOME_KEYRING_CONTROL="$XDG_RUNTIME_DIR/keyring"
fi