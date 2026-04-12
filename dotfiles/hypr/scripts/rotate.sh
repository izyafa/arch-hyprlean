#!/bin/bash

# Defining internal monitor name
MONITOR="WAYLAND-1"

# Get current transform state using hyprctl and jq
CURRENT_TRANSFORM=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$MONITOR\") | .transform")

# notify for script

notify-send "Rotation" "Script triggered for $MONITOR"

# Calculate the next transform state (Cycle: 0 -> 1 -> 2 -> 3 -> 0)
if [ "$CURRENT_TRANSFORM" == "0" ]; then
	NEXT_TRANSFORM=1
elif [ "$CURRENT_TRANSFORM" == "1" ]; then
	NEXT_TRANSFORM=2
elif [ "$CURRENT_TRANSFORM" == "2" ]; then
	NEXT_TRANSFORM=3
else
	NEXT_TRANSFORM=0
fi

notify-send "Rotation" "Flipped to $NEXT_TRANSFORM"

hyprctl keyword monitor "$MONITOR,preferred,auto,1,transform,$NEXT_TRANSFORM"
