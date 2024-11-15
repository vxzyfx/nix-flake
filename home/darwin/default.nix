{
  mylib,
  vars,
  ...
}: {
  home = {
    username = vars.username;
    homeDirectory = "/Users/${vars.username}";
  };
  imports =
    (mylib.scanPaths ./.)
    ++ [
      ../base/core
    ];
}
