{ pkgs ? import <nixpkgs> {} }:
let
  deps = import ./dev-deps.nix;
in
  pkgs.mkShell {
    buildInputs = deps;
    shellHook = ''
      export PATH="/run/wrappers/bin:/run/current-system/sw/bin:$PATH"
    '';
}
