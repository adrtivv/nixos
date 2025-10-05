{config, ...}: {
  # https://wiki.nixos.org/wiki/Niri#Configuration
  xdg.configFile."niri/config.kdl" = {
    # recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/adrtivv/home/niri/config.kdl";
  };
}
