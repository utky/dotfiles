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

    ilya-haskell = with self; buildEnv {
      name = "ilya-haskell";
      paths = [
        stack
      ];
    };

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
        sbt
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


    ilya-scheme = with self; buildEnv {
      name = "ilya-scheme";
      paths = [
        pltScheme
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
