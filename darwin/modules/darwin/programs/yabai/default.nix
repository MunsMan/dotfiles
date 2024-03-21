{ config, lib, pkgs, ... }:
with lib; {
  options.yabai = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable yabai";
    };
  };
  config = mkIf config.yabai.enable {
    services.yabai = {
      enable = true;
      enableScriptingAddition = true;
      package = pkgs.yabai;
      config = {

        mouse_follows_focus = "off";
        focus_follows_mouse = "off";
        window_origin_display = "default";
        window_placement = "second_child";
        window_topmost = "off";
        window_shadow = "off";
        window_opacity = "on";
        active_window_opacity = "1.0";
        normal_window_opacity = "0.90";
        insert_feedback_color = "0xffd75f5f";
        split_ratio = "0.50";
        auto_balance = "off";
        mouse_modifier = "alt";
        mouse_action1 = "move";
        mouse_action2 = "resize";
        mouse_drop_action = "swap";

        layout = "bsp";
        top_padding = "10";
        bottom_padding = "10";
        left_padding = "10";
        right_padding = "10";
        window_gap = "6";
        external_bar = "main:35:0";
      };
      extraConfig = ''
        yabai -m signal --add event=window_destroyed action="yabai -m query --windows --window &> /dev/null || yabai -m window --focus recent || yabai -m window --focus first"
        yabai -m signal --add event=application_terminated action="yabai -m query --windows --window &> /dev/null || yabai -m window --focus recent || yabai -m window --focus first"
        yabai -m signal --add event=window_minimized active=yes action="if \$(yabai -m query --windows --window \$YABAI_WINDOW_ID | jq -r '.\"is-floating\"'); then yabai -m query --windows --window &> /dev/null || yabai -m window --focus mouse &> /dev/null || yabai -m window --focus \$(yabai -m query --windows --space | jq .[0].id) &> /dev/null; fi"

        yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"
        yabai -m signal --add event=window_created action="sketchybar --trigger windows_on_spaces"
        yabai -m signal --add event=window_destroyed action="sketchybar --trigger windows_on_spaces"
        yabai -m rule --add app="^Archive Utility$" manage=off
        yabai -m rule --add app="^balenaEtcher$" manage=off
        yabai -m rule --add app="^Creative Cloud$" manage=off
        yabai -m rule --add app="^Logi Options$" manage=off
        yabai -m rule --add app="Raycast" manage=off
        yabai -m rule --add app="^Info$" manage=off
        yabai -m rule --add app="^LanguageTool$" manage=off
        yabai -m rule --add app="^LanguageTool for Desktop$" manage=off
        yabai -m rule --add title="^General$" manage=off
        yabai -m rule --add title="^Passwords$" manage=off
      '';
    };
  };
}
