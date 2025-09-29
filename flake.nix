{
  description = "Nixos system configuration.";
  # https://nix.dev/manual/nix/2.28/command-ref/new-cli/nix3-flake.html#flake-inputs
  inputs = {
    auto_cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # disko = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:nix-community/disko";
    # };
    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      # url = "github:nix-community/home-manager/release-24.11"
      url = "github:nix-community/home-manager";
    };
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11"
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
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
  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = {
    plasma_manager,
    nixpkgs,
    ...
  } @ inputs: let
    emailAddress = "adrtivv@gmail.com";
    hostName = "workstation";
    system = "x86_64-linux";
    userName = "adrtivv";
  in {
    nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/workstation
        inputs.auto_cpufreq.nixosModules.default
        # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nixos-module
        inputs.home_manager.nixosModules.home-manager
        {
          home-manager = {
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.backupFileExtension
            backupFileExtension = "backup";
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.extraSpecialArgs
            extraSpecialArgs = {
              inherit emailAddress;
              inherit inputs;
              inherit system;
              inherit userName;
            };
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.sharedModules
            sharedModules = [
              plasma_manager.homeModules.plasma-manager
            ];
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.useGlobalPkgs
            useGlobalPkgs = true;
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.useUserPackages
            useUserPackages = true;
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.users
            users.${userName} = import ./users/adrtivv/home;
          };
        }
      ];
      specialArgs = {
        inherit hostName;
        inherit inputs;
        inherit system;
        inherit userName;
      };
    };
    templates = {
      nix = {
        description = "";
        path = ./templates/nix;
      };
      rust = {
        description = "";
        path = ./templates/rust;
      };
    };
  };
}
