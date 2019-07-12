with import <nixpkgs> { config.allowUnfree = true; };
[
  pkgs.coreutils

  pkgs.nodejs-8_x

  pkgs.nsjail

  #pkgs.sudo
  #pkgs.which

  #pkgs.wireshark # to see when npm restrictor fails

  # node-gyp dependencies
  # see https://github.com/nodejs/node-gyp#on-unix
  # (Required for building node-expat)
  pkgs.python2

] ++ (if stdenv.isDarwin then [
  # more node-gyp dependencies
  # XCode Command Line Tools
  # TODO: do we need cctools?
  #pkgs.darwin.cctools
] else [

  # more node-gyp dependencies

  pkgs.gnumake

  # gcc and binutils disagree on the version of a
  # dependency, so we need to binutils-unwrapped.
  pkgs.gcc # also provides cc
  pkgs.binutils-unwrapped # provides ar

])
