{ config, pkgs, vars, ... }:
{
  home = {
    inherit (vars) username;
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}

