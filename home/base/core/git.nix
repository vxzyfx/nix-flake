{vars, ...}:
{
  programs.git = {
    enable = true;
    userName = vars.git.username;
    userEmail = vars.git.email;
  };

}
