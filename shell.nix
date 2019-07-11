{ pkgs ? import <nixpkgs> {} }:
let
  deps = import ./dev-deps.nix;
in
  pkgs.mkShell {
    buildInputs = deps;
}
