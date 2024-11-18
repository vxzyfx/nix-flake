{
  vars,
  hostname,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  users.users.${vars.username} = {
    openssh.authorizedKeys.keys = vars.sshAuthorizedKeys;
  };
}
