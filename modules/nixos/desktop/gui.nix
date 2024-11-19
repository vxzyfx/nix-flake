{hostname, vars, config, lib, pkgs, ...}:
{
  networking.hostName = hostname;

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
  programs.uwsm = {
    enable = true;
    waylandCompositors.hyprland = {
      binPath = "/etc/profiles/per-user/${vars.username}/bin/Hyprland";
      comment = "Hyprland session managed by uwsm";
      prettyName = "Hyprland";
    };
  };
  security.polkit.enable = true;

  users.users.${vars.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "lp" "kvm" "uucp" "input" "seat" "dialout" ];
  };
  fonts.packages  = with pkgs; [
      material-design-icons
      font-awesome
      vistafonts-chs

      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    unzip
    polkit_gnome
  ];

  services.openssh.enable = true;
}
