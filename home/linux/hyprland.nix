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
  };
}
