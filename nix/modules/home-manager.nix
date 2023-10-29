{ config, lib, pkgs, ... }:
let
 username = "munsman";
 in
{
    home = {
            inherit username;
            homeDirectory = "/Users/${username}";
            stateVersion = "23.05";
        };
    manual.manpages.enable = false;
    programs.home-manager.enable = true;
}
