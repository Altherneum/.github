
#!/bin/bash
# Restore the most recently minimized window

ADDR=$(hyprctl activewindow -j | jq -r '.address')

if [ -n "$ADDR" ] && [ "$ADDR" != "null" ]; then
    WORKSPACE=0
    hyprctl dispatch "hl.dsp.window.move({workspace = \"${WORKSPACE}\", window = \"address:${ADDR}\"})"
    hyprctl dispatch workspace 0
fi
