{inputs, ...}: {
  flake.modules.homeManager.catppuccin = {...}: {
    # https://nix.catppuccin.com/options/main/home/catppuccin/
    catppuccin = {
      # https://nix.catppuccin.com/options/main/home/catppuccin/#catppuccin-accent
      accent = "blue";

      # https://nix.catppuccin.com/options/main/home/catppuccin.cache/#catppuccin-cache.enable
      cache.enable = true;

      # https://nix.catppuccin.com/options/main/home/catppuccin/#catppuccin-enable
      enable = true;
    };

    imports = [
      inputs.catppuccin.homeModules.catppuccin
    ];
  };

  flake.modules.nixos.catppuccin = {...}: {
    # https://nix.catppuccin.com/options/main/nixos/catppuccin/
    catppuccin = {
      # https://nix.catppuccin.com/options/main/nixos/catppuccin/#catppuccin-accent
      accent = "blue";

      # https://nix.catppuccin.com/options/main/nixos/catppuccin.cache/#catppuccin-cache.enable
      cache.enable = true;

      # https://nix.catppuccin.com/options/main/nixos/catppuccin/#catppuccin-enable
      enable = true;

      # https://nix.catppuccin.com/options/main/nixos/catppuccin.sddm/
      sddm = {
        # https://nix.catppuccin.com/options/main/nixos/catppuccin.sddm/#catppuccin-sddm.font
        font = "JetBrainsMono Nerd Font";

        # https://nix.catppuccin.com/options/main/nixos/catppuccin.sddm/#catppuccin-sddm.fontSize
        fontSize = "16";
      };
    };

    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];
  };
}
