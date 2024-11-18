{
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "shugbook";
  base-modules = {
    hostname = name;
    nixos-modules = map mylib.relativeToRoot [
      "modules/nixos/desktop"
      "hosts/linux-${name}"
    ];
    home-modules = map mylib.relativeToRoot [
      "home/linux/gui.nix"
      "hosts/linux-${name}/home.nix"
      "home/base/dev"
    ];
  };
in {
  nixosConfigurations = {
    "${name}" = mylib.nixosSystem (base-modules // args);
  };
}
