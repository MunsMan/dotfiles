{ pkgs, vars, ... }: {
  environment.darwinConfig = "$HOME/.config/darwin/configuration.nix";

  users.users = {
    ${vars.username} = {
      description = "Personal account";
      createHome = true;
      home = "/Users/${vars.username}";
      name = "${vars.username}";
      shell = pkgs.zsh;
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
    jq
    darwin.trash
    lazygit
    openconnect
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Darwin Modules
  imports = [ programs/sketchybar programs/skhd programs/yabai ];

  skhd.enable = true;
  yabai.enable = true;

  # Homebrew packages to be installed in addition to the packages provided
  homebrew = {
    enable = true;
    global = { autoUpdate = false; };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    brews = [ "podman" ];
    casks = [
      "arc"
      "discord"
      "zoom"
      "wezterm"
      "whatsapp"
      "obsidian"
      "sf-symbols"
      "microsoft-word"
      "skim"
      "macs-fan-control"
      "karabiner-elements"
      "raycast"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog

  system = {
    stateVersion = 4;
    defaults = { dock.autohide = true; };
  };
}
