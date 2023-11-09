{ ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font Regular";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
      font_size = 16;

      window_margin_width = "0";
      window_padding_width = "2 2 4 2";
      hide_window_decorations = "titlebar-only";
      background_opacity = "0.9";
      foreground = "#abb2bf";
      background = "#1e2127";
      #black
      color0 = "#282c34";
      color8 = "#5c6370";
      # red
      color1 = "#e06c75";
      color9 = "#e06c75";
      #green
      color2 = "#98c379";
      color10 = "#98c379";
      #yellow
      color3 = "#d19a66";
      color11 = "#d19a66";
      #blue
      color4 = "#61afef";
      color12 = "#61afef";
      #magenta
      color5 = "#c678dd";
      color13 = "#c678dd";
      #cyan
      color6 = "#56b6c2";
      color14 = "#56b6c2";
      #white
      color7 = "#abb2bf";
      color15 = "#ffffff";
      active_tab_foreground = "#282c34";
      active_tab_background = "#979eab";
      inactive_tab_foreground = "#abb2bf";
      inactive_tab_background = "#282c34";
    };
    keybindings = {
      "command+E" = ''send_text all \x02"'';
      "command+shift+E" = "send_text all \\x02%";
      "command+F" = "send_text all \\x02f";
      "command+G" = "send_text all \\x02g";
      "command+O" = "send_text all \\x02o";
      "command+J" = "send_text all \\x02\\x54";
      "command+K" = "send_text all \\x02s";
      "command+L" = "send_text all \\x02L";
      "command+[" = "send_text all \\x02p";
      "command+]" = "send_text all \\x02P";
      "command+;" = "send_text all \\x02:";
      "command+T" = "send_text all \\x02c";
      "command+W" = "send_text all \\x02x";
      "command+Z" = "send_text all \\x02z";
      "control+I" = "send_text all \\x0c";
    };
  };
}
