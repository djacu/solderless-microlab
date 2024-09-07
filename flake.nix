{
  description = "An automated controlled lab reactor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        multiprocessing-logging = pkgs.python3Packages.callPackage ./multiprocessing-logging { };
        simple-pid = pkgs.python3Packages.callPackage ./simple-pid { };
      in
      {
        packages = {
          backend = pkgs.callPackage ./backend { inherit multiprocessing-logging simple-pid; };
        };
      }
    );
}
