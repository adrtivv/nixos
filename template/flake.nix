{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.${system};
    system = "x86_64-linux";
  in {
    devShells.${system} = {
      default = pkgs.mkShell {
        packages = with pkgs; [
        ];
      };
    };
    formatter.${system} = pkgs.alejandra;
  };
}
