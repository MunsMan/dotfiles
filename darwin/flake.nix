{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, darwin, home-manager, ... }:
    let
      pkgs = import nixpkgs { inherit system; };
      darwinConfig = import ./modules/darwin { inherit system pkgs vars; };
      homeManagerConfig =
        import ./modules/home-manager { inherit system pkgs vars; };
      system = "x86_64-darwin";
      vars = {
        username = "munsman";
        location = "$HOME/.config/darwin";
        terminal = "wezterm";
        editor = "nvim";
      };
    in
    {
      homeConfigurations = {
        my-home = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ homeManagerConfig ];
        };
      };
      darwinConfigurations = {
        mbp = darwin.lib.darwinSystem {
          inherit pkgs system;
          modules = [ darwinConfig ];
        };
      };
    };
}
