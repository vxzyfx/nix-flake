{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    curlHTTP3
  ];
  environment.variables.EDITOR = "nvim";
  homebrew = {
    enable = true;
    taps = [
      "homebrew/services"
    ];
  };
}
