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
        nativeBuildInputs = with pkgs; [
          nixd
        ];
        packages = with pkgs; [];
      };
    });
    formatter = forEachSystem (pkgs: pkgs.alejandra);
  };
}
