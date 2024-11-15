{
  lib,
  inputs,
  darwin-modules,
  home-modules ? [],
  myvars,
  hostname,
  system,
  genSpecialArgs,
  specialArgs ? (genSpecialArgs system hostname),
  ...
}: let
  inherit (inputs) home-manager nix-darwin;
in
  nix-darwin.lib.darwinSystem {
    inherit system specialArgs;
    modules =
      darwin-modules
      ++ (
        lib.optionals ((lib.lists.length home-modules) > 0)
        [
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users."${specialArgs.vars.username}".imports = home-modules;
          }
        ]
      );
  }
