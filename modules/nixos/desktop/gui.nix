{hostname, vars, config, lib, pkgs, ...}:
{
  networking.hostName = "shugbook";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    useXkbConfig = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;
  services.seatd.enable = true;

  users.users.${vars.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "lp" "kvm" "uucp" "input" "seat" "dialout"];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];

  services.openssh.enable = true;
}
