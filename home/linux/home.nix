{
  lib,
  vars,
  ...
}: {
  home.homeDirectory = lib.mkForce "/home/${vars.username}";
}
