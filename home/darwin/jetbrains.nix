{pkgs, ...}:
{
  home.packages = with pkgs;[
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    jetbrains.webstorm
    jetbrains.phpstorm
    jetbrains.datagrip
    jetbrains.ruby-mine
    jetbrains.dataspell
    jetbrains.rider
    jetbrains.rust-rover
    jetbrains.goland
  ];
}
