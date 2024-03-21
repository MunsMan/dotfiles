{ config, lib, pkgs, ... }:
with lib; {
  options.skhd = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Simple hotkey daemon for macOS.
      '';
    };
  };
  config = mkIf config.skhd.enable {
    environment.systemPackages = with pkgs; [ ];
    services.skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # Open new Terminal
        alt - return : wezterm -e /bin/zsh

        # focus window
        alt - h : yabai -m window --focus west
        alt - n : yabai -m window --focus south
        alt - e : yabai -m window --focus north
        alt - i : yabai -m window --focus east

        # focus desktop
        ctrl + alt - 1 : yabai -m display --focus 1
        ctrl + alt - 2 : yabai -m display --focus 2
        ctrl + alt - 3 : yabai -m display --focus 3
        ctrl + alt - 4 : yabai -m display --focus 4
        ctrl + alt - l : yabai -m display --focus next
        ctrl + alt - u : yabai -m display --focus prev

        # focus space
        alt - 1 : yabai -m space --focus 1 
        alt - 2 : yabai -m space --focus 2 
        alt - 3 : yabai -m space --focus 3 
        alt - 4 : yabai -m space --focus 4 
        alt - 5 : yabai -m space --focus 5 
        alt - 6 : yabai -m space --focus 6 
        alt - 7 : yabai -m space --focus 7 
        alt - 8 : yabai -m space --focus 8 
        alt - 9 : yabai -m space --focus 9 

        # move managed window
        shift + alt - h : yabai -m window --warp west
        shift + alt - n : yabai -m window --warp south
        shift + alt - e : yabai -m window --warp north
        shift + alt - i : yabai -m window --warp east

        # swap managed window
        shift + alt + ctrl - h : yabai -m window --swap west
        shift + alt + ctrl - n : yabai -m window --swap south
        shift + alt + ctrl - e : yabai -m window --swap north
        shift + alt + ctrl - i : yabai -m window --swap east

        # rotate tree
        alt - r : yabai -m space --rotate 90

        # toggle window fullscreen zoom
        alt - f : yabai -m window --toggle zoom-fullscreen

        # alt - d : yabai -m window --toggle
        alt - d : yabai -m window --toggle sticky;\
                  yabai -m window --toggle topmost;\
                  yabai -m window --toggle pip

        # toggle padding and gap
        alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

        # float / unfloat window and center on screen
        alt - t : yabai -m window --toggle float;\
                  yabai -m window --grid 4:4:1:1:2:2

        # toggle window split type
        alt - l : yabai -m window --toggle split

        # balance size of windows
        shift + alt - t : yabai -m space --balance

        # move window and focus desktop
        shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
        shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2
        shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3
        shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4
        shift + alt - 5 : yabai -m window --space 5; yabai -m space --focus 5
        shift + alt - 6 : yabai -m window --space 6; yabai -m space --focus 6
        shift + alt - 7 : yabai -m window --space 7; yabai -m space --focus 7
        shift + alt - 8 : yabai -m window --space 8; yabai -m space --focus 8
        shift + alt - 9 : yabai -m window --space 9; yabai -m space --focus 9



      '';
    };
  };
}
