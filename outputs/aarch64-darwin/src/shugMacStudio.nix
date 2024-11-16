{
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "shugMacStudio";
  modules = {
    hostname = name;
    darwin-modules =
      (map mylib.relativeToRoot [
        "modules/darwin"
        "hosts/darwin-${name}"
      ])
      ++ [];
    home-modules = map mylib.relativeToRoot [
      "hosts/darwin-${name}/home.nix"
      "home/darwin"
    ];
  };
  systemArgs = modules // args;
in {
  darwinConfigurations = {
    "${name}" = mylib.darwinSystem systemArgs;
  };
}
