{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "multiprocessing-logging";
  version = "0.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jruere";
    repo = "multiprocessing-logging";
    rev = "v${version}";
    hash = "sha256-rb+llnp0NJfQMwZ+GVnVjDlSJsRMsMyAReaR6DW9YUU=";
  };

  build-system = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [ "multiprocessing_logging" ];

  meta = with lib; {
    description = "Handler for logging from multiple processes";
    homepage = "https://github.com/jruere/multiprocessing-logging";
    license = licenses.lgpl3;
    maintainers = with maintainers; [
      djacu
      sarcasticadmin
    ];
  };
}
