{ pkgs, ... }:
let
  t-smart-manager = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "t-smart-tmux-session-manager";
    version = "unstable-2023-09-20";
    rtpFilePath = "t-smart-tmux-session-manager.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "joshmedeski";
      repo = "t-smart-tmux-session-manager";
      rev = "63360755451a1d536f5847b3a3dc41bb3050b10c";
      sha256 = "00051slyy55qdxf0l41kfw6sr46nm2br31hdkwpy879ia5acligi";
    };
  };

  tmux-nerd-font-window = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-nerd-font-window-name";
    version = "unstable-2023-11-04";
    rtpFilePath = "tmux-nerd-font-window-name.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "joshmedeski";
      repo = "tmux-nerd-font-window-name";
      rev = "0b95ff04fc7e71dee8c0e8c590919d94ea130994";
      sha256 = "sha256-4NDvAEpbrpWvYDE3G5nvUtDax9mtErpg8LRBj9suMx8=";
    };
    postInstall = ''
      sed -i -e 's|yq|${pkgs.yq-go}/bin/yq|g' $target/bin/tmux-nerd-font-window-name
    '';
  };

in
{
  home.file = {
    ".config/tmux/tmux-nerd-font-window-name.yml".source =
      ./../non-nix/tmux/tmux-nerd-font-window-name.yml;
    ".config/tmux/gitmux.yml".source = ./../non-nix/tmux/gitmux.yml;
    ".config/tmux/second_brain.sh".source = ./../non-nix/tmux/second_brain.sh;
  };
  programs.zsh.initExtra = ''
    export PATH=${t-smart-manager}/share/tmux-plugins/t-smart-tmux-session-manager/bin:$PATH
  '';

  home.packages = with pkgs; [ gitmux ];
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    prefix = "C-b";
    extraConfig = ''
      set -g detach-on-destroy off
      set -g renumber-windows on
      set -g set-clipboard on
      set -g set-titles on
      set -g set-titles-string "#W" 
      set -gq allow-passthrough

      set -g status-left-length 200    # increase length (from 10)
      set -g status-left "#[fg=blue,bold]#S"
      set -ga status-left " #[fg=white,nobold]#(${pkgs.gitmux}/bin/gitmux -cfg $HOME/.config/tmux/gitmux.yml)"
      set -g status-position top       # macOS / darwin style
      set -g status-style 'bg=default' # transparent

      set -g window-status-current-format '#[fg=magenta]#W'
      set -g window-status-format ' #[fg=gray]#W'

      set -g mode-style bg=default,fg=yellow
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'


      bind '%' split-window -c '#{pane_current_path}' -h
      bind '"' split-window -c '#{pane_current_path}'
      bind c   new-window   -c '#{pane_current_path}'
      bind g   new-window   -n '' "${pkgs.lazygit}/bin/lazygit"
      bind d   new-window   -n '' lf
      bind o   new-window   -n '' "$HOME/.config/tmux/second_brain.sh"
      bind f   copy-mode
      bind P   next-window
      bind h   select-pane  -L
      bind n   select-pane  -D
      bind e   select-pane  -U
      bind i   select-pane  -R
      bind-key T run-shell "${t-smart-manager}/share/tmux-plugins/t-smart-tmux-session-manager/bin/t"

      bind-key    -T copy-mode-vi h send-keys -X cursor-left
      bind-key    -T copy-mode-vi n send-keys -X cursor-down
      bind-key    -T copy-mode-vi e send-keys -X cursor-up
      bind-key    -T copy-mode-vi i send-keys -X cursor-right

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
      bind-key -n 'C-n' if-shell "$is_vim" 'send-keys C-n' 'select-pane -D'
      bind-key -n 'C-e' if-shell "$is_vim" 'send-keys C-e' 'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'

      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

      bind-key -n 'C-Space' if-shell "$is_vim" 'send-keys C-Space' 'select-pane -t:.+'


      bind-key -T root  h if -F "#{==:#{pane_mode},tree-mode}" "send h" "send h"
      bind-key -T root  n if -F "#{==:#{pane_mode},tree-mode}" "send j" "send n"
      bind-key -T root  e if -F "#{==:#{pane_mode},tree-mode}" "send k" "send e"
      bind-key -T root i if -F "#{==:#{pane_mode},tree-mode}" "send l" "send i"

      bind-key -T copy-mode-vi 'C-\' select-pane -l
      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-n' select-pane -D
      bind-key -T copy-mode-vi 'C-e' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'v'   send-keys -X begin-selection
      bind-key -T copy-mode-vi 'Y' send-keys -X copy-pipe-and-cancel 'xclip -sel clip -i'
      bind-key -T copy-mode-vi 'y' send-keys -X copy-selection-and-cancel
      bind-key x kill-pane # skip "kill-pane 1? (y/n)" prompt (cmd+w)
    '';
    plugins = [
      {
        plugin = t-smart-manager;
        extraConfig = ''
          set -g @t-fzf-prompt '󰹰  '
          set -g @t-bind "T"
        '';

      }
      {
        plugin = tmux-nerd-font-window;
        extraConfig = ''
          set -g @tmux-nerd-font-window-name-show-name false 
          set -g @tmux-nerd-font-window-name-shell-icon '' 
        '';
      }
    ];
  };
}
