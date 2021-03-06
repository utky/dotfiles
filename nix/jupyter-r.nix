with import <nixpkgs> {};
let 
my-R-packages = with rPackages; [ ggplot2 dplyr xts ];
R-with-my-packages = rWrapper.override{ packages = with rPackages; my-R-packages ++ [ JuniperKernel ]; };
jupyter-R-kernel = stdenv.mkDerivation {
  name = "jupyter-R-kernel";
  buildInputs = [ pythonPackages.notebook R-with-my-packages ];
  unpackPhase = ":";
  installPhase = ''
    export HOME=$TMP
    ${R-with-my-packages}/bin/R --slave -e "JuniperKernel::installJuniper(prefix='$out', useJupyterDefault=TRUE)"
  '';
};
in
mkShell rec {
  name = "jupyter-with-R-kernel";
  buildInputs = [ jupyter-R-kernel ];
  shellHook = ''
    export JUPYTER_PATH=${jupyter-R-kernel}/share/jupyter
    # see https://github.com/NixOS/nixpkgs/issues/38733
    ${R-with-my-packages}/bin/R --slave -e "system('${pythonPackages.notebook}/bin/jupyter-notebook')"
  '';
}
