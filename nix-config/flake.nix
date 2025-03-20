{
  description = "Experimental flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        sharedPackages = import ./modules/common.nix { inherit pkgs; };
        workPackages = import ./modules/work.nix { inherit pkgs; };
        macPackages = import ./modules/mac.nix { inherit pkgs; };
        cDevEnv = import ./modules/devenv/c.nix { inherit pkgs; };
        pythonEnv = import ./modules/devenv/python.nix { inherit pkgs; };
      in {
        packages = rec {
          default = pkgs.buildEnv {
            name = "Default install";
            paths = sharedPackages ++ cDevEnv;
          };
          work = pkgs.buildEnv {
            name = "Work install";
            paths = sharedPackages ++ cDevEnv ++ workPackages;
          };
          work-laptop = pkgs.buildEnv {
            name = "Work Laptop install";
            paths = sharedPackages ++ cDevEnv ++ workPackages ++ macPackages;
          };
        };
      }
    );
}
