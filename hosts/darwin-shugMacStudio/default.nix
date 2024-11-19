{
  vars,
  hostname,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  users.users.${vars.username} = {
    openssh.authorizedKeys.keys = vars.sshAuthorizedKeys;
  };
  environment.systemPackages = with pkgs; [
    kubectl
    kubernetes-helm
  ];
  homebrew = {
    casks = [
      "mqttx"
    ];
  };
}
