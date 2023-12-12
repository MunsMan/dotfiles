{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, darwin, home-manager, utils, ... }:
    utils.lib.eachSystem [ "x86_64-darwin" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        darwinConfig =
          import ./configuration.nix { inherit system pkgs darwin; };
        homeManagerConfig =
          import ./home.nix { inherit system pkgs home-manager; };
      in
      {
        darwinConfigurations = {
          mbp = darwin.lib.darwinSystem {
            inherit pkgs system;
            modules = [ darwinConfig ];
          };
        };
        homeConfigurations = {
          mbp-home = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ homeManagerConfig ];
          };
        };
      });
}
