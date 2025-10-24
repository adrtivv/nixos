{...}: {
  flake.homeModules.unrar = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=unrar&query=unrar
    # https://www.rarlab.com/
    home.packages = [pkgs.unrar];
  };
}
