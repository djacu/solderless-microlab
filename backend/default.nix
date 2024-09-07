{
  lib,
  buildPythonApplication,
  setuptools,
  wheel,
}:
buildPythonApplication {

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
      ./pyproject.toml
      ./pytest.ini
      ./requirements.txt
    ];
  };

  build-system = [
    setuptools
    wheel
  ];

  # dontWrapPythonPrograms = true;

  pyproject = true;

}
