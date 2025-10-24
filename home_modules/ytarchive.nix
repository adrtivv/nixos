{...}: {
  flake.homeModules.ytarchive = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=ytarchive&query=ytarchive
    # https://github.com/Kethsar/ytarchive
    home.packages = [pkgs.ytarchive];
  };
}
