#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_right=0
  icon.y_offset=1
  label.width=45
  label.align=right
  label.y_offset=1
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
