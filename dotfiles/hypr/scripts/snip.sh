#!/bin/bash
grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') | wl-copy
