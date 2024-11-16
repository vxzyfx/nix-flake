{
  pkgs,
  hostname,
  vars,
  ...
} @ args: {
  services.nix-daemon.enable = true;
  users.users.${vars.username} = {
    home = "/Users/${vars.username}";
  };
  system.stateVersion = 5;
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;
  nix.optimise = {
    automatic = true;
    interval = [ 
      {
        Weekday = 7;
      }
    ];
  };
  nix.gc = {
    automatic = true;
    interval = [ 
      {
        Weekday = 7;
      }
    ];
    options = "--delete-older-than 1w";
  };
}
