{
  inputs = {
    flake_parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs =
    inputs:
    inputs.flake_parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        perSystem =
          {
            pkgs,
            system,
            ...
          }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;

              config = {
                allowUnfree = true;
                # Optional but common: allow ALL unfree packages (not just an allowlist)
                allowUnfreePredicate = _: true;
              };
            };

            devShells.default = pkgs.mkShell {
              buildInputs = with pkgs; [
                nodejs

                pnpm
              ];

              # https://blog.platformatic.dev/handling-environment-variables-in-nodejs#heading-set-nodeenvproduction-for-all-environments
              env.NODE_ENV = "production";

              nativeBuildInputs = [ pkgs.pkg-config ];
            };

            formatter = pkgs.nixfmt-tree;
          };

        systems = [ "x86_64-linux" ];
      }
    );
}
