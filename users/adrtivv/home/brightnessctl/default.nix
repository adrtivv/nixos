{pkgs, ...}: {
  home.packages = [
    # https://search.nixos.org/packages?channel=unstable&show=brightnessctl&query=brightnessctl
    pkgs.brightnessctl
  ];
}
