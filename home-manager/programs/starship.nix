{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      character = {
        success_symbol = "[->](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
      git_status = {
        conflicted = "  ";
        deleted = " 󰆴×$count";
        modified = "  ×$count";
        stashed = "  ×$count";
        staged = "  ×$count";
        renamed = "  ×$count";
        untracked = "  ×$count";
        style = "white";
      };
      directory = { home_symbol = "🏠"; };
    };
  };
}
