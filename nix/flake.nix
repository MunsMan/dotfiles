{
  description = "Home Manager Flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/release-23.05"; 
      home-manager = { 
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = inputs: {
      homeConfigurations = {
        mbp = inputs.home-manager.lib.homeManagerConfiguration {
            system = "x86_64-darwin";
            homeDirectory = "/Users/munsman";
            username = "munsman";
            configuration.imports = [
                "./modules/home-manager.nix"
            ];

            };
    };
  };
}
