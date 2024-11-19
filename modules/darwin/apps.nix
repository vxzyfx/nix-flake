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
    casks = [
      "wireshark"
      "google-chrome"
      "firefox"
    ];
  };
}
