{vars, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ./logid.nix
  ];
  services.udev = {
    enable = true;
    extraRules = ''
     RUN+="${pkgs.coreutils-full}/bin/chgrp wheel /sys/class/backlight/intel_backlight/brightness"
     RUN+="${pkgs.coreutils-full}/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness" 
    '';
  };
  nixpkgs.config.allowUnfree = true;
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
  users.users.${vars.username} = {
    extraGroups = [ "qemu-libvirtd" "libvirtd"];
  };
  system.stateVersion = "24.05";
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
          packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };
    environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
