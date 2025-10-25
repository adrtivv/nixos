{
  inputs = {
    flake_parts = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:hercules-ci/flake-parts";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = inputs:
    inputs.flake_parts.lib.mkFlake {inherit inputs;} ({...} @ top: {
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkshell {
          env = {
            # required by rust-analyzer.
            rust_src_path = pkgs.rustplatform.rustlibsrc;
          };

          nativebuildinputs = with pkgs; [
            cargo
            clippy
            rust-analyzer
            rustc
            rustfmt
          ];
        };
      };

      systems = ["x86_64-linux"];
    });
}
