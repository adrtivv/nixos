{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.catppuccin = {pkgs, ...}: {
    # https://nix.catppuccin.com/options/main/nixos/catppuccin/
    catppuccin = {
      # https://nix.catppuccin.com/options/main/nixos/catppuccin/#catppuccin-accent
      accent = lib.mkDefault "blue";

      # https://nix.catppuccin.com/options/main/nixos/catppuccin.cache/#catppuccin-cache.enable
      cache.enable = lib.mkDefault true;

      # https://nix.catppuccin.com/options/main/nixos/catppuccin/#catppuccin-enable
      enable = lib.mkDefault true;

      # https://nix.catppuccin.com/options/main/nixos/catppuccin/#catppuccin-flavor
      flavor = lib.mkDefault "mocha";

      # https://nix.catppuccin.com/options/main/nixos/catppuccin.sddm/
      sddm = {
        # https://nix.catppuccin.com/options/main/nixos/catppuccin.sddm/#catppuccin-sddm.font
        font = lib.mkDefault "JetBrainsMono Nerd Font";

        # https://nix.catppuccin.com/options/main/nixos/catppuccin.sddm/#catppuccin-sddm.fontSize
        fontSize = lib.mkDefault "16";
      };
    };

    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];
  };
}
