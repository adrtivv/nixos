{
  description = "Nixos system configuration.";

  # https://nix.dev/manual/nix/2.28/command-ref/new-cli/nix3-flake.html#flake-inputs
  inputs = {
    catppuccin = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:catppuccin/nix";
    };

    dank_material_shell = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:AvengeMedia/DankMaterialShell";
    };

    dank_material_shell_plugin_registry = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:AvengeMedia/dms-plugin-registry";
    };

    # disko = {
    #   inputs.nixpkgs.follows = "nixpkgs";

    #   url = "github:nix-community/disko";
    # };

    flake_parts.url = "github:hercules-ci/flake-parts";

    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";

      # url = "github:nix-community/home-manager/release-25.11"
      url = "github:nix-community/home-manager";
    };

    import_tree = {
      url = "github:vic/import-tree";
    };

    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    niri = {
      # inputs.nixpkgs.follows = "nixpkgs";

      url = "github:sodiboo/niri-flake";
    };

    # plasma_manager = {
    #   inputs.home-manager.follows = "home_manager";

    #   inputs.nixpkgs.follows = "nixpkgs";

    #   url = "github:nix-community/plasma-manager";
    # };

    sops_nix = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:mic92/sops-nix";
    };

    nix_systems = {
      url = "github:nix-systems/default";
    };

    zen_browser = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs =
    inputs:
    inputs.flake_parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        debug = true;

        imports = [
          inputs.flake_parts.flakeModules.modules

          (inputs.import_tree ./modules)

          ./templates
        ];
      }
    );
}
