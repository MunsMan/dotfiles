{
  programs.git = {
    enable = true;
    userEmail = "munsman.github@gmail.com";
    userName = "MunsMan";
    extraConfig = {
        credential.helper = "osxkeychain";
        core = {
            editor = "nvim";
            autocrlf = "input";
        };
        color.ui = true;
        init.defaultBranch = "main";
    };
    ignores = [
        ".DS_Store"
    ];
  };
}
