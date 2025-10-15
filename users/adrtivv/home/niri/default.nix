{
  config,
  lib,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable {
  xdg.configFile."niri" = {
    recursive = true;

    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/adrtivv/home/niri/.config/";
  };
}
