{
  packageOverrides = super:
    let
      self = super.pkgs;
      python-stats-packages = python-packages: with python-packages; [
        pandas
        scipy
        jupyter
        matplotlib
      ];
      my-python = super.pkgs.python3.withPackages python-stats-packages;
    in
      {
        ilya = with self; buildEnv {
          name = "ilya";
          paths = [
            nix-repl
            sqlite
            gdb
            global
            plantuml
            stack
            elmPackages.elm
            openjdk
            leiningen
            go
            chicken
            gitAndTools.hub
          ];
        };
        ilya-python = with self; buildEnv {
          name = "ilya-python";
          paths = [
            my-python
          ];
        };
      };
}
