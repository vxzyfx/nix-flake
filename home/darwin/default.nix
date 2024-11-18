{
  mylib,
  vars,
  ...
}: {
  home = {
    username = vars.username;
    homeDirectory = "/Users/${vars.username}";
  };
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
  imports =
    (mylib.scanPaths ./.)
    ++ [
      ../base/core
    ];
}
