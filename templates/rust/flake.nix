{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";
  };

  outputs = {
    nixpkgs,
    systems,
    ...
  }: let
    forEachSystem = arg_fn: nixpkgs.lib.genAttrs (import systems) (system: arg_fn nixpkgs.legacyPackages.${system});
  in {
    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        env = {
          # Required by rust-analyzer.
          RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
        };

        nativeBuildInputs = with pkgs; [
          cargo
          clippy
          rust-analyzer
          rustc
          rustfmt
        ];

        packages = with pkgs; [];
      };
    });
  };
}
