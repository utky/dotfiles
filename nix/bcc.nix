# mkdir ./build; cd ./build
# cmake .. -DCMAKE_INSTALL_PREFIX=/usr
# make
# sudo make install
# cmake -DPYTHON_CMD=python3 .. # build python3 binding
# pushd src/python/
# make
# sudo make install
# popd
#
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/bcc/default.nix#L6
with import <nixpkgs> {};
let
  linux = linuxPackages_5_5;
in
  mkShell rec {
    name = "bcc";
    buildInputs = with llvmPackages; [
      llvm
      clang-unwrapped
      linux.kernel
      elfutils
      luajit
      netperf
      iperf
      linux.systemtap.stapBuild
      flex
      bash
    ];
    propagatedBuildInputs = [ python.pkgs.netaddr ];
    nativeBuildInputs = [ makeWrapper cmake flex bison ]
      ++ stdenv.lib.filter (x: x != libelf) linux.kernel.moduleBuildDependencies;
  }

