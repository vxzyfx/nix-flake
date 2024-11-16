{lib}: let
  sshAuthorizedKeys = import ./sshAuthorizedKeys.nix;
in {
  shugbook = (import ./shugbook.nix) // sshAuthorizedKeys;
  shugMacStudio = (import ./shugMacStudio.nix) // sshAuthorizedKeys;
  shugMacmini = (import ./shugMacmini.nix) // sshAuthorizedKeys;
}
