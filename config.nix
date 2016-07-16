{
  packageOverrides = super: let self = super.pkgs; in
  {
    ilya-base = with self; buildEnv {
      name = "ilya-base";
      paths = [
        sqlite
        nasm
        gdb
      ];
    };

    ilya-haskell = self.haskell.packages.ghc7103.ghcWithPackages
                     (haskellPackages: with haskellPackages; [
                       cabal-install
                       stack
                       pandoc
                     ]);

    ilya-elm = with self; buildEnv {
      name = "ilya-elm";
      paths = [
        elmPackages.elm
      ];
    };

    ilya-jvm = with self; buildEnv {
      name = "ilya-jvm";
      paths = [
        openjdk
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
        nodejs
      ];
    };

    ilya-coq = with self; buildEnv {
      name = "ilya-coq";
      paths = [
        coq_HEAD
      ];
    };

    ilya-alloy = with self; buildEnv {
      name = "ilya-alloy";
      paths = [
        alloy
      ];
    };

  };
}
