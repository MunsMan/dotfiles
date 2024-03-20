#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  sketchybar -m --set mic icon="$MIC_MUTED" icon.color="$GREEN"
elif [[ $MIC_VOLUME -gt 0 ]]; then
  sketchybar -m --set mic icon="$MIC" icon.color="$RED"
fi  
