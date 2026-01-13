{ inputs, ... }:
{
  flake.modules.homeManager.home_manager = {
    # https://home-manager-options.extranix.com/?query=programs.home-manager&release=master
    # https://nix-community.github.io/home-manager/
    programs.home-manager.enable = true;
  };

  flake.modules.nixos.home_manager = {
    home-manager = {
      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.backupFileExtension
      backupFileExtension = "backup";

      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.useGlobalPkgs
      useGlobalPkgs = true;

      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.useUserPackages
      useUserPackages = true;
    };

    imports = [
      # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nixos-module
      inputs.home_manager.nixosModules.home-manager
    ];
  };
}
