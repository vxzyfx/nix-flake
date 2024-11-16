{pkgs, ...}:
{
  system.keyboard.enableKeyMapping = true;
  system.keyboard.swapLeftCommandAndLeftAlt = true;
  system.defaults = {
    dock.autohide = true;
    finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
    };
    trackpad = {
        Clicking = true;  # 轻触触摸板相当于点击
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
    };
  };
  fonts = {
    packages = with pkgs; [
      material-design-icons
      font-awesome

      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };
}
