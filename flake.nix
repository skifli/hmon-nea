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

      evince-synctex = pkgs.python3Packages.buildPythonApplication {
        pyproject = true;
        build-system = with pkgs.python3Packages; [setuptools];

        pname = "evince-synctex";
        version = "593b00";

        src = pkgs.fetchFromGitHub {
          owner = "latex-lsp";
          repo = "evince-synctex";
          rev = "593b00";
          hash = "sha256-Q9kZ/XmXEsoZpflF5n16I5bsyS2S8gS9OYkOPM47ryg=";
        };

        propagatedBuildInputs = with pkgs.python3Packages; [
          dbus-python
          pygobject3
        ];

        doCheck = false;
      };
    in {
      devShells.default = (pkgs.mkShell.override {stdenv = pkgs.clangStdenv;}) {
        nativeBuildInputs = with pkgs; [
          (texlive.combine {
            inherit (pkgs.texlive) scheme-full; # Big ah pkg
          })
          texlab
          evince-synctex
          glib
        ];

        shellHook = ''
          echo "hmon-nea direnv loaded with evince-synctex!"

          # Idk if still needed but keep in case
          export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
          export XDG_DATA_DIRS="$XDG_DATA_DIRS:/run/current-system/sw/share:$HOME/.nix-profile/share"

          mkdir -p src/out/chapters # Otherwise it can get annoyed
        '';
      };
    });
}
