{
  description = "C devenv for hmon";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShells.default = (pkgs.mkShell.override {stdenv = pkgs.clangStdenv;}) {
        nativeBuildInputs = with pkgs; [
          (texlive.combine {
            inherit (pkgs.texlive) scheme-full; # Big ah pkg
          })
          gnumake
        ];

        shellHook = ''
          echo "hmon-nea direnv loaded"

          mkdir -p out/chapters # Otherwise it can get annoyed
        '';
      };
    });
}
