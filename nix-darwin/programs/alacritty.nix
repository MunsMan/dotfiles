{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [ "--login" ];
      };

      env = { TERM = "xterm-256color"; };

      window = {
        opacity = 0.85;
        padding = {
          x = 5;
          y = 5;
        };
        dynamic_padding = false;
        decorations = "buttonless";
        dynamic_title = true;
      };
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrains Mono";
          style = "Bold";
        };
        italic = {
          family = "JetBrains Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrains Mono";
          style = "Bold Italic";
        };
        size = 16.0;
      };
      key_bindings = [
        {
          key = "E";
          mods = "Command";
          chars = ''\x02"'';
        }
        {
          key = "E";
          mods = "Command|Shift";
          chars = "\\x02%";
        }
        {
          key = "F";
          mods = "Command";
          chars = "\\x02f";
        }
        {
          key = "G";
          mods = "Command";
          chars = "\\x02g";
        }
        {
          key = "O";
          mods = "Command";
          chars = "\\x02o";
        }
        {
          key = "J";
          mods = "Command";
          chars = "\\x02\\x54";
        }
        {
          key = "K";
          mods = "Command";
          chars = "\\x02s";
        }
        {
          key = "L";
          mods = "Command";
          chars = "\\x02L";
        }
        {
          key = "LBracket";
          mods = "Command|Shift";
          chars = "\\x02p";
        }
        {
          key = "RBracket";
          mods = "Command|Shift";
          chars = "\\x02P";
        }
        {
          key = "Semicolon";
          mods = "Command";
          chars = "\\x02:";
        }
        {
          key = "T";
          mods = "Command";
          chars = "\\x02c";
        }
        {
          key = "W";
          mods = "Command";
          chars = "\\x02x";
        }
        {
          key = "Z";
          mods = "Command";
          chars = "\\x02z";
        }
        {
          key = "I";
          mods = "Control";
          chars = "\\x0c";
        }
        {
          key = "Q";
          mods = "Command";
          action = "Quit";
        }
        {
          key = "N";
          mods = "Command";
          action = "SpawnNewInstance";
        }
      ];
      colors = {
        primary = {
          background = "0x1e2127";
          foreground = "0xabb2bf";
        };

        normal = {
          black = "0x1e2127";
          red = "0xe06c75";
          green = "0x98c379";
          yellow = "0xd19a66";
          blue = "0x61afef";
          magenta = "0xc678dd";
          cyan = "0x56b6c2";
          white = "0xabb2bf";
        };
        # Bright colors
        bright = {
          black = "0x5c6370";
          red = "0xe06c75";
          green = "0x98c379";
          yellow = "0xd19a66";
          blue = "0x61afef";
          magenta = "0xc678dd";
          cyan = "0x56b6c2";
          white = "0xffffff";
        };
      };
    };
  };
}
