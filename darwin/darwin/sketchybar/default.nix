{ pkgs, ... }: {
  services.sketchybar = {
    enable = true;
    # config = builtins.readFile ./sketchybarrc;
    extraPackages = with pkgs; [ jq ];
  };
}
