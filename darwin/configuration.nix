{ pkgs, ... }: {
  environment.darwinConfig = "$HOME/.config/darwin/configuration.nix";
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ vim jq ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  users.users = import ./users.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Darwin Modules
  imports = [ darwin/sketchybar ];

  # Homebrew packages to be installed in addition to the packages provided
  # homebrew = {
  #   enable = true;
  #   onActivation = {
  #     autoUpdate = false;
  #     upgrade = false;
  #     cleanup = "zap";
  #   };
  #   brews = [ "wireguard-tools" ];
  #   casks = [ "moonlight" "plex-media-player" ];
  # };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.defaults = { dock.autohide = true; };
}
