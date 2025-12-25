#!/usr/bin/env bash
DEVICE="/dev/input/event15"  # Replace with your TrackPoint event
DOUBLE_TAP_TIMEOUT=0.3      # Seconds between taps
LAST_PRESS=0

while true; do
    # Wait for a middle-button press event (BTN_MIDDLE = 272)
    read -r line < <(evtest --grab "$DEVICE" | grep --line-buffered "value 1")
    
    NOW=$(date +%s.%N)
    DIFF=$(echo "$NOW - $LAST_PRESS" | bc)
    
    if (( $(echo "$DIFF < $DOUBLE_TAP_TIMEOUT" | bc -l) )); then
        # Double-tap detected, launch Rofi
        rofi -show drun &
        LAST_PRESS=0
    else
        LAST_PRESS=$NOW
    fi
done

