{
  vars,
  hostname,
  ...
}:
{
  users.users.${vars.username} = {
    openssh.authorizedKeys.keys = vars.sshAuthorizedKeys;
  };
}
