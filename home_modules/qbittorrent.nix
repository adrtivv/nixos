{...}: {
  flake.homeModules.qbittorrent = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=qbittorrent&query=qbittorrent
    # https://www.rarlab.com/
    # https://github.com/qbittorrent/qBittorrent
    home.packages = [pkgs.qbittorrent];
  };
}
