{pkgs, ...}:
{
  home.packages = with pkgs;[
    neofetch
    nnn
    jq
    file
    tree
    btop
    (google-chrome.override {
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
    })
  ];
  programs.firefox = {
    enable = true;
  };
  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.override {
      commandLineArgs = "--ozone-platform=wayland --enable-wayland-ime --gtk-version=4";
    });
  };
}
