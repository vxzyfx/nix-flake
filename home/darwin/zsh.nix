{...}:
{
  programs.zsh = {
    enable = true;
    initExtra = ''
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
    '';
  };
}
