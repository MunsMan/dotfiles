{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "sketchybar-app-font";
  version = "0.1.0";

  src = lib.fetchFromGitHub {
    owner = "kvndrsslr";
    repo = pname;
    rev =
      "master"; # You might want to pin this to a specific commit or tag for reproducibility
    sha256 =
      "0"; # Replace with the correct sha256 of the repo for security and reproducibility
  };

  buildInputs = with pkgs; [ nodejs_21 nodePackages.pnpm ];

  unpackPhase = "true";

  buildPhase = ''
    cd $src
    pnpm install
    pnpm run build:install
  '';

  installPhase = ''
    echo "No installation needed."
  '';

  meta = {
    description = "Nix build for sketchybar-app-font project";
    homepage = "https://github.com/kvndrsslr/sketchybar-app-font";
    license = pkgs.stdenv.lib.licenses.mit; # Adjust the license accordingly
  };
}

