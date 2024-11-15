{
  vars,
  ...
}:
let
  hostname = "shugMacStudio";
in {
  services.nix-daemon.enable = true;
  users.users.shug.home = "/Users/${vars.username}";
  system.stateVersion = 5;
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;
}
