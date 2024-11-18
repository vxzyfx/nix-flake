{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    curlHTTP3
  ];
  homebrew = {
    enable = true;
    taps = [
      "homebrew/services"
    ];
  };
}
