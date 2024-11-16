{pkgs, ...}:
{
  home.packages = with pkgs;[
    neofetch
    nnn
    jq
    file
    tree
    btop
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = ''
      $mainMod = SUPER
      bind = $mainMod, R, exec, fuzzel
    '';
  };
  programs.fuzzel = {
    enable = true;
  };
  programs.kitty = {
    enable = true;
  };
  programs.firefox = {
    enable = true;
  };
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}
