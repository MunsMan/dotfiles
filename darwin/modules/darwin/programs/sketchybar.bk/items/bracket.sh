status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add bracket status brew ip_address volume_icon \
           --set status "${status_bracket[@]}"
