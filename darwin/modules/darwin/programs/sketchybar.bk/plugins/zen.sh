#!/bin/bash

zen_on() {
  sketchybar --set wifi drawing=off \
             --set apple.logo drawing=off \
             --set '/cpu.*/' drawing=off \
             --set calendar icon.drawing=off \
             --set front_app drawing=off \
             --set volume_icon drawing=off \
             --set space.1 drawing=off \
             --set space.2 drawing=off \
             --set space.3 drawing=off \
             --set space.4 drawing=off \
             --set space.5 drawing=off \
             --set space.6 drawing=off \
             --set space.7 drawing=off \
             --set mic drawing=off \
             --set github.bell drawing=off \
             --set spotify.anchor drawing=off \
             --set spotify.play updates=off \
             --set brew drawing=off
}

zen_off() {
  sketchybar --set wifi drawing=on \
             --set apple.logo drawing=on \
             --set '/cpu.*/' drawing=on \
             --set calendar icon.drawing=on \
             --set github.bell drawing=on \
             --set space.1 drawing=on \
             --set space.2 drawing=on \
             --set space.3 drawing=on \
             --set space.4 drawing=on \
             --set space.5 drawing=on \
             --set space.6 drawing=on \
             --set space.7 drawing=on \
             --set mic drawing=on \
             --set front_app drawing=on \
             --set volume_icon drawing=on \
             --set spotify.play updates=on \
             --set brew drawing=on
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query apple.logo | jq -r ".geometry.drawing")" = "on" ]; then
    zen_on
  else
    zen_off
  fi
fi

