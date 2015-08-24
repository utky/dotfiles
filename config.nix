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
                       elm-compiler
                     ]);

    ilya-jvm = with self; buildEnv {
      name = "ilya-jvm";
      paths = [
        sbt
        leiningen
        apache-maven
      ];
    };

    ilya-python = with self; buildEnv {
      name = "ilya-python";
      paths = [
        python
        pythonPackages.pip
        pythonPackages.virtualenv
        pythonPackages.virtualenvwrapper
      ];
    };

    ilya-node = with self; buildEnv {
      name = "ilya-node";
      paths = [
        nodejs
      ];
    };

    ilya-ocaml = with self; buildEnv {
      name = "ilya-ocaml";
      paths = [
        ocaml
        coq
      ];
    };

  };
}
