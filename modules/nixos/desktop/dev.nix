{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    nodejs_22
    rustup
    python313
    go
    dotnet-sdk_8
    php83
    ruby_3_3
    gcc14
  ];
}
