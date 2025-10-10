{pkgs, ...}: {
  packages = [
    # https://search.nixos.org/packages?channel=unstable&show=brave&query=brave
    # https://github.com/brave/brave-browser
    pkgs.brave
  ];
}
