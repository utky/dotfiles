{
  packageOverrides = super: let self = super.pkgs; in
  {
    ilya-base = with self; buildEnv {
      name = "ilya-base";
      paths = [
        texLiveFull
      ];
    };

    ilya-haskell = self.haskell.packages.ghc7102.ghcWithPackages
                     (haskellPackages: with haskellPackages; [
                       stack
                     ]);

    ilya-jvm = with self; buildEnv {
      name = "ilya-jvm";
      paths = [
        leiningen
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

    ilya-js = with self; buildEnv {
      name = "ilya-js";
      paths = [
        iojs
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
