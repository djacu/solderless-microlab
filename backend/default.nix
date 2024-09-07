{
  pkgs,
  lib,
  stdenvNoCC,
  python3,
  multiprocessing-logging,
  simple-pid,
}:

let

  pythonEnvironment = python3.withPackages (
    ps: with ps; [
      flask
      pytest
      requests
      pyserial
      w1thermsensor
      pyyaml
      configobj
      multiprocessing-logging
      simple-pid
    ]
  );

  backend = stdenvNoCC.mkDerivation {

    pname = "microlab-backend";
    version = "0.1.0";

    src = lib.fileset.toSource {
      root = ./.;
      fileset = lib.fileset.unions [
        ./api
        ./data
        ./hardware
        ./microlab
        ./recipes
        ./tests
        ./util

        ./config.py
        ./defaultconfig.ini
        ./main.py
        ./pytest.ini
        ./requirements.txt
      ];
    };

    buildPhase = ''
      mkdir $out
      cp -R . $out
    '';

  };

in

pkgs.writeShellApplication {
  name = "microlab-backend";
  runtimeInputs = [ pythonEnvironment ];
  text = ''
    python ${backend}/main.py
  '';
}
