{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib { inherit lib; };
  myvars = import ../vars { inherit lib; };
  genSpecialArgs = system: hostname: let
    vars = myvars.${hostname};
    in
    inputs
    // {
      inherit mylib myvars vars;
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
  };
  args = { inherit inputs lib mylib myvars genSpecialArgs; };
  nixosSystems = {
    x86_64-linux = import ./x86_64-linux (args // {system = "x86_64-linux";});
  };
  darwinSystems = {
    aarch64-darwin = import ./aarch64-darwin (args // {system = "aarch64-darwin";});
  };
  darwinConfigurations =
    lib.attrsets.mergeAttrsList (map (it: it.darwinConfigurations or {}) darwinSystemValues);
  nixosConfigurations =
    lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations or {}) nixosSystemValues);
  allSystems = nixosConfigurations // darwinConfigurations;
  allSystemNames = builtins.attrNames allSystems;
  nixosSystemValues = builtins.attrValues nixosSystems;
  darwinSystemValues = builtins.attrValues darwinSystems;
  in {
    inherit nixosConfigurations darwinConfigurations;
  }
