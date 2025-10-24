{...}: {
  flake.homeModules.obsidian = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/obsidian
    # https://search.nixos.org/packages?channel=unstable&show=obsidian&query=obsidian
    # https://obsidian.md/
    home.packages = [pkgs.obsidian];
  };
}
