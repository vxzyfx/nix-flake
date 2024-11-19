{
  mylib,
  vars,
  mac-app-util,
  pkgs,
  ...
}: {
  home = {
    username = vars.username;
    homeDirectory = "/Users/${vars.username}";
  };
  home.packages = with pkgs;[
  ];
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
