{ pkgs, ... }:
let ll = "${pkgs.eza}/bin/eza -alh";
in {
  home.file.".config/zsh/dev-init.txt".source = ../non-nix/zsh/dev-init.txt;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = null;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
      export PATH="/usr/local/sbin:$PATH"

      function cd() { builtin cd "$@"; ${ll}; } 

      function vpn-up() {
          echo "Starting the vpn ..."
          (echo "$(sudo cat ~/.secrets/vpn/lfu_vpn.txt)" | sudo openconnect vpn.uibk.ac.at --background --protocol=anyconnect --user=csaw8595 --passwd-on-stdin) >> /dev/null
      }

      function vpn-down(){
          processId=$(pgrep openconnect)
          if [[ processId ]]; then
              sudo kill -2 $processId
          else
              echo "openconnect pid file does not exist, probably not running"
          fi
      }

      function brew() {
        command brew "$@" 

        if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
          sketchybar --trigger brew_update
        fi
      }

      function dev-init() {
          ENV=$(cat ~/.config/zsh/dev-init.txt | ${pkgs.fzf}/bin/fzf)
          nix flake init --template github:the-nix-way/dev-templates#$ENV
      }
    '';
    shellAliases = {
      source_zsh = "source ~/.zshrc";
      c = "clear";
      f = "open -a Finder ./";
      cat = "${pkgs.bat}/bin/bat";
      ll = ll;
      ls = "${pkgs.eza}/bin/eza";
      tree = "${pkgs.erdtree}/bin/erd"; # Preferred "ls" implementation
      less = "less -FSRXc";
      e = "exit";
      "~" = "cd ~";
      "cd.." = "cd ../";
      ".." = "cd ../"; # Go back 1 directory level
      "..." = "cd ../../"; # Go back 2 directory levels
      "...." = "cd ../../../"; # Go back 3 directory levels
      ".3" = "cd ../../../"; # Go back 3 directory levels
      ".4" = "cd ../../../../"; # Go back 4 directory levels
      ".5" = "cd ../../../../../"; # Go back 5 directory levels
      ".6" = "cd ../../../../../../";
      myip = "curl http://ipecho.net/plain; echo";
    };
  };
}
