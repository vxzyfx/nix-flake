{
  pkgs,
  ...
} @ args: {
  imports = [ ../base.nix ];
  nix.optimise = {
    automatic = true;
    interval =  [ "weekly" ];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
}
