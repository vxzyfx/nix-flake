{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    curlHTTP3
    rar
    jq
    fzf
  ];
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    taps = [
      "homebrew/services"
    ];
    brews = [
      "openjdk@17"
      "openjdk@21"
    ];
    casks = [
      "wireshark"
      "google-chrome"
      "firefox"
    ];
  };
}
