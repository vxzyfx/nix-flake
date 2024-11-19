{...}:
{
  programs.starship = {
    enableZshIntegration = true;
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      battery = {
        disabled=true;
      };
    };
  };
}
