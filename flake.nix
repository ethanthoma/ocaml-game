{
    description = "A very basic flake with raylib-ocaml";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        opam-nix.url = "github:tweag/opam-nix";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { nixpkgs, ... }:
    let
        systems = [ "x86_64-darwin" "aarch64-darwin" "x86_64-linux" ];

        createDevShell = system:
        let
            pkgs = import nixpkgs { inherit system; };
            raylib-deps = with pkgs; [
                    pkg-config
                    libGL
                    mesa
                    xorg.libXcursor
                    xorg.libXi
                    xorg.libXinerama
                    xorg.libXrandr
            ];
        in
            pkgs.mkShell {
                buildInputs = with pkgs; [
                    dune_3
                    ocaml
                    ocamlformat
                    ocamlPackages.findlib
                    ocamlPackages.ocamlformat-rpc-lib
                    ocamlPackages.ocaml-lsp
                    ocamlPackages.utop
                    opam
                ] ++ raylib-deps;

                shellHook = ''
                    eval $(opam env)    
                '';
            };
    in {
        devShell = nixpkgs.lib.genAttrs systems createDevShell;
    };
}

