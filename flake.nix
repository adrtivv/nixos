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

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = {
    plasma_manager,
    nixpkgs,
    ...
  } @ inputs: let
    email_address = "adrtivv@gmail.com";

    host_name = "workstation";

    system = "x86_64-linux";

    user_name = "adrtivv";
  in {
    nixosConfigurations.${host_name} = nixpkgs.lib.nixosSystem {
      modules = [
        # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nixos-module
        inputs.home_manager.nixosModules.home-manager

        {
          home-manager = {
            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.backupFileExtension
            backupFileExtension = "backup";

            # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.extraSpecialArgs
            extraSpecialArgs = {
              inherit email_address;

              inherit inputs;

              inherit system;

              inherit user_name;
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
            users.${user_name} = {
              imports = [
                ./users/adrtivv/home
              ];
            };
          };
        }

        ./hosts/workstation
      ];

      specialArgs = {
        inherit host_name;

        inherit inputs;

        inherit system;

        inherit user_name;
      };
    };

    templates = {
      nix = {
        description = "";

        path = ./templates/nix;
      };

      node = {
        description = "";

        path = ./templates/node;
      };

      rust = {
        description = "";

        path = ./templates/rust;
      };
    };
  };
}
