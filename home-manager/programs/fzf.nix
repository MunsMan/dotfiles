{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f";
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-p 50%,60%" ];
    };
  };
}
