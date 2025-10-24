{...}: {
  flake.homeModules.file = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=file&query=file
    # https://darwinsys.com/file/
    home.packages = [pkgs.file];
  };
}
