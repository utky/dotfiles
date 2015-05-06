let
  pkgs = import <nixpkgs> {};
  hsEnv = pkgs.haskellPackages.ghcWithPackages (hs : ([
    hs.cabalInstall
    hs.hlint
    hs.ghcMod
    hs.hasktags
    ])
in
  
