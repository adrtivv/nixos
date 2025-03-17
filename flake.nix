{
  description = "My nix and nixos configuration.";
  inputs = {
    # disko = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:nix-community/disko";
    # };
    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs_stable.url = "github:nixos/nixpkgs/nixos-24.11";
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
  outputs = {
    home_manager,
    nixpkgs,
    plasma_manager,
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
        home_manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit emailAddress;
              inherit inputs;
              inherit system;
              inherit userName;
            };
            sharedModules = [plasma_manager.homeManagerModules.plasma-manager];
            useGlobalPkgs = true;
            users.${userName} = import ./users/adrtivv/home;
            useUserPackages = true;
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
      template = {
        description = "";
        path = ./template;
      };
    };
  };
}
