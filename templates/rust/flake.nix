{
  inputs = {
    flake_parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = inputs:
    inputs.flake_parts.lib.mkFlake {inherit inputs;} ({...} @ top: {
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cargo
            clippy
            glib
            rust-analyzer
            rustc
            rustfmt
          ];

          # Required by rust-analyzer.
          env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

          nativeBuildInputs = [pkgs.pkg-config];
        };
      };

      systems = ["x86_64-linux"];
    });
}
