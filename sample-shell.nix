{ pkgs ? import <nixpkgs> {} }:
let
  deps = import /home/ariutta/dotfiles/nix-dev-envs/node.nix;
in
  pkgs.mkShell {
    buildInputs = deps;
    shellHook = ''
      export PATH="$HOME/Documents/safer-npm:$PATH"
    '';
}
