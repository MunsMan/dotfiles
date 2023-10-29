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

    programs.home-manager.enable = true;
}
