{config, ...}: {
  # https://home-manager-options.extranix.com/?query=services.walker&release=master
  # https://github.com/abenz1267/walker
  services.walker = {
    enable = true;

    systemd.enable = true;
  };

  xdg.configFile."walker" = {
    recursive = true;

    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/adrtivv/home/walker/.config/";
  };
}
