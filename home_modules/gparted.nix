{...}: {
  flake.homeModules.gparted = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=gparted&query=gparted
    # https://gparted.md/
    home.packages = [pkgs.gparted];
  };
}
