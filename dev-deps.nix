with import <nixpkgs> { config.allowUnfree = true; };
[
  #pkgs.wireshark # to see when npm restrictor fails

  pkgs.coreutils

  pkgs.nodejs-8_x

  pkgs.nsjail

  # node-gyp dependencies (node-gyp compiles C/C++ Addons)
  #   see https://github.com/nodejs/node-gyp#on-unix
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
