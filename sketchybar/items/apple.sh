APPLE=(
  icon=$APPLE_ICON
  label.drawing=off
  background.padding_left=0
  background.padding_right=20
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle"
  popup.background.border_width=2 
  popup.background.corner_radius=3 
  popup.background.border_color=$BORDER_COLR
)

sketchybar --add item apple.logo left
sketchybar --set apple.logo "${APPLE[@]}"

sketchybar --add item apple.preferences popup.apple.logo
sketchybar --set apple.preferences icon=􀺽 label="Preferences" click_script="open -a 'System Preferences';sketchybar -m --set apple.logo popup.drawing=off"
sketchybar --add item apple.activity popup.apple.logo
sketchybar --set apple.activity icon=􀒓 label="Activity" click_script="open -a 'Activity Monitor';sketchybar -m --set apple.logo popup.drawing=off"
sketchybar --add item apple.lock popup.apple.logo
sketchybar --set apple.lock icon=􀒳 label="Lock Screen" click_script="pmset displaysleepnow;sketchybar -m --set apple.logo popup"

