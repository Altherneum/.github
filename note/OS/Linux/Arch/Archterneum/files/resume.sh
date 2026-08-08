
#!/bin/bash
# Restore the most recently minimized window

ADDR=$(hyprctl activewindow -j | jq -r '.address')

if [ -n "$ADDR" ] && [ "$ADDR" != "null" ]; then
    WORKSPACE=$(hyprctl activeworkspace -j | jq '.id')
    if [ -n "$WORKSPACE" ] && [ "$WORKSPACE" != "null" ]; then
        hyprctl dispatch "hl.dsp.window.move({workspace = \"${WORKSPACE}\", window = \"address:${ADDR}\"})"
    fi
fi