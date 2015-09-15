{
  packageOverrides = super: let self = super.pkgs; in
  {
    ilya-base = with self; buildEnv {
      name = "ilya-base";
      paths = [
        glibcLocales
        inotify-tools
      ];
    };

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
