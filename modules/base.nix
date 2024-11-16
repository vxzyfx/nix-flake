{
  pkgs,
  ...
} @ args: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Asia/Shanghai";
}
