{...}: {
  flake.homeModules.openrgb = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/OpenRGB
    # https://search.nixos.org/packages?channel=unstable&show=openrgb&query=openrgb
    # https://gitlab.com/CalcProgrammer1/OpenRGB
    home.packages = [pkgs.openrgb];
  };
}
