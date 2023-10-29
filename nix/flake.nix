{
  description = "Home Manager Flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/release-23.05"; 
      home-manager = { 
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { home-manager, nixpkgs, ... }: 
    let
        system = "x86_64-darwin";
    in {
      homeConfigurations = {
        mbp = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [
                ./modules/home-manager.nix
            ];
      };
    };
};
}
