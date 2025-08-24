#!/bin/bash

# Get currently playing track info
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# Output format: "Artist - Title"
if [[ -n "$title" && -n "$artist" ]]; then
    echo "$artist - $title"
elif [[ -n "$title" ]]; then
    echo "$title"
else
    echo ""
fi

