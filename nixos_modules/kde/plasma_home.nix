{inputs, ...}: {
  flake.nixosModules.kde_plasma_home = {...}: {
    home-manager = {
      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.sharedModules
      sharedModules = [
        inputs.plasma_manager.homeModules.plasma-manager
      ];
    };
  };
}
