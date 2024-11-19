{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    nodejs_22
    rustup
    python312
    python312Packages.pip
    go
    dotnet-sdk_8
    php83
    ruby_3_3
    gcc14
  ];
}
