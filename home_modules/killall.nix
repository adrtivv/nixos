{...}: {
  flake.homeModules.killall = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/killall
    # https://search.nixos.org/packages?channel=unstable&show=killall&query=killall
    # https://killall.md/
    home.packages = [pkgs.killall];
  };
}
