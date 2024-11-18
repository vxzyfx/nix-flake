{
  mylib,
  vars,
  mac-app-util,
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
      mac-app-util.homeManagerModules.default
      ../base/core
    ];
}
