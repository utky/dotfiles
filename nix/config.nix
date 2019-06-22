{
  packageOverrides = super:
    let
      self = super.pkgs;
    in
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
            dep
            gauche
            gitAndTools.hub
          ];
        };
        ilya-jupyter = self.jupyter.override {
          definitions = {
            python3 = let
              env = (self.python3.withPackages (ps: with ps; [
              numpy scipy matplotlib ipykernel
              ]));
            in {
              displayName = "Python 3";
              argv = [
                "${env.interpreter}"
                "-m"
                "ipykernel_launcher"
                "-f"
                "{connection_file}"
              ];
              language = "python";
              logo32 = "${env.sitePackages}/ipykernel/resources/logo-32x32.png";
              logo64 = "${env.sitePackages}/ipykernel/resources/logo-64x64.png";
           };
          };
        };
      };
}
