{
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "shugMacmini";
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
      "home/base/dev"
    ];
  };
  systemArgs = modules // args;
in {
  darwinConfigurations = {
    "${name}" = mylib.darwinSystem systemArgs;
  };
}
