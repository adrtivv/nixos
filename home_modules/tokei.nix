{...}: {
  flake.homeModules.tokei = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=tokei&query=tokei
    # https://www.rarlab.com/
    # https://github.com/XAMPPRocky/tokei
    home.packages = [pkgs.tokei];
  };
}
