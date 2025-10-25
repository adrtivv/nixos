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
          env = {
            # https://blog.platformatic.dev/handling-environment-variables-in-nodejs#heading-set-nodeenvproduction-for-all-environments
            NODE_ENV = "production";
          };

          nativeBuildInputs = with pkgs; [
            nodejs
            pnpm
          ];
        };
      };

      systems = ["x86_64-linux"];
    });
}
