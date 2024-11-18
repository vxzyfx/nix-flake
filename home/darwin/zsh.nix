{pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      "ls" = "ls --color";
    };
    initExtra = ''
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
    '';
  };
}
