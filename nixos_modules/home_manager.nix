{inputs, ...}: {
  flake.nixosModules.home_manager = {
    imports,
    user_name,
  }: {...}: {
    imports = [inputs.home_manager.nixosModules.home-manager];

    home-manager = {
      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.backupFileExtension
      backupFileExtension = "backup";

      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.useGlobalPkgs
      useGlobalPkgs = true;

      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.useUserPackages
      useUserPackages = true;

      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.users
      users.${user_name} = {
        inherit imports;
      };
    };
  };
}
