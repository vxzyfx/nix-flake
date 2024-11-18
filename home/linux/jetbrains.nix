{pkgs, lib, ...}:
let 
addvmopts = package: [ (package.override { vmopts = "-Dawt.toolkit.name=WLToolkit"; }) ];
packages = with pkgs; [
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
in
{
  home.packages = lib.lists.concatMap addvmopts packages;
}
