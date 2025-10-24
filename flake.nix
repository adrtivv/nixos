{
  description = "Nixos system configuration.";

  # https://nix.dev/manual/nix/2.28/command-ref/new-cli/nix3-flake.html#flake-inputs
  inputs = {
    # auto_cpufreq = {
    #   inputs.nixpkgs.follows = "nixpkgs";

    #   url = "github:AdnanHodzic/auto-cpufreq";
    # };

    catppuccin = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:catppuccin/nix";
    };

    dank_material_shell = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:AvengeMedia/DankMaterialShell";
    };

    dank_material_shell_cli = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:AvengeMedia/danklinux";
    };

    dgop = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:AvengeMedia/dgop";
    };

    # disko = {
    #   inputs.nixpkgs.follows = "nixpkgs";

    #   url = "github:nix-community/disko";
    # };

    flake_parts = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:hercules-ci/flake-parts";
    };

    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";

      # url = "github:nix-community/home-manager/release-24.11"
      url = "github:nix-community/home-manager";
    };

    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11"
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    niri = {
      # inputs.nixpkgs.follows = "nixpkgs";

      url = "github:sodiboo/niri-flake";
    };

    plasma_manager = {
      inputs.home-manager.follows = "home_manager";

      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:nix-community/plasma-manager";
    };

    sops_nix = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:mic92/sops-nix";
    };

    zen_browser = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  outputs = {flake_parts, ...} @ inputs:
    flake_parts.lib.mkFlake {inherit inputs;} ({
        config,
        withSystem,
        moduleWithSystem,
        ...
      } @ top: {
        imports = [
          ./home_modules

          ./nixos_configurations

          ./nixos_modules

          ./templates
        ];

        perSystem = {
          pkgs,
          self',
          ...
        }: {};

        systems = ["x86_64-linux"];
      });
}
