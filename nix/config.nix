{
  packageOverrides = super: let self = super.pkgs; in
  {
    ilya = with self; buildEnv {
      name = "ilya";
      paths = [
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
      ];
    };
  };
}
