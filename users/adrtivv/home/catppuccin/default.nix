{specialArgs, ...}: {
  # https://nix.catppuccin.com/options/main/home/catppuccin/
  catppuccin = {
    # https://nix.catppuccin.com/options/main/home/catppuccin/#catppuccin-accent
    accent = "blue";

    # https://nix.catppuccin.com/options/main/home/catppuccin.cache/#catppuccin-cache.enable
    cache.enable = true;

    # https://nix.catppuccin.com/options/main/home/catppuccin/#catppuccin-enable
    enable = true;

    # https://nix.catppuccin.com/options/main/home/catppuccin/#catppuccin-flavor
    flavor = "mocha";
  };

  imports = [
    specialArgs.inputs.catppuccin.homeModules.catppuccin
  ];
}
