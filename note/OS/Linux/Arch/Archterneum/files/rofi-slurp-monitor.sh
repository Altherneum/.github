#!/bin/bash

# Use slurp to create invisible overlay for click detection
# Modified version that does NOT interfere with RoFi clicking

get_rofi_dimensions() {
    local font_line=$(grep -o "font:.*[0-9]\+" ~/.config/ml4w/settings/rofi-font.rasi 2>/dev/null | grep -o "[0-9]\+")
    local font_size=${font_line:-16}

    local width_em=$(grep -A 5 "^window {" ~/.config/rofi/config.rasi 2>/dev/null | grep "width:" | grep -o '[0-9]\+' | head -1)
    local height_em=$(grep -A 5 "^window {" ~/.config/rofi/config.rasi 2>/dev/null | grep "height:" | grep -o '[0-9]\+' | head -1)

    local width_px=$((${width_em:-56} * font_size))
    local height_px=$((${height_em:-35} * font_size))

    echo "$width_px $height_px"
}

monitor_rofi_with_slurp() {
    local rofi_pid
    local slurp_pid
    local max_attempts=10

    # Wait for rofi to start
    for ((i=0; i<max_attempts; i++)); do
        rofi_pid=$(pgrep -x rofi)
        if [ -n "$rofi_pid" ]; then
            break
        fi
        sleep 0.05
    done
    
    if [ -z "$rofi_pid" ]; then
        echo "Rofi not found! Exiting."
        return 1
    fi

    echo "Monitoring rofi PID: $rofi_pid"

    # Get screen and rofi dimensions
    local screen_info=$(hyprctl monitors -j 2>/dev/null | jq -r '.[0] | "\(.width) \(.height)"' 2>/dev/null)
    read -r screen_w screen_h <<< "$screen_info"

    if [ -z "$screen_w" ] || [ -z "$screen_h" ]; then
        echo "Could not get screen dimensions. Using defaults."
        screen_w=1920
        screen_h=1080
    fi

    read -r rofi_width rofi_height <<< "$(get_rofi_dimensions)"
    local rofi_x=$(( (screen_w - rofi_width) / 2 ))
    local rofi_y=$(( (screen_h - rofi_height) / 2 ))

    echo "Screen: ${screen_w}x${screen_h}"
    echo "Rofi bounds: ${rofi_x},${rofi_y} ${rofi_width}x${rofi_height}"

    # Start slurp overlay with proper timing and no blocking
    slurp -b '#00000000' -c '#00000000' -s '#00000000' >/dev/null 2>&1 &
    local slurp_pid=$!

    # Monitor both rofi and slurp processes
    local last_check=0
    for ((i=0; i<300; i++)); do  # Limit to 5 minutes max (300 * 0.1 = 30s check interval)
        sleep 0.1

        # Check if rofi is still running
        if ! kill -0 "$rofi_pid" 2>/dev/null; then
            echo "Rofi closed naturally, killing slurp"
            kill "$slurp_pid" 2>/dev/null
            break
        fi

        # Check if slurp is still running (user interaction)
        if ! kill -0 "$slurp_pid" 2>/dev/null; then
            echo "Slurp interaction detected, closing rofi"
            kill "$rofi_pid" 2>/dev/null
            break
        fi

        last_check=$((i * 10))
    done

    echo "Monitoring session ended."
    kill "$slurp_pid" 2>/dev/null
}

monitor_rofi_with_slurp