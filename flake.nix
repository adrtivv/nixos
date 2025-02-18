{
  description = "My nix and nixos configuration.";
  inputs = {
    # disko = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:nix-community/disko";
    # };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs_stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/sops-nix";
    };
    zen_browser = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:0xc000022070/zen-browser-flake";
    };
  };
  outputs = {
    home-manager,
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
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit emailAddress;
              inherit inputs;
              inherit system;
              inherit userName;
            };
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
