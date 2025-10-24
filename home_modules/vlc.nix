{...}: {
  flake.homeModules.vlc = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=vlc&query=vlc
    # https://www.videolan.org/vlc/
    home.packages = [pkgs.vlc];
  };
}
