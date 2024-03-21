{ pkgs, ... }:
let icons = import ./icons.nix { inherit pkgs; };
in {
  fonts.fonts = [ icons ];
  services.sketchybar = {
    enable = true;
    # config = builtins.readFile ./sketchybarrc;
    extraPackages = with pkgs; [ jq ];
  };
}
