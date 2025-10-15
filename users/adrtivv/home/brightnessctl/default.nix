{pkgs, ...}: {
  home.packages = [
    # https://search.nixos.org/packages?channel=unstable&show=brightnessctl&query=brightnessctl
    # https://github.com/brave/brave-browser
    pkgs.brightnessctl
  ];
}
