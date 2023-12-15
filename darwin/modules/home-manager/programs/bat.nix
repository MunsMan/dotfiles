{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "OneHalfDark";
      italic-text = "always";
    };
    themes = {
      onedark = {
        src = pkgs.fetchFromGitHub {
          owner = "sl0ki";
          repo = "sublime-one-dark-theme";
          rev = "434bac282b11d462820409d77635b6bf13c175e5";
          sha256 = "sha256-OcvTpW+Ei3SYah6PEVzw8zypmB1Cv22SgAYRdi+/ICI=";
        };
        file = "OneDark.tmTheme";
      };
    };
  };
}
