{
  packageOverrides = super: let self = super.pkgs; in
  {
    ilya-haskell = self.haskell.packages.ghc7102.ghcWithPackages
                     (haskellPackages: with haskellPackages; [
                       cabal-install
                       cabal2nix
                       hlint
                       hakyll
                       hdevtools
                       ghc-mod
                       stack
                     ]);
  };
}
