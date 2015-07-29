{
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    all = with pkgs; buildEnv {  # pkgs is your overriden set of packages itself
      name = "all";
      paths = [
        # haskellngPackage.cabal-install
        # haskellngPackage.cabal2nix
        # cacert-20140715
        # haskellngPackage.ghc
        # haskell-hakyll-4.6.6.0
        # haskellngPackage.haskell-hlint-1.9.21
        # haskellngPackage.hdevtools-0.1.0.8
        # haskellngPackage.husk-scheme
        # nix-1.8
        # nix-repl-1.8-f924081
        # nodejs-0.12.0
        # sbt-0.13.7
      ];
    };
  };
}
