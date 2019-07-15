# Safer NPM

Limit NPM to just the capabilities it needs. Get the benefits of `--ignore-scripts` without the drawbacks. Currently only works on NixOS.

## Installation

Install [Nix](https://nixos.org/nix/download.html).

Get this repo:
```
git clone https://www.github.com/ariutta/safer-npm $HOME/safer-npm
```

## Usage

In your NPM project directory, create a `shell.nix` file that references `$HOME/safer-npm/dev-deps.nix`:

```
cp "$HOME/safer-npm/sample-shell.nix" ./shell.nix
```

* launch the environment for `safer-npm` and try it out:

```
nix-shell
which npm # you should see $HOME/safer-npm/npm
npm --help
```

Exit with `ctrl-d`.

## TODO

TODO: the following does not work yet. Need to publish to nixpkgs.
```
nix-env -iA nixos.safer-npm
```

I symlinked default.nix to shell.nix. If I run `$HOME/Documents/safer-npm/npm --help` in
a directory with a `shell.nix`, it asks for a `default.nix`. But if I run the same thing
in a directory without a `shell.nix`, it asks for a `shell.nix`. What's up with that?
Should I specify `./shell.nix` in the `npm` file shebang?

Look into using BPF and XDP:
https://news.ycombinator.com/item?id=20412395
https://blog.jessfraz.com/post/linux-observability-with-bpf/

bpf is on nixos:
```
nix-env -iA nixos.linuxPackages.bpftrace
```

Not sure about XDP.

TODO: do we need to golist the following?
host 10.1.100.65
65.100.1.10.in-addr.arpa domain name pointer hub.gladstone.internal.

Why do I keep getting the following, even when I delete `node_modules`?
>npm verb lifecycle bridgedb@6.0.3~assets: unsafe-perm in lifecycle true
>npm verb lifecycle bridgedb@6.0.3~assets: PATH: /nix/store/y6z3iz4x9dccx4a9d5m6fva0hyjav7g5-nodejs-8.15.1/lib/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:/home/user/project/node_modules/.bin:/nix/store/y6z3iz4x9dccx4a9d5m6fva0hyjav7g5-nodejs-8.15.1/lib/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:/home/user/project/node_modules/.bin:/nix/store/y6z3iz4x9dccx4a9d5m6fva0hyjav7g5-nodejs-8.15.1/lib/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:/home/user/project/node_modules/.bin:/nix/store/y6z3iz4x9dccx4a9d5m6fva0hyjav7g5-nodejs-8.15.1/lib/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:/home/user/project/node_modules/.bin:/nix/store/y6z3iz4x9dccx4a9d5m6fva0hyjav7g5-nodejs-8.15.1/lib/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:/home/user/project/node_modules/.bin:/run/wrappers/bin:/run/current-system/sw/bin:/nix/store/93h01q6yg13xdrabvqbddzbk11w6a928-bash-interactive-4.4-p23/bin:/nix/store/s7p0wfbdfbq307zgifhnh6w8sfjvy64y-patchelf-0.9/bin:/nix/store/ghzg4kg0sjif58smj2lfm2bdvjwim85y-gcc-wrapper-7.4.0/bin:/nix/store/d4n93jn9fdq8fkmkm1q8f32lfagvibjk-gcc-7.4.0/bin:/nix/store/f5wl80zkrd3fc1jxsljmnpn7y02lz6v1-glibc-2.27-bin/bin:/nix/store/d9s1kq1bnwqgxwcvv4zrc36ysnxg8gv7-coreutils-8.30/bin:/nix/store/rbpyfy6413aqpik9aj6p3a2syd1mda68-binutils-wrapper-2.31.1/bin:/nix/store/0y7jmqnj48ikjh37n3dl9kqw9hnn68nq-binutils-2.31.1/bin:/nix/store/f5wl80zkrd3fc1jxsljmnpn7y02lz6v1-glibc-2.27-bin/bin:/nix/store/d9s1kq1bnwqgxwcvv4zrc36ysnxg8gv7-coreutils-8.30/bin:/nix/store/cnzck53v9z8hxmn8i0cdh7z2x7byklay-python3.6-powerline-2.7/bin:/nix/store/wpqgah614vxww0kb1f1hjyswplj2q7d3-python3-3.6.8/bin:/nix/store/lc83cqh3qsvaccvaqb7bqx8d48zp84zx-python3.6-setuptools-40.8.0/bin:/nix/store/m8kcz51jxlhnw98xc2mffa9rrhnwdk6n-openssh-7.9p1/bin:/nix/store/dmafrx374ihman6a1hdw65dqqllz3hqq-gnupg-2.2.16/bin:/nix/store/d9s1kq1bnwqgxwcvv4zrc36ysnxg8gv7-coreutils-8.30/bin:/nix/store/pmzw4y4465zmq0dc8r4xbwyrqsaj4s70-diffutils-3.7/bin:/nix/store/j32ag6iyvp9a6m0ghc2dd7hsdwf7gn69-wdiff-1.2.2/bin:/nix/store/1aba8554iy2yxzdw5860vm863vjh960j-colordiff-1.0.18/bin:/nix/store/mja714wbj9grm5cfgngvc3nlh924wcqh-gawk-4.2.1/bin:/nix/store/3bzxl1zc9gpf4p9k29z0y9wqszsm4li5-gettext-0.19.8.1/bin:/nix/store/lm1zhwy9bihd7ry6plv68bbj4mmcibbq-jq-1.6-bin/bin:/nix/store/0636v4zha1w1s9r4p0vifajvii12xql2-less-530/bin:/nix/store/r3yfzmrd2lc0ibdx3i486n4abf7sqnp7-nox-0.0.6/bin:/nix/store/gyffk0z9rwcdl1l1654z3b0sry98ddrk-python3-3.7.3/bin:/nix/store/5f86qkxjwmzncd4qkp9h8r049dmlgxdl-python3.7-setuptools-40.8.0/bin:/nix/store/5f86qkxjwmzncd4qkp9h8r049dmlgxdl-python3.7-setuptools-40.8.0/bin:/nix/store/nylbdslkdxd1x0pz41pk5j3xr537iycs-python3.7-chardet-3.0.4/bin:/nix/store/34dkg8y4yqn96k0vqscbl2lx3bihfryh-ripgrep-0.10.0/bin:/nix/store/xcdq0a3s2pm7vp98wfygbdryry4xzcpq-rsync-3.1.3/bin:/nix/store/2hfv4viww15wp06sa7cy898x36c20fdy-wget-1.20.3/bin:/nix/store/2ry5gcqsbkvb4mipxssn9nn5gm7jd5ms-vim/bin:/nix/store/gsaaryzxrz02z2vd15h1p79qvlhhkll2-nsjail-2.8/bin:/nix/store/y6z3iz4x9dccx4a9d5m6fva0hyjav7g5-nodejs-8.15.1/bin:/nix/store/7v2vscl094nj3n7v7i4ikld0rignc0xs-node-node2nix-1.6.0/bin:/nix/store/m67ffrbndmyff8c43jkrvagr3pyk4w85-sudo-1.8.27/bin:/nix/store/4g6n0dv3av7j1cjwcmivymjja5n6n3d5-which-2.21/bin:/nix/store/h017fiqjc7hi2dkf3dnqr7hzja2bsc47-wireshark-qt-2.6.6/bin:/nix/store/8rlh98vdgzng4i497n53kjj625nikdzc-libxml2-2.9.9-dev/bin:/nix/store/j0q0rnlpqq84mak85hfh6vylv0ykz5ya-libxml2-2.9.9-bin/bin:/nix/store/2636cci5jfsk11dawvvgsiyyqn9rbv7p-python-2.7.16/bin:/nix/store/8n7v99ii7cg694pz0cfch422zvkdqfv4-gnumake-4.2.1/bin:/nix/store/ghzg4kg0sjif58smj2lfm2bdvjwim85y-gcc-wrapper-7.4.0/bin:/nix/store/d4n93jn9fdq8fkmkm1q8f32lfagvibjk-gcc-7.4.0/bin:/nix/store/f5wl80zkrd3fc1jxsljmnpn7y02lz6v1-glibc-2.27-bin/bin:/nix/store/d9s1kq1bnwqgxwcvv4zrc36ysnxg8gv7-coreutils-8.30/bin:/nix/store/rbpyfy6413aqpik9aj6p3a2syd1mda68-binutils-wrapper-2.31.1/bin:/nix/store/0y7jmqnj48ikjh37n3dl9kqw9hnn68nq-binutils-2.31.1/bin:/nix/store/f5wl80zkrd3fc1jxsljmnpn7y02lz6v1-glibc-2.27-bin/bin:/nix/store/d9s1kq1bnwqgxwcvv4zrc36ysnxg8gv7-coreutils-8.30/bin:/nix/store/0y7jmqnj48ikjh37n3dl9kqw9hnn68nq-binutils-2.31.1/bin:/nix/store/d9s1kq1bnwqgxwcvv4zrc36ysnxg8gv7-coreutils-8.30/bin:/nix/store/krhqmaqal0gklh15rs2bwrqzz8mg9lrn-findutils-4.6.0/bin:/nix/store/pmzw4y4465zmq0dc8r4xbwyrqsaj4s70-diffutils-3.7/bin:/nix/store/x1khw8x0465xhkv6w31af75syyyxc65j-gnused-4.7/bin:/nix/store/wnjv27b3j6jfdl0968xpcymlc7chpqil-gnugrep-3.3/bin:/nix/store/vvwggp5mni64yavsfqmbwvm1mn692ssn-gawk-4.2.1/bin:/nix/store/wmxqm38g1y1y7sd7s9vg7an3klffaiyz-gnutar-1.31/bin:/nix/store/ix2q5vnynzfgsi4nqj8pmcbx2kf78wrm-gzip-1.10/bin:/nix/store/b7x2qjfs6k1xk4p74zzs9kyznv29zap6-bzip2-1.0.6.0.1-bin/bin:/nix/store/8n7v99ii7cg694pz0cfch422zvkdqfv4-gnumake-4.2.1/bin:/nix/store/cinw572b38aln37glr0zb8lxwrgaffl4-bash-4.4-p23/bin:/nix/store/f2ax0p1cjyw8cq88yk3kiq1vqjh4bpjm-patch-2.7.6/bin:/nix/store/zrazw25gy012ip7vcqddw6lcc393qvcg-xz-5.2.4-bin/bin
