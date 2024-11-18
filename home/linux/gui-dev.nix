{pkgs, ...}:
{
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-rime ];
  programs.alacritty = {
    enable = true;
    settings = {
      colors.bright = {
        black = "#444b6a";
        blue = "#7da6ff";
        cyan = "#0db9d7";
        green = "#b9f27c";
        magenta = "#bb9af7";
        red = "#ff7a93";
        white = "#acb0d0";
        yellow = "#ff9e64";
      };
      colors.normal = {
        black = "#32344a";
        blue = "#7aa2f7";
        cyan = "#449dab";
        green = "#9ece6a";
        magenta = "#ad8ee6";
        red = "#f7768e";
        white = "#787c99";
        yellow = "#e0af68";
      };
      colors.primary = {
        background = "#1a1b26";
        foreground = "#a9b1d6";
      };
      cursor.style = {
        shape = "Underline";
      };
      env = {
        TERM = "xterm-256color";
      };

      font = {
        size = 12.0;
      };

      font.normal = {
        family = "JetBrainsMono NFM";
        style = "Regular";
      };
    };
  };
}
