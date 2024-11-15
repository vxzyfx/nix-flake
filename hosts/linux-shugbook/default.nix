{vars, ...}:
let
  hostName = "shugbook";
in {
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "nouveau" ];

  system.stateVersion = "24.05";
}
