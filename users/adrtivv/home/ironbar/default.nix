{
  config,
  pkgs,
  ...
}: {
  # https://search.nixos.org/packages?channel=unstable&show=ironbar&query=ironbar
  # https://github.com/JakeStanger/ironbar
  home.packages = [
    pkgs.ironbar
    # https://github.com/JakeStanger/ironbar/wiki/battery
    pkgs.upower
  ];

  xdg.configFile."ironbar" = {
    recursive = true;

    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/adrtivv/home/ironbar/.config/";
  };
}
