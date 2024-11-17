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
      commandLineArgs = "--ozone-platform=wayland --enable-wayland-ime";
    })
  ];
  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.override {
      commandLineArgs = "--ozone-platform=wayland --enable-wayland-ime --gtk-version=4";
    });
  };
}
