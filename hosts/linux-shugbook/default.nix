{vars, ...}:
let
  hostName = "shugbook";
in {
  imports = [
    ./hardware-configuration.nix
  ];
  networking.useDHCP = false;
  networking.wireless.iwd.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "nouveau" ];
  systemd.network.enable = true;
  systemd.network.networks.wlan0 = {
    enable = true;
    matchConfig = {
      Name = "wlan0";
    };
    name = "wlan0";
    gateway =  [ "192.168.21.1" ];
    address = [ "192.168.21.91/24" ];
  };

  system.stateVersion = "24.05";
}
