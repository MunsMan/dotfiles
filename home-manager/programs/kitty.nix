{ pkgs, ... }: {

  home.file = {
    ".config/kitty/pass_keys.py".source = ../non-nix/kitty/pass_keys.py;
    ".config/kitty/navigate_kitty.py".source =
      ../non-nix/kitty/navigate_kitty.py;
    ".config/kitty/ssh.conf".source = ../non-nix/kitty/ssh.conf;
    ".config/kitty/session_manager.py".source =
      ../non-nix/kitty/session_manager.py;
  };
  programs.zsh.shellAliases = {
    icat = "kitten icat";
    ssh = "kitten ssh";
  };
  programs.kitty = {
    enable = true;
    font = {
      package =
        (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; });
      name = "JetBrains Mono";
      size = 15;
    };
    settings = {
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
      disable_ligatures = "cursor";
      window_margin_width = "0";
      window_padding_width = "2 2 4 2";
      hide_window_decorations = "titlebar-only";
      background_opacity = "0.9";
      shell_integration = "";
      copy_on_select = "yes";

      # Colors
      foreground = "#abb2bf";
      background = "#1e2127";
      # black
      color0 = "#282c34";
      color8 = "#5c6370";
      # red
      color1 = "#e06c75";
      color9 = "#e06c75";
      # green
      color2 = "#98c379";
      color10 = "#98c379";
      # yellow
      color3 = "#d19a66";
      color11 = "#d19a66";
      # blue
      color4 = "#61afef";
      color12 = "#61afef";
      # magenta
      color5 = "#c678dd";
      color13 = "#c678dd";
      # cyan
      color6 = "#56b6c2";
      color14 = "#56b6c2";
      # white
      color7 = "#abb2bf";
      color15 = "#ffffff";
      active_tab_foreground = "#282c34";
      active_tab_background = "#979eab";
      inactive_tab_foreground = "#abb2bf";
      inactive_tab_background = "#282c34";
    };
    keybindings = {
      "command+E" = "new_window_with_cwd";
      "command+shift+F" =
        "launch --type=overlay --stdin-source=@screen_scrollback /bin/sh -c '${pkgs.fzf}/bin/fzf --no-sort --no-mouse --exact -i --tac | kitty +kitten clipboard'";
      "command+F" =
        "kitten kitty-scrollback.nvim/python/kitty_scrollback_nvim.py";
      "command+H" =
        "kitten kitty-scrollback.nvim/python/kitty_scrollback_nvim.py --config ksb_buildin_last_cmd_output";
      "command+G" =
        "launch --type=overlay --cwd=current ${pkgs.lazygit}/bin/lazygit";
      "command+O" =
        "launch --type=overlay --cwd=~/obsidian/second-brain ${pkgs.neovim}/bin/nvim -c ObsidianToday";
      "command+J" = "kitten session-manager.py ${pkgs.fzf}/bin/fzf";
      "command+K" = "send_text all \\x02s";
      "command+L" = "send_text all \\x02L";
      "command+[" = "send_text all \\x02p";
      "command+]" = "send_text all \\x02P";
      "command+;" = "send_text all \\x02:";
      "command+T" = "send_text all \\x02c";
      "command+W" = "send_text all \\x02x";
      "command+Z" = "send_text all \\x02z";
      "ctrl+I" = "send_text all \\x0c";
      "ctrl+n" = "kitten pass_keys.py neighboring_window bottom ctrl+n";
      "ctrl+e" = "kitten pass_keys.py neighboring_window top ctrl+e";
      "ctrl+h" = "kitten pass_keys.py neighboring_window left ctrl+h";
      "ctrl+i" = "kitten pass_keys.py neighboring_window right ctrl+l";
    };
  };
}
