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
          # https://blog.platformatic.dev/handling-environment-variables-in-nodejs#heading-set-nodeenvproduction-for-all-environments
          NODE_ENV = "production";
        };

        nativeBuildInputs = with pkgs; [
          nodejs
          pnpm
        ];

        packages = with pkgs; [];
      };
    });
  };
}
