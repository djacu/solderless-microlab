{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  furo,
  myst-parser,
  sphinx,
  sphinx-copybutton,
  matplotlib,
  numpy,
  pytest,
}:

buildPythonPackage rec {
  pname = "simple-pid";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "simple_pid";
    inherit version;
    hash = "sha256-V3F2HFRUHJAOWX1sLk6pP9LMmPTkjLnsomX7ouZb6Z4=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    doc = [
      furo
      myst-parser
      sphinx
      sphinx-copybutton
    ];
    examples = [
      matplotlib
      numpy
    ];
    test = [ pytest ];
  };

  pythonImportsCheck = [ "simple_pid" ];

  meta = with lib; {
    description = "A simple, easy to use PID controller";
    homepage = "https://pypi.org/project/simple-pid/";
    license = licenses.mit;
    maintainers = with maintainers; [
      djacu
      sarcasticadmin
    ];
  };
}
