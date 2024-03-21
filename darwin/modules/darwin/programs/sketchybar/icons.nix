{ pkgs }:

pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "sketchybar-app-font";
  version = "2.0.13";

  src = pkgs.fetchurl {
    url =
      "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v${finalAttrs.version}/sketchybar-app-font.ttf";
    sha256 = "sha256-V4VD0EpMKTN56HMvpmLSldtjs7L6ar61pwxVwUrE6/8=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 $src $out/share/fonts/sketchybar-app-font.ttf

    runHook postInstall
  '';

  meta = {
    description =
      "A ligature-based symbol font and a mapping function for sketchybar";
    longDescription = ''
      A ligature-based symbol font and a mapping function for sketchybar, inspired by simple-bar's usage of community-contributed minimalistic app icons.
    '';
    license = pkgs.lib.licenses.cc0; # Adjust the license accordingly
  };
})

