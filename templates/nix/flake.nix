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
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [pkgs.nixd];
        };

        formatter = pkgs.alejandra;
      };

      systems = ["x86_64-linux"];
    });
}
